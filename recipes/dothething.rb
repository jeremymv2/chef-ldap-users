#
# Cookbook Name:: test123
# Recipe:: dothething
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# we need to create a file owned by the ldap user
file '/tmp/foo' do
  owner node['ldapuser']
  content 'hello world'
end
