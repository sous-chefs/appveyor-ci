# appveyor-ci_appveyor_agent

Installs the AppVeyor deployment agent MSI on Windows hosts.

## Actions

<!-- markdownlint-disable MD060 -->

| Action     | Description                                      |
| ---------- | ------------------------------------------------ |
| `:install` | Installs the AppVeyor deployment agent (default). |

## Properties

| Property                 | Type   | Default                                                                                         | Description                                                           |
| ------------------------ | ------ | ----------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `version`                | String | name property                                                                                   | AppVeyor deployment agent version to install.                         |
| `access_key`             | String | `nil`                                                                                           | Deployment access key used by the agent.                              |
| `environment_access_key` | String | `nil`                                                                                           | Alias for `access_key` for compatibility with existing examples.      |
| `deployment_group`       | String | required                                                                                        | AppVeyor deployment group name.                                       |
| `installer_url`          | String | derived from `version`                                                                          | Custom MSI download URL.                                              |
| `install_path`           | String | `'C:\\Program Files (x86)\\AppVeyor\\DeploymentAgent\\Appveyor.DeploymentAgent.Service.exe'` | Expected installation path.                                           |

<!-- markdownlint-enable MD060 -->

## Examples

### Install the latest agent

```ruby
appveyor_agent 'latest' do
  access_key 'abc123'
  deployment_group 'test'
end
```

### Install a specific version

```ruby
appveyor_agent '3.12.0' do
  environment_access_key 'abc123'
  deployment_group 'production'
end
```
