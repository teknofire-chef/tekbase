#
# Cookbook:: tekbase
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'chef-client::default'

node.default['teknofire']['chef-client-version'] = '14.4.56'

chef_client_updater 'Install latest' do
  version node['teknofire']['chef-client-version']
end

user 'teknofire' do
  manage_home true
  shell '/bin/bash'
  action [:create, :manage]
end

sudo 'admin' do
  user 'teknofire'
  nopasswd true
end
