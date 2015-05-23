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

# git "pt3" do

