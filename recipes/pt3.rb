#
# Cookbook Name:: chinachu
# Recipe:: pt3
#
# Copyright 2015, Ikuo Degawa
#
# All rights reserved - Do Not Redistribute
#


%w{build-essential git}.each do |pkg|
    package pkg do
        action :install
    end
end

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

# modprobe pt3_drv
bash "Load Driver" do
    code "modprobe pt3_drv"
    not_if "lsmod | grep pt3_drv"
end

