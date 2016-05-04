#
# Cookbook Name:: chinachu
# Recipe:: pt3
#
# Copyright 2015, Ikuo Degawa
#
# All rights reserved - Do Not Redistribute
#

[
    "build-essential",
    "git",
    "dkms",
    "linux-headers-#{node[:os_version]}"
].each do |pkg|
    package pkg do
        action :install
    end
end

puts node[:os_version]

git "/tmp/pt3" do
    repository "https://github.com/m-tsudo/pt3.git"
    revision "master"
    not_if "lsmod | grep pt3_drv"
end

bash "Install PT3 Driver" do
    cwd "/tmp/pt3"
    code <<-EOC
    make && make install && bash ./dkms.install
    EOC
    user "root"
    group "root"
    not_if "lsmod | grep pt3_drv"
end

bash "Load Driver" do
    code "modprobe pt3_drv"
    not_if "lsmod | grep pt3_drv"
end

bash "Autoload pt3_drv" do
    code "echo pt3_drv >> /etc/modules"
    not_if "cat /etc/modules | grep pt3_drv"
end

