# AppVeyor Cookbook

This cookbook
- Installs the [AppVeyor deployment agent](https://www.appveyor.com/docs/deployment/agent#installing-appveyor-deployment-agent)
- [Triggers a deployment](https://www.appveyor.com/docs/api/environments-deployments#start-deployment) from the Appveyor API

It does not install IIS or any other related services.

## Requirements
### Chef
- Chef 12.5+

## Platform
- Windows

## Recipes
### default  
Installs the AppVeyor agent

Set the following attributes:
```
node['environment_access_key']
node['deployment_group']
```

For more examples see the test/fixtures directory
## Resources
### Agent Install
```ruby
appveyor_agent '3.12.0' do
  environment_access_key '1234abcd890432kj'
  deployment_group 'test'
end
```

### Start Deployment
The `appveyorapi_deploy` LWRP can be used to start the deployment for the specified environment in Appveyor CI using its API.

```ruby
appveyorapi_deploy 'project-production' do
  api_token '1234abcd890432kj'
  account 'serviceaccount'
  project 'project'
  buildversion '1.0.1'
end
```

#### Attributes
- `name` - Environment name in Appveyor. It could be any Environment like Agent, FTP, Azure, etc.,
- `account` - Account which has privilege to start the deployment in Appveyor.
- `api_token` - API token for the service account in Appveyor.
- `project` - Name of the build project in the Appveyor to be deployed in the specified environment.
- `buildversion` - (optional) Build version of the project to be deployed in the specified environment. If it is not specified, cookbook will deploy the last successfully deployed build version. If you specify it as `latest` then it builds latest build for that project.
