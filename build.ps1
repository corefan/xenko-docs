 param (
    [switch]$API
 )

# Remove build.log file
If(Test-Path build.log)
{
    Remove-Item build.log
}

# Generate API doc
if ($API)
{
    Write-Host "Generating API documentation..."
    
    # Build metadata from C# source
    deps\docfx\docfx.exe metadata en/docfx.json | Tee-Object -FilePath build.log -Append

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
deps\docfx\docfx.exe build en\docfx.json | Tee-Object -FilePath build.log -Append

# Copy extra items
Copy-Item robots.txt _site/
Copy-Item ReleaseNotes/ReleaseNotes.md _site/ReleaseNotes/
Copy-Item studio_getting_started_links.txt _site/
