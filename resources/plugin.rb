resource_name :swisnap_plugin
property :name, String, name_property: true, required: true
property :config_source, String, default: lazy { "#{node['swisnap']['plugin_config_dir']}/#{name}.yaml.example" }

action :load do
  service 'swisnapd'
  load
end

action :unload do
  service 'swisnapd'
  unload
end

action_class.class_eval do
  def plugin_config_dest
    "#{node['swisnap']['plugin_config_dir']}/#{new_resource.name}.yaml"
  end

  def load
    file plugin_config_dest do
      content ::File.open(new_resource.config_source).read
      owner 'solarwinds'
      group 'solarwinds'
      mode 0644
      action :create
      notifies :restart, 'service[swisnapd]', :immediately
    end
  end

  def unload
    file plugin_config_dest do
      action :delete
      notifies :restart, 'service[swisnapd]', :immediately
    end
  end
end
