#
# Cookbook Name:: chinachu
# Recipe:: scr3310
#
# Copyright 2015, Ikuo Degawa
#
# All rights reserved - Do Not Redistribute
#

package "pcscd" do
    action :install
end

service "pcscd" do
    action [:start, :enable]
end

# TODO: Enable SCR3310 in libccid in debian 7.8
#       (in debian 8.0 SCR3310 is already enabled)
