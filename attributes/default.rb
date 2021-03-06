## SolarWinds Token that will be passed to SolarWinds Snap Agent
default['swisnap']['solarwinds_token'] = 'SOLARWINDS_TOKEN'

## SolarWinds Snap Agent name
default['swisnap']['swisnap_package_name'] = 'solarwinds-snap-agent'

## Logging level and log format. Default value is warning and text.
default['swisnap']['swisnap_log_level'] = 'warning'
default['swisnap']['swisnap_log_format'] = ''

## Plugin trust level for swisnapd. 
## When enabled, only signed plugins that can be verified will be loaded into swisnapd.
## Signatures are verified from keyring files specified in swisnap_keyring_path.
## Valid values are 0 - Off, 1 - Enabled, 2 - Warning.
##
## Default value is 1 - Enabled.
## If plugin_trust_level is not set, then agent will use default enabled level.
default['swisnap']['swisnap_plugin_trust_level'] = ''
default['swisnap']['swisnap_keyring_paths'] = ''

## Secure plugin communication optional parameters.
default['swisnap']['swisnap_tls_cert_path'] = ''
default['swisnap']['swisnap_tls_key_path'] = ''
default['swisnap']['swisnap_plugin_tls_cert_path'] = ''
default['swisnap']['swisnap_plugin_tls_key_path'] = ''
default['swisnap']['swisnap_ca_cert_paths'] = ''

## The maximal time allowed for a plugin to load. Default value is 30.
default['swisnap']['swisnap_plugin_load_timeout'] = ''

## Tags that will be applied to collected metrics across all tasks. They should be set in Hash (key => value) format.
default['swisnap']['swisnap_global_tags'] = {}

## Optional REST API parameters. By default REST API is enabled.
default['swisnap']['swisnap_restapi_enable'] = true
default['swisnap']['swisnap_restapi_rest_auth'] = ''
default['swisnap']['swisnap_restapi_rest_auth_password'] = ''
default['swisnap']['swisnap_restapi_rest_certificate'] = ''
default['swisnap']['swisnap_restapi_rest_key'] = ''
default['swisnap']['swisnap_restapi_addr'] = ''
default['swisnap']['swisnap_restapi_plugin_load_timeout'] = ''

if node['os'] == 'windows'
  ## Windows specific values
  
  ## Path to SolarWinds Snap Agent's autoload directory for V1 plugins.
  default['swisnap']['swisnap_auto_discover_path'] = 'C:\Program Files\SolarWinds\Snap\autoload; C:\ProgramData\SolarWinds\Snap\autoload'

  ## Path to log file for Snap.
  default['swisnap']['swisnap_log_path'] = 'C:\ProgramData\SolarWinds\Snap\log'

  ## Path to SolarWinds Snap Agent's plugin configuration files.
  default['swisnap']['swisnap_plugin_config_dir'] = 'C:\ProgramData\SolarWinds\Snap\plugins.d'

  ## Path where SolarWinds Snap Agent's plugins binaries are stored.
  default['swisnap']['swisnap_plugin_path'] = 'C:\Program Files\SolarWinds\Snap\bin'

  ## Path to SolarWinds Snap Agent's V1 tasks files.
  default['swisnap']['swisnap_task_path'] = 'C:\ProgramData\SolarWinds\Snap\tasks.d'
  
  ## Path to SolarWinds Snap Agent's V2 tasks files.
  default['swisnap']['swisnap_tasks_autoload_path'] = 'C:\ProgramData\SolarWinds\Snap\tasks-autoload.d'

else
  ## Linux specific values

  ## Path to SolarWinds Snap Agent's autoload directory for V1 plugins.
  default['swisnap']['swisnap_auto_discover_path'] = '/opt/SolarWinds/Snap/autoload'

  ## Path to log file for Snap.
  default['swisnap']['swisnap_log_path'] = '/var/log/SolarWinds/Snap'

  ## Path to SolarWinds Snap Agent's plugin configuration files.
  default['swisnap']['swisnap_plugin_config_dir'] = '/opt/SolarWinds/Snap/etc/plugins.d'

  ## Path where SolarWinds Snap Agent's plugins binaries are stored.
  default['swisnap']['swisnap_plugin_path'] = '/opt/SolarWinds/Snap/bin'

  ## Path to SolarWinds Snap Agent's V1 tasks files.
  default['swisnap']['swisnap_task_path'] = '/opt/SolarWinds/Snap/etc/tasks.d'

  ## Path to SolarWinds Snap Agent's V2 tasks files.
  default['swisnap']['swisnap_tasks_autoload_path'] = '/opt/SolarWinds/Snap/etc/tasks-autoload.d'
end

## Publisher Appoptics and Processes releated attributes

## Hostname alias for the server which will be used in AppOptics UI.
default['swisnap']['swisnap_hostname_alias'] = ""

## Optional proxy settings.
default['swisnap']['swisnap_proxy_url'] = ""
default['swisnap']['swisnap_proxy_user'] = ""
default['swisnap']['swisnap_proxy_password'] = "" 

## swisnap_host_check_timeout allows to configure timeout for querying host operating system for identification informations.
## Default value is set to 5s.
default['swisnap']['swisnap_host_check_timeout'] = ""

## Whether to floor timestamps to a specific interval, default value is 60 seconds.
default['swisnap']['swisnap_floor_seconds'] = ""

## Metrics interval period to report to AppOptics API, default value is 60 seconds.
default['swisnap']['swisnap_period'] = ""

## swisnap_ec2_check_timeout allows to configure timeout for querying
## EC2 instance metadata URL to determine if host agent is running on EC2 (or OpenStack) instance.
## By default it is set to 1s.
default['swisnap']['swisnap_ec2_check_timeout'] = ""

## swisnap_ec2_check_retries allows to configure number of retries for querying
## EC2 instance metadata URL to determine if host agent is running on EC2 (or OpenStack) instance.
## By default it is set to 3.
default['swisnap']['swisnap_ec2_check_retries'] = ""
