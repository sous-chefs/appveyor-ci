# http://www.appveyor.com/downloads/deployment-agent/latest/AppveyorDeploymentAgent.msi

include_recipe 'iis::mod_aspnet45'

appveyor_agent 'latest' do
  access_key node['appveyor']['environment_access_key']
  deployment_group 'web'
end

appveyor_deploy 'latest' do
  environment_name 'appveyor-test'
  api_token node['appveyor']['api_token']
  account node['appveyor']['account']
  project 'test'
end
