# Limitations

## Platform and package availability

The AppVeyor Deployment Agent is a Windows MSI package. AppVeyor documents support
for Windows Server 2012 (Windows 8) and newer, with .NET Framework 4.5.2 or newer.
This cookbook therefore supports Windows only; it has no APT, DNF/YUM, Zypper, or
source-install path.

## Architecture and installation

The vendor publishes the agent from the HTTPS deployment-agent endpoint. The
resource uses the vendor's unattended MSI arguments and requires an AppVeyor
environment access key plus deployment group at converge time. The key is marked
sensitive and must be supplied through Chef data, not committed to the cookbook.

## Testing constraint

Installing the real agent requires a valid AppVeyor environment access key and
network access to the vendor MSI endpoint. ChefSpec covers the resource contract;
integration runs require a Windows host and suitable non-production credentials.
