# Cookbook Name:: appveyor-agent
# Resource:: deploy
#
# Copyright (C) 2016 Dan Webb
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
resource_name :appveyor_deploy

property :build_version, kind_of: String, name_attribute: true, required: true
property :environment_name, kind_of: String, required: true
property :api_token, kind_of: String, required: true
property :account, kind_of: String, required: true
property :project, kind_of: String, required: true

default_action :deploy

action :create do
  chef_gem 'httparty'
  deploy(api_token)
end

def deploy(api_token)
  require 'httparty'
  require 'json'

  body = {
    environmentName: environment_name,
    accountName: account_name,
    projectSlug: project_slug,
    buildVersion: build_version
  }
  response = HTTParty.post('https://ci.appveyor.com/api/deployments',
                           body: body.to_json,
                           headers: { 'Authorization' => "Bearer #{api_token}",
                                      'Content-Type' => 'application/json',
                                      'Accept' => 'application/json'
                                      })
end
