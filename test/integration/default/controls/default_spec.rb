# frozen_string_literal: true

control 'appveyor-agent-default-01' do
  impact 1.0
  title 'AppVeyor deployment agent is installed'

  describe file('C:\\Program Files (x86)\\AppVeyor\\DeploymentAgent\\Appveyor.DeploymentAgent.Service.exe') do
    it { should exist }
  end
end
