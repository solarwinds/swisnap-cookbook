resource_name :swisnap_install
property :appoptics_token, String, required: true

action :install do
  node.run_state['package_type'] = if %w(ubuntu debian).include? node['platform']
                                     'deb'
                                   else
                                     'rpm'
                                   end

  packagecloud_repo 'solarwinds/swisnap-stg' do
    type lazy { node.run_state['package_type'] }
  end

  package 'solarwinds-snap-agent' do
    action :install
  end

  template '/opt/SolarWinds/Snap/etc/config.yaml' do
    source 'config.yaml.erb'
    owner 'solarwinds'
    group 'solarwinds'
    variables(appoptics_token: new_resource.appoptics_token)
  end

  service 'swisnapd' do
    action [:enable, :start]
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
