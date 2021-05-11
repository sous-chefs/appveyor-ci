# CHANGELOG

This file is used to list changes made in each version of the Appveyor-api cookbook.
This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## UNRELEASED

- resolved cookstyle error: resources/agent_install.rb:1:1 refactor: `Chef/Deprecations/ResourceWithoutUnifiedTrue`
- Add a resource_name in addition to provides in the resource
- Fix nodoc option for gem

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
