# Migrating to `appveyor_agent`

This cookbook now exposes its AppVeyor Deployment Agent configuration through the
`appveyor_agent` custom resource. It no longer provides a default recipe or node
attribute interface.

Replace recipe inclusion and node attributes with an explicit resource:

```ruby
appveyor_agent 'latest' do
  environment_access_key 'your-environment-access-key'
  deployment_group 'production'
end
```

Use the `access_key` property if that name better fits your policy data. Both key
properties are sensitive. To uninstall the MSI package, declare the same resource
with `action :remove`.

The resource's public properties and examples are documented in
[documentation/appveyor-ci_appveyor_agent.md](documentation/appveyor-ci_appveyor_agent.md).
