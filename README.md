vagrantlamp
===========

A Vagrant LAMP stack for web application development.

Introduction
------------

Todo.

Prerequisites
-------------

* Download and install VirtualBox. See https://www.virtualbox.org/.
* Download and install Vagrant. See https://www.vagrantup.com/.
* Download the Ubuntu precise 32 VirtualBox base box for Vagrant.
```
vagrant box add precise32 http://files.vagrantup.com/precise32.box
```
* Add the following line to your computer's hosts file
```
192.168.33.10   vagrantlamp.dev
```
* Using a terminal, navigate to this project's directory and run
```
vagrant up
```