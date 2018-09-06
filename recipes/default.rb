#
# Cookbook:: tekbase
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'chef-client::default'
include_recipe 'ssh-hardening'
include_recipe 'ntp'

node.default['teknofire']['chef-client-version'] = '14.4.56'

chef_client_updater 'Install latest' do
  version node['teknofire']['chef-client-version']
end

tekbase_user 'teknofire' do
  sudo true
end
