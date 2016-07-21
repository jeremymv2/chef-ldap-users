#
# Cookbook Name:: test123
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

file '/tmp/foo' do
  owner node['ldapuser']
  content 'hello world'
end
