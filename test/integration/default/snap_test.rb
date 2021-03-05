describe package('solarwinds-snap-agent') do
  it { should be_installed }
end

describe service('swisnapd') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/opt/SolarWinds/Snap/etc/config.yaml') do
  it { should exist }
  it { should be_owned_by 'solarwinds' }
  its('group') { should eq 'solarwinds' }
  its('mode') { should cmp '0640' }
  its('content') { should match(%r{test-tags: test-kitchen}) }
end

describe file('/opt/SolarWinds/Snap/etc/plugins.d/publisher-processes.yaml') do
  it { should exist }
  it { should be_owned_by 'solarwinds' }
  its('group') { should eq 'solarwinds' }
  its('mode') { should cmp '0640' }
  its('content') { should match(%r{token: "testKitchenToken"}) }
  its('content') { should match(%r{hostname_alias: test-kitchen}) }
end

describe file('/opt/SolarWinds/Snap/etc/plugins.d/publisher-appoptics.yaml') do
  it { should exist }
  it { should be_owned_by 'solarwinds' }
  its('group') { should eq 'solarwinds' }
  its('mode') { should cmp '0640' }
  its('content') { should match(%r{token: "testKitchenToken"}) }
  its('content') { should match(%r{hostname_alias: test-kitchen}) }
end

describe file('/opt/SolarWinds/Snap/etc/tasks-autoload.d/task-processes.yaml') do
  it { should exist }
  it { should be_owned_by 'solarwinds' }
  its('group') { should eq 'solarwinds' }
  its('mode') { should cmp '0640' }
end

describe file('/opt/SolarWinds/Snap/etc/tasks-autoload.d/task-aosystem.yaml') do
  it { should exist }
  it { should be_owned_by 'solarwinds' }
  its('group') { should eq 'solarwinds' }
  its('mode') { should cmp '0640' }
end
