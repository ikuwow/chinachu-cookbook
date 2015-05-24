#
# Cookbook Name:: chinachu
# Recipe:: chinachu
#
# Copyright 2015, Ikuo Degawa
#
# All rights reserved - Do Not Redistribute
#

%w{zip pkg-config libpcsclite-dev}.each do |p|
    package p do
        action :install
    end
end

# arib25
bash "Fetch arib25" do
    cwd "/tmp"
    code <<-EOC
    wget http://hg.honeyplanet.jp/pt1/archive/c44e16dbb0e2.zip
    unzip c44e16dbb0e2.zip
    EOC
    creates "/tmp/pt1-c44e16dbb0e2"
end

bash "Install arib25" do
    cwd "/tmp/pt1-c44e16dbb0e2/arib25"
    code "make && make install"
    creates "/usr/local/lib/libarib25.so"
end
