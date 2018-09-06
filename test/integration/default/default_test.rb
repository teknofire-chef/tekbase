# # encoding: utf-8

# Inspec test for recipe tekbase::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe service('ntp') do
  it { should be_installed }
  it { should be_running }
end

describe user('teknofire') do
  it { should exist }
end

describe file('/etc/sudoers.d/admin') do
  its('content') { should match /teknofire/ }
end
