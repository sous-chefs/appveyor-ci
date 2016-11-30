require 'serverspec'

set :backend, :cmd
set :os, family: 'windows'

describe file('C:\\Program Files\\AppVeyor\\DeploymentAgent\\Appveyor.DeploymentAgent.Service.exe') do
  it { should exist }
end
