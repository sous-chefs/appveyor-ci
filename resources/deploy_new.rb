# # Cookbook Name:: appveyor-agent
# # Resource:: deploy
# #
# # Copyright (C) 2016 J Sainsburys PLC
# #
# # Licensed under the Apache License, Version 2.0 (the "License");
# # you may not use this file except in compliance with the License.
# # You may obtain a copy of the License at
# #
# #     http://www.apache.org/licenses/LICENSE-2.0
# #
# # Unless required by applicable law or agreed to in writing, software
# # distributed under the License is distributed on an "AS IS" BASIS,
# # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# # See the License for the specific language governing permissions and
# # limitations under the License.
# #
#
# resource_name :appveyor_deploy
#
# property :build_version, kind_of: String, name_attribute: true, required: true
# property :environment_name, kind_of: String, required: true
# property :api_token, kind_of: String, required: true
# property :account, kind_of: String, required: true
# property :project, kind_of: String, required: true
#
# default_action :deploy
#
# @projects_api = 'https://ci.appveyor.com/api/projects'
# @environments_api = 'https://ci.appveyor.com/api/environments'
# @deployments_api = 'https://ci.appveyor.com/api/deployments'
#
# action :deploy do
#   chef_gem 'httparty'
#   require 'httparty'
#   require 'json'
#   if start_deploy == 200
#     Chef::Log.info 'Deployed successfully'
#   else
#     Chef::Log.error 'Failed to deploy'
#   end
# end
#
# def start_deploy
#
#   body = '{
#       "environmentName": "#{environment_name}",
#       "accountName": "serviceAccount",
#       "projectSlug": "#{project}",
#       "buildVersion": "1.0.11"
#   }'
#   JSON.parse(body)
#
#   response = HTTParty.post(
#     deployments_api,
#     body: json.to_json,
#     headers: {
#       'Authorization' => "Bearer #{api_token}",
#       'Content-Type' => 'application/json',
#       'Accept' => 'application/json' },
#     debug_output: $stdout)
#   response.code
# end
#
# def start_deploy_body
#   require 'httparty'
# end
#
# def start_deploy_json
#   parsed = start_deploy_body
#   parsed['environmentName'] = environment_by_name
#   parsed['accountName'] = account
#   parsed['projectSlug'] = project_by_name
#   parsed['buildVersion'] = if buildversion.nil?
#                              build_by_deploy
#                            elsif buildversion == 'latest'
#                              build_latest_version
#                            else
#                              build_by_version
#                            end
#   parsed
# end
#
#
# def build_by_version
#   response = HTTParty.get(
#     "#{projects_api}/#{account}/#{project}/build/#{buildversion}",
#     headers: { 'Authorization' => "Bearer #{api_token}" })
#   raise "Build number #{buildversion} not found" unless response.code == 200
#   response['build']['version']
# end
#
# def build_latest_version
#   response = HTTParty.get(
#     "#{projects_api}/#{account}/#{project}",
#     headers: { 'Authorization' => "Bearer #{api_token}" })
#   raise 'Unable to find the latest Build number' unless response.code == 200
#   response['build']['version']
# end
#
# def project_by_name
#   projects = HTTParty.get(
#     projects_api,
#     headers: { 'Authorization' => "Bearer #{api_token}" })
#   response = false
#   projects.each do |proj|
#     response = true if proj['name'] == project
#   end
#   raise "Unable to find the project #{project}" unless response == true
#   project
# end
#
# def environment_by_name
#   environments = HTTParty.get(
#     environments_api,
#     headers: { 'Authorization' => "Bearer #{api_token}" })
#   response = false
#   environments.each do |env|
#     response = true if env['name'] == name
#   end
#   raise "Unable to find the environment #{name}" unless response == true
#   name
# end
#
# def env_id
#   environments = HTTParty.get(
#     environments_api,
#     headers: { 'Authorization' => "Bearer #{api_token}" }) if environment_by_name
#   environments.each do |env|
#     return env['deploymentEnvironmentId'] if env['name'] == name
#   end
# end
#
# def build_by_deploy
#   envdeployments = HTTParty.get(
#     "#{environments_api}/#{env_id}/deployments",
#     headers: { 'Authorization' => "Bearer #{api_token}" })
#   envdeployments['deployments'].each do |d|
#     if d['deployment']['build']['status'] == 'success'
#       return d['deployment']['build']['version']
#     end
#   end
# end