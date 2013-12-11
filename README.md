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

- PHP 5.3.10
- Nginx 1.1.19
- MySQL 5.5.34

### Future Setup

- Zookal Magento
- Setup Ruby for our Ruby devs
- Update PHP to 5.5
- Update MySQL to 5.6
- Nginx configuration
- Redis
- Solr 4.X
- SMTP Mail Catcher https://github.com/sj26/mailcatcher
- Cron
- New Relic for server monitoring
- Magento TAF
- Install [https://github.com/Learnosity/vagrant-git](https://github.com/Learnosity/vagrant-git)
- ...