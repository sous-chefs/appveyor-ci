require 'serverspec'

set :backend, :cmd
set :os, family: 'windows'

describe file('C:\\Program Files\\AppVeyor\\DeploymentAgent\\Appveyor.DeploymentAgent.Service.exe') do
  it { should exist }
end

describe service('W3SVC') do
  it { should be_running }
end

describe service('Appveyor.DeploymentAgent') do
  it { should be_running }
end
