vagrantlampdrupal
===========

A Vagrant LAMP stack for Drupal development.

Introduction
------------

VagrantLamp is a lightweight vagrant box running Ubuntu 12.04 with Drush and Drupal fully installed. The system is designed to be naked allowing for maximum customizability. Only the basic requirements are installed.

Prerequisites
-------------

* Download and install VirtualBox. See https://www.virtualbox.org/.
* Download and install Vagrant. See https://www.vagrantup.com/.
* Download the Ubuntu precise 32 VirtualBox base box for Vagrant.
```
vagrant box add precise32 http://files.vagrantup.com/precise32.box
```

Setup
-----

* Add the following line to your computer's hosts file
```
192.168.33.10   drupal.dev www.drupal.dev
```
* Using a terminal, navigate to this project's directory and run
```
vagrant up
```
* In a web browser, visit www.drupal.dev or drupal.dev. There will be stock drupal installation. To login use username admin and password drupal.