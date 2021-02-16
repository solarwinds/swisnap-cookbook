# Solarwinds Snap Agent Chef recipes
Chef recipes and resources for SolarWinds Snap Agent Linux and Windows installation.

## Table of contents
  * [About](#about)
  * [Usage](#usage)
  * [Attributes](#attributes)

## About


## Usage

Clone repoitory


Download recipe dependencied (Packagecloud Chef recipes)

Update SOLARWINDS_TOKEN, with your App-Opptics API token in [recipes/default.rb](recipes/default.rb). 

Send to Chef Server up-to-date version of recipes and dependency.
knife upload

Add to run list for desired nodes:
`recipe[swisnap::default]`

Wait for next scheduled trigger of chef0infra or manually trigger it.

## Attributes

[default.rb file](attributes/default.rb) represents various attributes releated to SolarWinds Snap Agent instalation and runtime. Depending on the needs they can be altered to modify Agent configuration.

```
['swisnap']['swisnap_log_level'] = 'info'
['swisnap']['swisnap_log_format'] = ''
```
Logging level and log format.
```
['swisnap']['swisnap_plugin_trust_level'] = ''
['swisnap']['swisnap_keyring_paths'] = ''
```
Plugin trust level for swisnapd. When enabled, only signed plugins that can be verified will be loaded into swisnapd. Signatures are verified from keyring files specified in `swisnap_keyring_path`. Valid values are 0 - Off, 1 - Enabled, 2 - Warning

```
['swisnap']['swisnap_tls_cert_path'] = ''
['swisnap']['swisnap_tls_key_path'] = ''
['swisnap']['swisnap_plugin_tls_cert_path'] = ''
['swisnap']['swisnap_plugin_tls_key_path'] = ''
['swisnap']['swisnap_ca_cert_paths'] = ''
```
Secure plugin communication optional parameters.
```
['swisnap']['swisnap_plugin_load_timeout'] = ''
```
The maximal time allowed for a plugin to load. Default value is 30.
```
['swisnap']['swisnap_global_tags'] =  {}
```
Tags that will be applied to collected metrics across tasks.
```
['swisnap']['swisnap_restapi_enable'] = true
['swisnap']['swisnap_restapi_rest_auth'] = ''
['swisnap']['swisnap_restapi_rest_auth_password'] = ''
['swisnap']['swisnap_restapi_rest_certificate'] = ''
['swisnap']['swisnap_restapi_rest_key'] = ''
['swisnap']['swisnap_restapi_addr'] = ''
['swisnap']['swisnap_restapi_plugin_load_timeout'] = ''
```
Optional REST API parameters. By default REST API is enabled.

