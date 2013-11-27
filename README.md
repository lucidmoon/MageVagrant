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

Then run the Vagrant box

````
cd magevagrant/
vagrant up
````

This will setup a full LNMP development environment and checkout,configure and enable a
default Magento 1.7 ready to be installed

## Use

### Login Authentication
vagrant/vagrant

## Packages for Zookal

### Current Setup

- Remove Apache/PHP
- Add Nginx latest
- Nginx configuration
- Add PHP 5.4
- Add Cron
- MySQL 5.5
- Redis latest
- Solr 4.X
- SMTP Mail Catcher https://github.com/sj26/mailcatcher
- Zookal Magento

### Future Setup

- Setup Ruby for our Ruby devs
- Update PHP to 5.5
- Update MySQL to 5.6
- New Relic for server monitoring
- Magento TAF
