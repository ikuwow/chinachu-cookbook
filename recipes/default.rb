#
# Cookbook Name:: chinachu
# Recipe:: default
#
# Copyright 2015, Ikuo Degawa
#
# All rights reserved - Do Not Redistribute
#

package "vim"

package "aptitude" do
    action :install
end

include_recipe "chinachu::pt3"
include_recipe "chinachu::scr3310"
include_recipe "chinachu::chinachu"

