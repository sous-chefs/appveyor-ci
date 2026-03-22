# frozen_string_literal: true

require 'spec_helper'

describe 'appveyor_agent' do
  step_into :appveyor_agent
  platform 'windows', '2019'

  context 'with access_key' do
    recipe do
      appveyor_agent 'latest' do
        access_key 'abc123'
        deployment_group 'test'
      end
    end

    it do
      is_expected.to install_windows_package('AppveyorDeploymentAgent').with(
        source: 'https://www.appveyor.com/downloads/deployment-agent/latest/AppveyorDeploymentAgent.msi',
        installer_type: :msi,
        options: '/quiet /qn /norestart /log install.log ENVIRONMENT_ACCESS_KEY=abc123 DEPLOYMENT_GROUP=test'
      )
    end
  end

  context 'with environment_access_key' do
    recipe do
      appveyor_agent '3.12.0' do
        environment_access_key 'def456'
        deployment_group 'deploy'
      end
    end

    it do
      is_expected.to install_windows_package('AppveyorDeploymentAgent').with(
        source: 'https://www.appveyor.com/downloads/deployment-agent/3.12.0/AppveyorDeploymentAgent.msi',
        options: '/quiet /qn /norestart /log install.log ENVIRONMENT_ACCESS_KEY=def456 DEPLOYMENT_GROUP=deploy'
      )
    end
  end
end
