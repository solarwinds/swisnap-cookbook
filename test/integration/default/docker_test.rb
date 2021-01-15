describe package('solarwinds-snap-agent') do
  it { should be_installed }
end

describe file('/opt/SolarWinds/Snap/etc/config.yaml') do
  it { should exist }
end

describe port(21413) do
  it { should be_listening }
end

describe service('swisnapd') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/opt/SolarWinds/Snap/etc/plugins.d/docker.yaml') do
  it { should exist }
end
