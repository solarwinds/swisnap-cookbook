resource_name :swisnap_install
provides :swisnap_install
property :solarwinds_token, String, required: true, sensitive: true

action :install do
  if node['os'] == 'windows'
    swisnap_install_windows "Install Snap Agent on Windows" do
      solarwinds_token new_resource.solarwinds_token 
      action :install
    end
  else
    swisnap_install_linux "Install Snap Agent on Linux" do
      solarwinds_token new_resource.solarwinds_token 
      action :install
    end
  end
end
