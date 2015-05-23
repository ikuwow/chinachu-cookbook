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
end

