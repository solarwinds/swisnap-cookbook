resource_name :swisnap_install_windows
property :solarwinds_token, String, required: true

action :install do
  windows_env 'SOLARWINDS_TOKEN' do
    value new_resource.solarwinds_token
  end

  windows_package 'solarwinds-snap-agent' do
    action :install
    installer_type :msi
    source 'http://files.solarwinds.cloud/windows-solarwinds-snap-agent/solarwinds-snap-agent.msi'
    options "TOKEN=%SOLARWINDS_TOKEN% EULA=accept"
  end

  template 'C:\ProgramData\SolarWinds\Snap\config.yaml' do
    source 'config.yaml.erb'
  end
    
  service 'swisnapd' do
    action [:enable, :restart]
  end

end

action :upgrade do
  package 'solarwinds-snap-agent' do
    action :upgrade
  end
end

action :remove do
  package 'solarwinds-snap-agent' do
    action :remove
  end
end
