appveyor_agent 'latest' do
  access_key node['environment_access_key']
  deployment_group 'test'
end
