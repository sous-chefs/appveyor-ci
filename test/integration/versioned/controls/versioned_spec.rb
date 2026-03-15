# frozen_string_literal: true

control 'appveyor-agent-versioned-01' do
  impact 1.0
  title 'Pinned AppVeyor deployment agent version is installed'

  describe file('C:\\Program Files (x86)\\AppVeyor\\DeploymentAgent\\Appveyor.DeploymentAgent.Service.exe') do
    it { should exist }
  end

  describe command('Write-Host ([System.Diagnostics.FileVersionInfo]::GetVersionInfo("C:\Program Files (x86)\AppVeyor\DeploymentAgent\Appveyor.DeploymentAgent.Service.exe")).FileVersion') do
    its('stdout') { should match(/3.12.0/) }
  end
end
