# http://www.appveyor.com/downloads/deployment-agent/latest/AppveyorDeploymentAgent.msi

include_recipe 'iis::mod_aspnet45'

appveyor_agent 'latest' do
  access_key node['environment_access_key']
  deployment_group 'web'
end

appveyor_deploy 'test-production' do
  api_token node['api_token']
  project 'test'
  account node['account']
end
