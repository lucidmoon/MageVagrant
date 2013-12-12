# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # Set box configuration
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Assign this VM to a host-only network IP, allowing you to access it via the IP.
  config.vm.network :hostonly, "192.168.10.99"

  # Sync folder on workstation with VM folder.
  config.vm.share_folder "zookal", "/var/www/nginx-default/zookal", "zookal"
  config.vm.share_folder "ssh", "/root/.ssh", ".ssh"

  config.vm.customize ["modifyvm", :id, "--memory", 2048]

  # Enable provisioning with chef solo, specifying a cookbooks path (relative
  # to this Vagrantfile), and adding some recipes and/or roles.
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.data_bags_path = "data_bags"
    chef.add_recipe "vagrant_main"

    chef.json.merge!({
      "mysql" => {
        "server_root_password" => "mageDev2013$",
        "server_repl_password" => "mageDev2013$",
        "server_debian_password" => "mageDev2013$"
      },
      "oh_my_zsh" => {
        :users => [
          {
            :login => 'vagrant',
            :theme => 'blinks',
            :plugins => ['git', 'gem']
          }
        ]
      }
    })
  end
end
