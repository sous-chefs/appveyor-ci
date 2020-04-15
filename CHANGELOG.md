# CHANGELOG

This file is used to list changes made in each version of the Appveyor-api cookbook.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

- resolved cookstyle error: Dangerfile:28:1 convention: `Style/SignalException`
- resolved cookstyle error: Dangerfile:34:3 convention: `Style/SignalException`

## [0.2.0] - 2018-05-21
### Changed
- Move to the Sous-Chefs organization
- Test with delivery
- Use the `windows_package` resource instead of the package resource

## [0.1.4] - 2016-10-11
### Changed
- Update Gem deps inline with Chefdk 0.18
### Removed
- Windows cookbook dep
- Reg key creation in favour of agent switch

## [0.1.3] - 2016-09-23
### Changed
- Uses HTTPS for download the agent
### Fixed
- Kitchen testing in AppVeyor
