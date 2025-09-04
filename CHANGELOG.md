# CHANGELOG

This file is used to list changes made in each version of the Appveyor-api cookbook.
This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 0.2.10 - *2025-09-04*

## 0.2.9 - *2024-05-06*

## 0.2.8 - *2024-05-06*

## 0.2.7 - *2023-10-03*

## 0.2.6 - *2023-06-01*

## 0.2.5 - *2023-05-03*

## 0.2.4 - *2023-03-02*

- Add workflows

## 0.2.3 - *2023-03-01*

- Update workflows to 2.0.1
- Remove mdl and replace with markdownlint-cli2
- Remove delivery folder

## 0.2.2 - *2021-08-29*

- Standardise files with files in sous-chefs/repo-management
- Add a `resource_name` in addition to provides in the resource
- Fix `nodoc` option for gem

## 0.2.1 - 2020-06-02

- resolved cookstyle error: resources/agent_install.rb:20:1 warning: `ChefDeprecations/ResourceUsesOnlyResourceName`

## [0.2.0] - 2018-05-21

- Move to the Sous-Chefs organization
- Test with delivery
- Use the `windows_package` resource instead of the package resource

## [0.1.4] - 2016-10-11

- Update Gem deps inline with Chefdk 0.18
- Windows cookbook dep
- Reg key creation in favour of agent switch

## [0.1.3] - 2016-09-23

- Uses HTTPS for download the agent
- Kitchen testing in AppVeyor
