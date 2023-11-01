# AppVeyor Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/appveyor-ci.svg)](https://supermarket.chef.io/cookbooks/appveyor-ci)
[![Build Status](https://img.shields.io/circleci/project/github/sous-chefs/chef-appveyor-ci/master.svg)](https://circleci.com/gh/sous-chefs/chef-appveyor-ci)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

This cookbook:

- Installs the [AppVeyor deployment agent](https://www.appveyor.com/docs/deployment/agent#installing-appveyor-deployment-agent)
- [Triggers a deployment](https://www.appveyor.com/docs/api/environments-deployments#start-deployment) from the Appveyor API

It does not install IIS or any other related services.

## Maintainers

This cookbook is maintained by the Sous Chefs. The Sous Chefs are a community of Chef cookbook maintainers working together to maintain important cookbooks. If you’d like to know more please visit [sous-chefs.org](https://sous-chefs.org/) or come chat with us on the Chef Community Slack in [#sous-chefs](https://chefcommunity.slack.com/messages/C2V7B88SF).

## Requirements

### Chef

- Chef 12.5+

## Platform

- Windows

## Recipes

### default  

Installs the AppVeyor agent

Set the following attributes:

```ruby
node['environment_access_key']
node['deployment_group']
```

For more examples see the test/fixtures directory

## Resources

### Agent Install

```ruby
appveyor_agent '3.12.0' do
  environment_access_key '1234abcd890432kj'
  deployment_group 'test'
end
```

### Deploy

`appveyor_deploy` start the deployment for the specified environment in AppVeyor

```ruby
appveyor_deploy '1.0.269' do
  api_token node['api_token']
  environment_name 'development'
  project_slug 'project-X'
  account_name 'my-account'
end
```

## Contributors

This project exists thanks to all the people who [contribute.](https://opencollective.com/sous-chefs/contributors.svg?width=890&button=false)

### Backers

Thank you to all our backers!

![https://opencollective.com/sous-chefs#backers](https://opencollective.com/sous-chefs/backers.svg?width=600&avatarHeight=40)

### Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website.

![https://opencollective.com/sous-chefs/sponsor/0/website](https://opencollective.com/sous-chefs/sponsor/0/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/1/website](https://opencollective.com/sous-chefs/sponsor/1/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/2/website](https://opencollective.com/sous-chefs/sponsor/2/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/3/website](https://opencollective.com/sous-chefs/sponsor/3/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/4/website](https://opencollective.com/sous-chefs/sponsor/4/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/5/website](https://opencollective.com/sous-chefs/sponsor/5/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/6/website](https://opencollective.com/sous-chefs/sponsor/6/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/7/website](https://opencollective.com/sous-chefs/sponsor/7/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/8/website](https://opencollective.com/sous-chefs/sponsor/8/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/9/website](https://opencollective.com/sous-chefs/sponsor/9/avatar.svg?avatarHeight=100)
