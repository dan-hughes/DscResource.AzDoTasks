param ()

task GitVersion_Calculate_Module_Version {
    $gitVersionObject = dotnet-gitversion | ConvertFrom-Json

    $gitVersionObject.PSObject.Properties.ForEach{
        Write-Host -Object "Setting Task Variable '$($_.Name)' with value '$($_.Value)'."
        Write-Host -Object "##vso[task.setvariable variable=$($_.Name);]$($_.Value)"
    }

    Write-Host -Object "##vso[build.updatebuildnumber]$($gitVersionObject.FullSemVer)"
}
