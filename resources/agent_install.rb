# frozen_string_literal: true

provides :appveyor_agent
provides :appveyor_agent_install
unified_mode true

property :version, String, name_property: true
property :access_key, String, sensitive: true
property :environment_access_key, String, sensitive: true
property :deployment_group, String, required: true
property :installer_url, String, default: lazy { "https://www.appveyor.com/downloads/deployment-agent/#{version}/AppveyorDeploymentAgent.msi" }
property :install_path, String, default: 'C:\\Program Files (x86)\\AppVeyor\\DeploymentAgent\\Appveyor.DeploymentAgent.Service.exe'

default_action :install

action_class do
  def resolved_access_key
    new_resource.access_key || new_resource.environment_access_key
  end
end

action :install do
  raise Chef::Exceptions::ValidationFailed, 'appveyor_agent requires access_key or environment_access_key' if resolved_access_key.nil? || resolved_access_key.empty?

  windows_package 'AppveyorDeploymentAgent' do
    source new_resource.installer_url
    installer_type :msi
    options "/quiet /qn /norestart /log install.log ENVIRONMENT_ACCESS_KEY=#{resolved_access_key} DEPLOYMENT_GROUP=#{new_resource.deployment_group}"
  end
end
