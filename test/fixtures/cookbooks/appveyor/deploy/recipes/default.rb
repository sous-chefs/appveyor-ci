# http://www.appveyor.com/downloads/deployment-agent/latest/AppveyorDeploymentAgent.msi

include_recipe 'iis::mod_aspnet45'

appveyor_agent 'latest' do
  access_key node['environment_access_key']
  deployment_group 'web'
end

appveyor_deploy '1.0.269' do
  api_token node['api_token']
  environment_name node['environment_name']
  project_slug node['project_slug']
  account_name node['account_name']
end
