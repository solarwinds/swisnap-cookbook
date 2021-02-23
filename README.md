# Solarwinds Snap Agent Chef recipes
Chef recipes and resources for SolarWinds Snap Agent Linux and Windows installation.

## Table of contents
  * [Usage](#usage)
  * [Attributes](#attributes)

## Usage

* As these recipes are not yet published to Chef Supermarket, clone this repository in to `swisnap` directory.
```
git clone git@github.com:librato/swisnap-cookbook.git swisnap
```

* Download recipe dependencies (SolarWinds Snap Agent has dependency to PackageCloud Chef recipes).

* Update SOLARWINDS_TOKEN, with your App-Opptics API token in [recipes/default.rb](recipes/default.rb).

* Send to Chef Server up-to-date version of recipes and its dependencies.
```
knife cookbook upload swisnap --include-dependencies
```

* Add to run list for desired nodes:
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
