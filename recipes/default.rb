swisnap_install 'Install SolarWinds Snap Agent' do
  solarwinds_token node['swisnap']['solarwinds_token']
  action :install
end
