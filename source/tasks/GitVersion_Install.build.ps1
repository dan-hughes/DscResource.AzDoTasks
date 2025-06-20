<#
    .SYNOPSIS
        This is a build task that installs GitVersion.Tool using dotnet.

    .PARAMETER BuildInfo
        The build info object from ModuleBuilder. Defaults to an empty hashtable.

    .NOTES
        This is a build task that is primarily meant to be run by Invoke-Build but
        wrapped by the Sampler project's build.ps1 (https://github.com/gaelcolas/Sampler).
#>

param
(
    # Build Configuration object
    [Parameter()]
    [System.Collections.Hashtable]
    $BuildInfo = (property BuildInfo @{ })
)

task GitVersion_Install {
    . Set-SamplerTaskVariable

    $GitVersionVersion = '5.*'

    if ($BuildInfo.GitVersion.Version)
    {
        $GitVersionVersion = $BuildInfo.GitVersion.Version
    }

    try
    {
        Write-Build DarkGray "Installing GitVersion.Tool version '$GitVersionVersion'"

        Start-Process dotnet -ArgumentList "tool install --global GitVersion.Tool --version $GitVersionVersion" -Wait
    }
    catch
    {
        Write-Build Red "Error trying to install GitVersion.Tool"
    }
}
