#
# Author::  Chris Zaharia (<chris@zookal.com>)
# Cookbook Name:: zookal-server
#
# Copyright 2013, ZookaL, Pty. Ltd.
#

include_recipe "nginx"
include_recipe "php"
include_recipe "php-fpm"

user = "vagrant"
group = "vagrant"
node.override['php']['fpm_user']      = user
node.override['php']['fpm_group']     = group
node.override['php-fpm']['pool']['www']['user'] = user
node.override['php-fpm']['pool']['www']['group'] = group
node.override['php-fpm']['pool']['testpool']['user'] = user
node.override['php-fpm']['pool']['testpool']['group'] = group

template "#{node[:nginx][:dir]}/conf.d/zookal-dev.conf" do
  source "zookal-dev.conf.erb"
  owner "vagrant"
  group "vagrant"
  mode 0644
  action :create
  notifies :restart, resources("service[nginx]"), :delayed
end