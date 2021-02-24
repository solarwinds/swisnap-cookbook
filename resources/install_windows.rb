resource_name :swisnap_install_windows
provides :swisnap_install_windows
property :solarwinds_token, String, required: true

action :install do

  windows_package 'solarwinds-snap-agent' do
    action :install
    installer_type :msi
    source 'https://files.solarwinds.cloud/windows-solarwinds-snap-agent/solarwinds-snap-agent.msi'
    options "TOKEN=#{new_resource.solarwinds_token} EULA=accept"
  end

  template 'C:\ProgramData\SolarWinds\Snap\config.yaml' do
    source 'config.yaml.erb'
    notifies :restart, 'service[swisnapd]', :delayed
  end
    
  template 'C:\ProgramData\SolarWinds\Snap\plugins.d\publisher-appoptics.yaml' do
    source 'publisher-appoptics.yaml.erb'
    variables(solarwinds_token: new_resource.solarwinds_token)
    notifies :restart, 'service[swisnapd]', :delayed
  end

  template 'C:\ProgramData\SolarWinds\Snap\plugins.d\publisher-processes.yaml' do
    source 'publisher-processes.yaml.erb'
    variables(solarwinds_token: new_resource.solarwinds_token)
    notifies :restart, 'service[swisnapd]', :delayed
  end

  service 'swisnapd' do
    action :enable
  end

end
