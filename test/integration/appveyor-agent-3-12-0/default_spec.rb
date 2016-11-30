describe file('C:\\Program Files\\AppVeyor\\DeploymentAgent\\Appveyor.DeploymentAgent.Service.exe') do
  it { should exist }
end

describe command('Write-Host ([System.Diagnostics.FileVersionInfo]::GetVersionInfo("C:\Program Files\AppVeyor\DeploymentAgent\Appveyor.DeploymentAgent.Service.exe")).FileVersion') do
  its(:stdout) { should match(/3.12.0/) }
end
