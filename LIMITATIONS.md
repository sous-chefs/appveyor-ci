# AppVeyor Deployment Agent Limitations

- The AppVeyor deployment agent is Windows-only; this cookbook should only advertise and test Windows support.
- Installation depends on the public MSI download endpoint at `https://www.appveyor.com/downloads/deployment-agent/<version>/AppveyorDeploymentAgent.msi`.
- The resource expects an AppVeyor deployment access key and deployment group at converge time.
