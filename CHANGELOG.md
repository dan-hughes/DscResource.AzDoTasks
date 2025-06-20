# Changelog for DscResource.AzDoTasks

The format is based on and uses the types of changes according to [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Fixed

- Updated pipeline to be able to self-test the tasks.
- Allow GitVersion Version to be configurable.

### Added

- Tasks:
  - `GitVersion_Install`
  - `GitVersion_Calculate_Module_Version`
  - `CodeCov_Install_CLI`
  - `CodeCov_Upload_Result`
