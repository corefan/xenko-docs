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
            }       
        }
    }

    getNamespaceFilesLocation
    getAllNamespaceFiles
    function setDescription($searchTag)
    {
        Write-Host "Set description for: $searchTag"
        $global:descriptionFiles = @();
		$global:descriptionStringArray = @();
		$global:descriptionFileNameArray = @();
        getAllDescriptionFiles($searchTag)
        getDescription($searchTag)
        copyDescription($searchTag)
    }
	$global:descriptionFiles = @(); # free memory
	$global:descriptionStringArray = @(); # free memory
	$global:descriptionFileNameArray = @(); # free memory

    $tagArray = 'remarks', 'summary';
	for($k = 0; $k -lt $tagArray.length; $k++){
       setDescription($tagArray[$k]) 
    }
	
	

    Write-Host "Generating types of items..."

    # Get all text from api/toc.yml
    $textYaml = (Get-Content api\toc.yml);
    # Set start variable for toc files source
    $folder = "api\"
    $format = ".yml"

    function setTypesToTOCItems($i){
		# Copy the uid string
		$global:temporaryTypeToc += $textYaml[$i] + "`n"
		
        # if string is uid of item 
        if($textYaml[$i].Contains('- uid:')){
            # Open file of this class and find type of the uid
            $lineEdited = $textYaml[$i].replace('- uid:', '').replace(' ', '').replace('`', '-')
            $content = (Get-Content "$folder$lineEdited$format");
            for($k = 0; $k -lt $content.length; $k++){
                if($content[$k].Contains('type:')){
                    if($textYaml[$i][0] -eq ' '){
                        $typeLine = $content[$k]
                        $global:temporaryTypeToc += "  $typeLine" + "`n"
                    } else {
                        $global:temporaryTypeToc += $typeLine + "`n"
                    }
                   break
                }
            }
		}
    }
	
	$global:temporaryTypeToc = "";
	for($lineCounter = 0; $lineCounter -lt $textYaml.length; $lineCounter++){
        setTypesToTOCItems($lineCounter);
    }

	($global:temporaryTypeToc) | Out-file api\toc.yml
	$global:temporaryTypeToc = ""; # free memory

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