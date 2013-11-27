name              "zookal-server"
maintainer        "Zookal, Pty. Ltd."
maintainer_email  "tech@zookal.com"
description       "Additional setup for Zookal dev server"
version           "0.1.0"

depends "nginx"
depends "php"
depends "php-fpm"

%w{ debian ubuntu }.each do |os|
  supports os
end

recipe "zookal-server", "Zookal dev server setup"
