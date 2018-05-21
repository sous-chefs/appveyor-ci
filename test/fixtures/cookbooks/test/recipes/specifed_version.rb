appveyor_agent '3.12.0' do
  access_key node['environment_access_key']
  deployment_group 'test'
end
