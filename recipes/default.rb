#
# Cookbook Name:: test123
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# setup sssd/nscd ldap config stuff here


# then..
cmd = Mixlib::ShellOut.new("getent passwd #{node['ldapuser']}")
cmd.run_command

if cmd.exitstatus == 0
  include_recipe "#{cookbook_name}::dothething"
else
  output = Chef::JSONCompat.to_json_pretty({ 'ldapuser' => node['ldapuser'] })
  file '/tmp/attribute.json' do
    content output
  end

  ruby_block 'chef-apply' do
    block do
      Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)
      path = ::File.join(Chef::Config[:file_cache_path], "cookbooks/#{cookbook_name}/recipes/dothething.rb")
      cmd = shell_out("chef-apply #{path} -j /tmp/attribute.json")
      puts cmd.stderr
      puts cmd.stdout
    end
  end
end
