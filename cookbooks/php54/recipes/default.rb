#
# Author::  Chris Zaharia (<chris@zookal.com>)
# Cookbook Name:: php54
#
# Copyright 2013, ZookaL, Pty. Ltd.
#

case node['platform']
when 'ubuntu'
  if node['platform_version'].to_f <= 12.04
    execute "apt-get -y install python-software-properties"
    execute "add-apt-repository -y ppa:ondrej/php5-oldstable"
    execute "apt-get -y update"
    execute 'apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install php5'
  end
end
