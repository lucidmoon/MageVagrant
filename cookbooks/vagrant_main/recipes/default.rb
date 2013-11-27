include_recipe "apt"
include_recipe "git"
include_recipe "java"
include_recipe "oh-my-zsh"
include_recipe "mysql::server"
include_recipe "php"
include_recipe "ruby"
include_recipe "phpunit"
include_recipe "database::mysql"
include_recipe "nginx"
include_recipe "php-fpm"

Directory "/root/.ssh" do
  action :create
  mode 0700
end

# Install packages
%w{ debconf vim screen mc curl tmux make g++ libsqlite3-dev }.each do |a_package|
  package a_package
end

# Install ruby gems
%w{ rake mailcatcher }.each do |a_gem|
  gem_package a_gem
end

# Generate selfsigned ssl
execute "make-ssl-cert" do
  command "make-ssl-cert generate-default-snakeoil --force-overwrite"
  ignore_failure true
  action :nothing
end


bash "hosts" do
 code "echo 192.168.0.100 zookal.dev >> /etc/hosts"
end

# Configure sites
sites = data_bag("sites")

sites.each do |name|
  site = data_bag_item("sites", name)

  # Create Dir structure
  execute "mkdir" do
    command "mkdir -p /srv/www/#{site["host"]}/public_html"
  end
  
   # Add site info in /etc/hosts
   bash "hosts" do
     code "echo 127.0.0.1 #{site["host"]} #{site["aliases"].join(' ')} >> /etc/hosts"
     code "echo 192.168.0.100 zookal.dev >> /etc/hosts"
   end

   # Create database
   mysql_database site["id"] do
      connection ({:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']})
      action :create
   end

end

# Install phpmyadmin
cookbook_file "/tmp/phpmyadmin.deb.conf" do
  source "phpmyadmin.deb.conf"
end

bash "debconf_for_phpmyadmin" do
  code "debconf-set-selections /tmp/phpmyadmin.deb.conf"
end

package "phpmyadmin"

# Install Xdebug
php_pear "xdebug" do
  action :install
end

template "#{node['php']['ext_conf_dir']}/xdebug.ini" do
  source "xdebug.ini.erb"
  owner "root"
  group "root"
  mode "0644"
  action :create
  notifies :restart, resources("service[nginx]"), :delayed
end

# Install php-curl
package "php5-curl" do
  action :install
end

# Get eth1 ip
eth1_ip = node[:network][:interfaces][:eth1][:addresses].select{|key,val| val[:family] == 'inet'}.flatten[0]

# # Setup MailCatcher
# bash "mailcatcher" do
#   code "mailcatcher --http-ip #{eth1_ip} --smtp-port 25"
# end
# template "#{node['php']['ext_conf_dir']}/mailcatcher.ini" do
#   source "mailcatcher.ini.erb"
#   owner "root"
#   group "root"
#   mode "0644"
#   action :create
#   notifies :restart, resources("service[apache2]"), :delayed
# end
