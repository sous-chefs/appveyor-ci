#
# Cookbook Name:: appveyorapi
# Recipe:: default
#
# Copyright (c) 2015 J Sainsbury, Plc., All Rights Reserved.

appveyor_agent 'latest' do
  access_key node['environment_access_key']
  deployment_group node['deployment_group']
end
