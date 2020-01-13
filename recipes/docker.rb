swisnap_install 'Install SolarWinds Snap Agent' do
  appoptics_token 'MY_APPOPTICS_TOKEN'
  action :install
end

swisnap_plugin 'docker' do
  action :load
end
