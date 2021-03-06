# SolarWinds Snap Agent Chef recipes
[![CircleCI](https://circleci.com/gh/solarwinds/swisnap-cookbook.svg?style=shield)](https://circleci.com/gh/solarwinds/swisnap-cookbook)

Chef recipes and resources for SolarWinds Snap Agent Linux and Windows installation.

## Table of contents
  * [Usage](#usage)
  * [Attributes](#attributes)

## Usage

* Download `swisnap` recipes to your Chef server.

Using Berkshelf:

```
# add to Berksfile
cookbook 'swisnap'
```
Or using Knife tool:

```
knife cookbook site install swisnap
```
* Download recipe dependencies (SolarWinds Snap Agent has dependency to PackageCloud Chef recipes).

* Change attribute `['swisnap']['solarwinds_token']` from `SOLARWINDS_TOKEN`, to your AppOptics API token in [attributes/default.rb](attributes/default.rb).

* Send to Chef Server up-to-date version of recipes and its dependencies.

```
berks upload swisnap
```

```
knife cookbook upload swisnap --include-dependencies
```

* Add `swisnap::default` recipe to run list of desired nodes, which shall be monitored:

```
recipe[swisnap::default]
```

* Run `chef-infra`, on Chef nodes by manual trigger, or by using another recipe for scheduled triggers if enabled.

## Attributes

[default.rb file](attributes/default.rb) represents various attributes releated to SolarWinds Snap Agent instalation and runtime. Depending on the needs they can be altered to modify Agent configuration.

```
['swisnap']['swisnap_log_level']
['swisnap']['swisnap_log_format']
```
Logging level and log format. Default value is `warning` and `text`.

```
['swisnap']['swisnap_plugin_trust_level']
['swisnap']['swisnap_keyring_paths']
```
Plugin trust level for swisnapd. When enabled, only signed plugins that can be verified will be loaded into swisnapd. Signatures are verified from keyring files specified in `swisnap_keyring_path`. Valid values are 0 - Off, 1 - Enabled, 2 - Warning. Default value is 1 - Enabled. If this is not set, then agent will use default enabled level.

```
['swisnap']['swisnap_tls_cert_path']
['swisnap']['swisnap_tls_key_path']
['swisnap']['swisnap_plugin_tls_cert_path']
['swisnap']['swisnap_plugin_tls_key_path']
['swisnap']['swisnap_ca_cert_paths']
```
Secure plugin communication optional parameters.

```
['swisnap']['swisnap_plugin_load_timeout']
```
The maximal time allowed for a plugin to load. Default value is 30.

```
['swisnap']['swisnap_global_tags']
```
Tags that will be applied to collected metrics across all tasks. They should be set as Hash (key => value) format.

```
['swisnap']['swisnap_restapi_enable']
['swisnap']['swisnap_restapi_rest_auth']
['swisnap']['swisnap_restapi_rest_auth_password']
['swisnap']['swisnap_restapi_rest_certificate']
['swisnap']['swisnap_restapi_rest_key']
['swisnap']['swisnap_restapi_addr']
['swisnap']['swisnap_restapi_plugin_load_timeout']
```
Optional REST API parameters. By default REST API is enabled.


*Note: below attributes are OS specific (different for Linux and Windows).*

```
['swisnap']['swisnap_auto_discover_path']
```
Path to SolarWinds Snap Agent's autoload directory for V1 plugins.

```
['swisnap']['swisnap_log_path']
```
Path to log file for Snap.

```
['swisnap']['swisnap_plugin_config_dir']
```
Path to SolarWinds Snap Agent's plugin configuration files.

```
['swisnap']['swisnap_plugin_path']
```
Path where SolarWinds Snap Agent's plugins binaries are stored.

```
['swisnap']['swisnap_tasks_autoload_path']
```
Path to SolarWinds Snap Agent's V2 tasks files.

```
['swisnap']['swisnap_task_path']
```
Path to SolarWinds Snap Agent's V1 tasks files.

*Below attributes are releated to Publishers plugins configuration*

```
['swisnap']['swisnap_hostname_alias']
```
Hostname alias for the server which will be used in AppOptics UI.

```
['swisnap']['swisnap_proxy_url']
['swisnap']['swisnap_proxy_user']
['swisnap']['swisnap_proxy_password']
```
Optional proxy settings.

```
default['swisnap']['swisnap_host_check_timeout']
```
swisnap_host_check_timeout allows to configure timeout for querying host operating system for identification informations. Default value is set to 5s.

```
['swisnap']['swisnap_floor_seconds']
```
Whether to floor timestamps to a specific interval, default value is 60 seconds.

```
['swisnap']['swisnap_period']
```
Metrics interval period to report to AppOptics API, default value is 60 seconds.

```
['swisnap']['swisnap_ec2_check_timeout']
```
swisnap_ec2_check_timeout allows to configure timeout for querying EC2 instance metadata URL to determine if host agent is running on EC2 (or OpenStack) instance. By default it is set to 1s.

```
['swisnap']['swisnap_ec2_check_retries']
```
swisnap_ec2_check_retries allows to configure number of retries for querying EC2 instance metadata URL to determine if host agent is running on EC2 (or OpenStack) instance. By default it is set to 3.
