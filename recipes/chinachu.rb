#
# Cookbook Name:: chinachu
# Recipe:: chinachu
#
# Copyright 2015, Ikuo Degawa
#
# All rights reserved - Do Not Redistribute
#

%w{zip pkg-config libpcsclite-dev autoconf automake}.each do |p|
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

# recpt1
git "/tmp/recpt1" do
    repository "https://github.com/stz2012/recpt1.git"
    revision "master"
    not_if "which recpt1"
end

bash "Install recpt1" do
    cwd "/tmp/recpt1/recpt1"
    code "bash ./autogen.sh && ./configure --enable-b25 && make && make install"
    not_if "which recpt1"
end


# Chinachu

%w{
    build-essential curl git-core libssl-dev
    yasm libtool autoconf libboost-all-dev
}.each do |p|
    package p do
        action :install
    end
end

user "chinachu" do
    action :create
end


