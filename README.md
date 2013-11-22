MageVagrant Zookal Version
==========================

MageVagrant is a complete LNMP development environment for Magento. Specially created for the
Magento Developer's Guide book.

## Features

- Automatic setup and configuration of Magento instances
- Automated checkout from the SVN
- Automated Database creation
- Magento TAF (Test Automated Framework) receipe included

## Requirements

You will need the following software installed:

- Vagrant (www.vagrantup.com)
- Virtual Box (https://www.virtualbox.org/)


## Installation

Getting MageVagrant up and running is as easy cloning the repo

````git clone https://github.com/amacgregor/MageVagrant.git magevagrant````

And running the Vagrant box

````
cd magevagrant/
vagrant up
````

This will setup a full LNMP development environment and checkout,configure and enable a
default Magento 1.7 ready to be installed

## Packages for Zookal

### Current Setup

- Remove Apache/PHP
- Add Nginx latest
- Add PHP 5.5.6 FPM
- MySQL 5.5
- Redis latest
- Solr 4.X
- SMTP Mail Catcher https://github.com/sj26/mailcatcher
- Zookal Magento

### Future Setup

- Add Ruby for our Ruby devs
