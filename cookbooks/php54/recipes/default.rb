#
# Author::  Chris Zaharia (<chris@zookal.com>)
# Cookbook Name:: php54
#
# Copyright 2013, ZookaL, Pty. Ltd.
#

include_recipe "php"
include_recipe "php-fpm"

case node['platform']
when 'ubuntu'
  if node['platform_version'].to_f <= 12.04
    execute "apt-get -y install python-software-properties"
    execute "add-apt-repository -y ppa:ondrej/php5-oldstable"
    execute "apt-get -y update"
    execute 'DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install php5'
    
	user = "vagrant"
	group = "vagrant"
	node.override['php']['fpm_user']      = user
	node.override['php']['fpm_group']     = group
	node.override['php-fpm']['pool']['www']['user'] = user
	node.override['php-fpm']['pool']['www']['group'] = group
	node.override['php-fpm']['pool']['testpool']['user'] = user
	node.override['php-fpm']['pool']['testpool']['group'] = group
  end
end
