 param (
    [switch]$API
 )

# Remove build.log file
If(Test-Path build.log)
{
    Remove-Item build.log
}
Start-Transcript -Path build.log
# Generate API doc
if ($API)
{
    Write-Host "Generating API documentation..."
    
    # Build metadata from C# source
   deps\docfx\docfx.exe metadata

    Write-Host "Start Namespace build"
    function getNamespaceFilesLocation
    {
        # Check the source code location
        $projectLocationConfig = ((Get-Content docfx.json) | Select-String -Pattern '"cwd":').ToString().Trim() -split ":";
        $global:namespaceSrcLocation = $projectLocationConfig[1] -replace '[",\s]', '';
    }

    function getAllNamespaceFiles
    {    
        $global:namespaceFiles = Get-ChildItem "$namespaceSrcLocation" -Include "*Namespace*" -Recurse -Name
    }

    function getAllDescriptionFiles($searchTag)
    {
        $global:descriptionFiles = @();
        $searchTagInner = "<" + $searchTag + ">" 
        for($i = 0; $i -lt $namespaceFiles.length; $i++){
            $currentFile = $namespaceFiles[$i]
            if(((Get-Content "$namespaceSrcLocation/$currentFile") | Select-String -Pattern $searchTagInner).length -gt 0){
               $global:descriptionFiles += $currentFile
            }
        }
    }

    function getDescription($searchTag)
    {
       $searchTagStart = "<" + $searchTag + ">"
       $searchTagEnd = "</" + $searchTag + ">"
       $global:descriptionStringArray = @();
       $global:descriptionFileNameArray = @();
       for($i = 0; $i -lt $descriptionFiles.length; $i++){
           $descriptionString = @();
           $currentFile = $descriptionFiles[$i]
           $currentFileContent = (Get-Content "$namespaceSrcLocation/$currentFile")

           $searchDescriptionStart = ( $currentFileContent | Select-String -Pattern $searchTagStart)
           $searchDescriptionEnd = ( $currentFileContent | Select-String -Pattern $searchTagEnd)
           $startStringNumber = $currentFileContent.IndexOf($searchDescriptionStart);
           $endStringNumber = $currentFileContent.IndexOf($searchDescriptionEnd);
           if($startStringNumber -eq $endStringNumber){
              $descriptionString = $currentFileContent[$startStringNumber] -replace '"', '\"'
           } else {
               for($j = $startStringNumber; $j -le $endStringNumber; $j++){
                    $descriptionString += $currentFileContent[$j] -replace '"', '\"'
               }
           }
           $global:descriptionStringArray += ($descriptionString -replace "[\n///]", '' -replace "$searchTagStart", "").Trim() | where {$_ -ne ""}
           $namespaceString = $currentFileContent | Select-String -Pattern 'namespace ';
           $global:descriptionFileNameArray +=  (($namespaceString -split '\s')[1]).Trim()
       }
    }

    function copyDescription($searchTag)
    {
        $folder = 'api/';
        $format = '.yml';
        for($i = 0; $i -lt $global:descriptionFileNameArray.Length; $i++){
            $currentFile = $global:descriptionFileNameArray[$i];
            if(Test-Path "$folder$currentFile$format"){
                $currentContent = (Get-Content "$folder$currentFile$format");
                if(($currentContent | Select-String -Pattern $searchTag).length -le 0){
                    $breakpoint = $currentContent.IndexOf('  children:');
                    $file = @();
                    for($j = 0; $j -lt $breakpoint; $j++){
                      $file += $currentContent[$j]
                    }
                    $file += "  "+ $searchTag + ": " + '"\n' + $global:descriptionStringArray[$i] + '\n"'
                    for($j = $breakpoint; $j -lt $currentContent.Length; $j++){
                      $file += $currentContent[$j]
                    }
                    $file | Out-file $folder$currentFile$format
                }
            } else {
                continue
            }
            
        }
    }

    getNamespaceFilesLocation
    getAllNamespaceFiles
    function setDescription($searchTag)
    {
        Write-Host "Set description for: $searchTag"
        getAllDescriptionFiles($searchTag)
        getDescription($searchTag)
        copyDescription($searchTag)
    }

    $tagArray = 'remarks', 'summary';
    $k = 0;
    while($k -lt $tagArray.Length){
       setDescription($tagArray[$k]) 
       $k++
    }

    Write-Host "Generating types of items..."

    # Get all text from api/toc.yml
    $textYaml = (Get-Content api\toc.yml);
    # Set start variable for toc files source
    $folder = "api\"
    $format = ".yml"
    # Start copy strings from api/toc.yml to temporary file
    $isfile2 = Test-Path temporaryTypeToc.yml
    if($isfile2 -eq 'True'){
        Remove-Item temporaryTypeToc.yml
    }

    function setTypesToTOCItems($i){
        # if string is uid of item 
        if($textYaml[$i].Contains('- uid:')){
            # Copy the uid string
            $textYaml[$i] | Out-file temporaryTypeToc.yml -append
            # Open file of this class and find type of the uid
            $lineEdited = $textYaml[$i].replace('- uid:', '').replace(' ', '').replace('`', '-')
            $content = (Get-Content "$folder$lineEdited$format");
            for($k = 0; $k -lt $content.length; $k++){
                if($content[$k].Contains('type:')){
                    if($textYaml[$i][0] -eq ' '){
                        $typeLine = $content[$k]
                        "  $typeLine" | Out-file temporaryTypeToc.yml -append
                    } else {
                        $content[$k] | Out-file temporaryTypeToc.yml -append
                    }
                   break
                }
            }
        } else {
            $textYaml[$i] | Out-file temporaryTypeToc.yml -append
        }
    }
    $lineCounter = 0;
    While ($lineCounter -lt $textYaml.length){
        setTypesToTOCItems($lineCounter);
        $lineCounter++ 
    }

    '' | Set-Content api\toc.yml
    (Get-Content temporaryTypeToc.yml) | Set-Content api\toc.yml
    Remove-Item temporaryTypeToc.yml

    # Remove SiliconStudio namespace prefix from TOC
    (Get-Content api\toc.yml).replace('  name: SiliconStudio.', '  name: ') | Set-Content api\toc.yml
}
else
{
    If(Test-Path api/.manifest)
    {
        Write-Host "Erasing API documentation..."
        Remove-Item api/*yml -recurse
        Remove-Item api/.manifest 
    }
}

Write-Host "Generating documentation..."

# Output to both build.log and console
deps\docfx\docfx.exe build

# Copy extra items
Copy-Item ReleaseNotes/ReleaseNotes.md _site/ReleaseNotes/
Copy-Item studio_getting_started_links.txt _site/
Stop-Transcript