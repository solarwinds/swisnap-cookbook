resource_name :swisnap_install_linux
property :solarwinds_token, String, required: true, sensitive: true

action :install do
  node.run_state['package_type'] = if %w(ubuntu debian).include? node['platform']
                                     'deb'
                                   else
                                     'rpm'
                                   end

  packagecloud_repo 'solarwinds/swisnap' do
    type lazy { node.run_state['package_type'] }
  end

  package 'solarwinds-snap-agent' do
    ENV['SOLARWINDS_TOKEN'] = new_resource.solarwinds_token
    action :install
  end

  template '/opt/SolarWinds/Snap/etc/config.yaml' do
    sensitive true
    source 'config.yaml.erb'
    owner 'solarwinds'
    group 'solarwinds'
    mode '0640'
    notifies :restart, 'service[swisnapd]', :delayed
  end
  
  template '/opt/SolarWinds/Snap/etc/plugins.d/publisher-appoptics.yaml' do
    sensitive true
    source 'publisher-appoptics.yaml.erb'
    owner 'solarwinds'
    group 'solarwinds'
    mode '0640'
    variables(solarwinds_token: new_resource.solarwinds_token)
    notifies :restart, 'service[swisnapd]', :delayed
  end

  template '/opt/SolarWinds/Snap/etc/plugins.d/publisher-processes.yaml' do
    sensitive true
    source 'publisher-processes.yaml.erb'
    owner 'solarwinds'
    group 'solarwinds'
    mode '0640'
    variables(solarwinds_token: new_resource.solarwinds_token)
    notifies :restart, 'service[swisnapd]', :delayed
  end

  service 'swisnapd' do
    action :enable
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
