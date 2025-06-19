<#
    .SYNOPSIS
        This is a build task that uploads code coverage results to the CodeCov Service.

    .PARAMETER OutputDirectory
        The base directory of all output. Defaults to folder 'output' relative to
        the $BuildRoot.

    .PARAMETER PesterOutputFolder
        The directory of test result output. Defaults to folder 'testResults'.

    .PARAMETER BuildInfo
        The build info object from ModuleBuilder. Defaults to an empty hashtable.

    .NOTES
        This is a build task that is primarily meant to be run by Invoke-Build but
        wrapped by the Sampler project's build.ps1 (https://github.com/gaelcolas/Sampler).
#>
param
(
    [Parameter()]
    # Base directory of all output (default to 'output')
    [System.String]
    $OutputDirectory = (property OutputDirectory (Join-Path $BuildRoot 'output')),

    [Parameter()]
    [System.String]
    $PesterOutputFolder = (property PesterOutputFolder 'testResults'),

    # Build Configuration object
    [Parameter()]
    [System.Collections.Hashtable]
    $BuildInfo = (property BuildInfo @{ })
)

task CodeCov_Upload_Result {
    # Get the values for task variables, see https://github.com/gaelcolas/Sampler#task-variables.
    . Set-SamplerTaskVariable

    $PesterOutputFolder = Get-SamplerAbsolutePath -Path $PesterOutputFolder -RelativeTo $OutputDirectory

    "`tPester Output Folder            = '$PesterOutputFolder'"

    $CodeCoverageMergedOutputFile = 'CodeCov_Merged.xml'

    if ($BuildInfo.CodeCoverage.CodeCoverageMergedOutputFile)
    {
        $CodeCoverageMergedOutputFile = $BuildInfo.CodeCoverage.CodeCoverageMergedOutputFile
    }

    $CodeCoverageMergedOutputFile = Get-SamplerAbsolutePath -Path $CodeCoverageMergedOutputFile -RelativeTo $PesterOutputFolder

    "`tCode Coverage Merge Output File = $CodeCoverageMergedOutputFile"

    Write-Build White "Uploading Code Coverage to CodeCov"

    ./codecov upload-process -f $CodeCoverageMergedOutputFile
}
