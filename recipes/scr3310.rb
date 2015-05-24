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
