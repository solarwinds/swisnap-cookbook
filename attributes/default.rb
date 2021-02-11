default['swisnap']['swisnap_package_name'] = 'solarwinds-snap-agent'

default['swisnap']['swisnap_log_level'] = 'info'
default['swisnap']['swisnap_log_format'] = ''
default['swisnap']['swisnap_plugin_trust_level'] = ''
default['swisnap']['swisnap_keyring_paths'] = ''
default['swisnap']['swisnap_tls_cert_path'] = ''
default['swisnap']['swisnap_tls_key_path'] = ''
default['swisnap']['swisnap_plugin_tls_cert_path'] = ''
default['swisnap']['swisnap_plugin_tls_key_path'] = ''
default['swisnap']['swisnap_ca_cert_paths'] = ''
default['swisnap']['swisnap_plugin_load_timeout'] = ''
default['swisnap']['swisnap_global_tags'] =  {}
default['swisnap']['swisnap_restapi_enable'] = true
default['swisnap']['swisnap_restapi_rest_auth'] = ''
default['swisnap']['swisnap_restapi_rest_auth_password'] = ''
default['swisnap']['swisnap_restapi_rest_certificate'] = ''
default['swisnap']['swisnap_restapi_rest_key'] = ''
default['swisnap']['swisnap_restapi_addr'] = ''
default['swisnap']['swisnap_restapi_plugin_load_timeout'] = ''

if node['os'] == 'windows'
  # Windows defaults
  default['swisnap_main_config_path'] = 'C:\ProgramData\SolarWinds\Snap\config.yaml'

  default['swisnap']['swisnap_auto_discover_path'] = 'C:\Program Files\SolarWinds\Snap\autoload; C:\ProgramData\SolarWinds\Snap\autoload'
  default['swisnap']['swisnap_log_path'] = 'C:\ProgramData\SolarWinds\Snap\log'
  default['swisnap']['swisnap_plugin_config_dir'] = 'C:\ProgramData\SolarWinds\Snap\plugins.d'
  default['swisnap']['swisnap_plugin_path'] = 'C:\Program Files\SolarWinds\Snap\bin'
  default['swisnap']['swisnap_tasks_autoload_path'] = 'C:\ProgramData\SolarWinds\Snap\tasks-autoload.d'
  default['swisnap']['swisnap_task_path'] = 'C:\ProgramData\SolarWinds\Snap\tasks.d'
else
  # Linux defaults
  default['swisnap_main_config_path'] = ''

  default['swisnap']['swisnap_auto_discover_path'] = '/opt/SolarWinds/Snap/autoload'
  default['swisnap']['swisnap_log_path'] = '/var/log/SolarWinds/Snap'
  default['swisnap']['swisnap_plugin_path'] = '/opt/SolarWinds/Snap/bin'
  default['swisnap']['swisnap_plugin_config_dir'] = '/opt/SolarWinds/Snap/etc/plugins.d'
  default['swisnap']['swisnap_task_path'] = '/opt/SolarWinds/Snap/etc/tasks.d'
  default['swisnap']['swisnap_tasks_autoload_path'] = '/opt/SolarWinds/Snap/etc/tasks-autoload.d'
  default['swisnap']['swisnap_temp_dir_path'] = '/tmp/SolarWinds/Snap'
  default['swisnap']['swisnap_temp_dir_enable'] = 'false'
end
