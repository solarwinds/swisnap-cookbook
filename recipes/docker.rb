swisnap_install 'Install SolarWinds Snap Agent' do
  appoptics_token 'mytoken'
  action :install
end

swisnap_plugin 'docker' do
  action :load
end
