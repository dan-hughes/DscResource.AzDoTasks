param
(
    [Parameter()]
    [System.String]
    $GitVersionVersion = (property GitVersionVersion '5.*')
)

task GitVersionInstall
{
    . Set-SamplerTaskVariable

    try
    {
        Write-Build DarkGray "Installing GitVersion.Tool version '$GitVersionVersion'"

        dotnet tool install --global GitVersion.Tool --version $GitVersionVersion
    }
    catch
    {
        Write-Build Red "Error trying to install GitVersion.Tool"
    }

}
