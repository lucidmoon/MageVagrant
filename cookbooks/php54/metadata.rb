name              "php54"
maintainer        "Zookal, Pty. Ltd."
maintainer_email  "tech@zookal.com"
description       "Updates php 5.3 to 5.4 on Ubuntu Precise"
version           "0.1.0"

depends "php"

%w{ debian ubuntu }.each do |os|
  supports os
end

recipe "php54", "Updates php 5.3 to 5.4"
