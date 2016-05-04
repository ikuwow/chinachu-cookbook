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

include_recipe "apt"

include_recipe "chinachu::pt3" # TV tuner
include_recipe "chinachu::scr3310" # B-CAS card reader
include_recipe "chinachu::chinachu" # chinachu app
# include_recipe "chinachu::additional" # additional components

