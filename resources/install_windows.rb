resource_name :swisnap_install_windows
provides :swisnap_install_windows
property :solarwinds_token, String, required: true

action :install do

  windows_package 'solarwinds-snap-agent' do
    action :install
    installer_type :msi
    source 'http://files.solarwinds.cloud/windows-solarwinds-snap-agent/solarwinds-snap-agent.msi' 
    options "TOKEN=#{new_resource.solarwinds_token} EULA=accept"
  end

  template 'C:\ProgramData\SolarWinds\Snap\config.yaml' do
    source 'config.yaml.erb'
    notifies :restart, 'service[swisnapd]', :immediately
  end
    
  service 'swisnapd' do
    action :enable
  end

end
