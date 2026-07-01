# AGENTS.md

## Cookbook Purpose

Installs AppVeyor Agent & Triggers Deployment

## Agent Findings

* This cookbook is in an incremental modernization pass. Preserve existing public recipes and attributes unless a later full migration is explicitly selected.
* Dependency management should use `Policyfile.rb`; do not reintroduce Berkshelf.

## Known Limitations

* The AppVeyor deployment agent is Windows-only; this cookbook should only advertise and test Windows support.
* Installation depends on the public MSI download endpoint at `https://www.appveyor.com/downloads/deployment-agent/<version>/AppveyorDeploymentAgent.msi`.
* The resource expects an AppVeyor deployment access key and deployment group at converge time.
