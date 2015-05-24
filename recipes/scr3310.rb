#
# Cookbook Name:: chinachu
# Recipe:: scr3310
#
# Copyright 2015, Ikuo Degawa
#
# All rights reserved - Do Not Redistribute
#

%w{pcscd pcsc-tools}.each do |p|
    package p do
        action :install
    end
end

service "pcscd" do
    action [:start, :enable]
end

# TODO: Enable SCR3310 in libccid in debian 7.8
#       (in debian 8.0 SCR3310 is already enabled)
