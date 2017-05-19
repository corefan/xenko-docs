If(Test-Path jp_tmp){
    Remove-Item jp_tmp/* -recurse
}
Else{   
    New-Item -Path 'jp_tmp' -ItemType "directory"
}
Copy-Item en/* -Recurse jp_tmp -Force
$posts = Get-ChildItem jp_tmp/manual/*.md -Recurse -Force
Write-Host "Start write files:"
Foreach ($post in $posts)
{    
    
    $data = Get-Content $post
    $i = 0;
    Foreach ($line in $data)
    {    
        $i++
        if ($line.length -le 0) 
        {
           Write-Host $post
           $data[$i-1]="<div class='doc-no-translated'/>"
           $data | out-file $post  
           break
        } 
    }
}

Write-Host "End write files"
Copy-Item jp/manual -Recurse jp_tmp -Force
Copy-Item en/docfx.json jp_tmp -Force
(Get-Content jp_tmp/docfx.json) -replace "_site/en","_site/jp" | Set-Content jp_tmp/docfx.json
deps\docfx\docfx.exe build jp_tmp\docfx.json | Tee-Object -FilePath build.log -Append
Remove-Item jp_tmp -recurse 
