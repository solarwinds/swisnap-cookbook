swisnap_install 'Install SolarWinds Snap Agent' do
  solarwinds_token "SOLARWINDS_TOKEN"
  action :install
end
