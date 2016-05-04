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
    libtool autoconf libboost-all-dev
    expect
}.each do |p|
    package p do
        action :install
    end
end

package "yasm" do
    action :remove
end

bash "Install yasm 1.2" do
    cwd "/tmp"
    code <<-EOC
    wget http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz
    tar xzvf yasm-1.2.0.tar.gz
    cd yasm-1.2.0
    ./configure
    make
    make install
    EOC
    not_if "which yasm"
end

user "chinachu" do
    home "/home/chinachu"
    manage_home true
    shell "/bin/bash"
    action :create
end

git "/home/chinachu/chinachu" do
    repository "https://github.com/kanreisa/Chinachu.git"
    user "chinachu"
    group "chinachu"
    action :checkout
    # notifies :run, "bash[Chinachu Installer]", :immediately
end

=begin
bash "Chinachu Installer" do
    user "chinachu"
    cwd "/home/chinachu/chinachu"
    code <<-EOC
    expect -c '
    spawn ./chinachu installer | tee ./chef_chinachu_log
    expect "what do you install? > "
    send 1\r
    expect eof
    '
    EOC
    action :nothing
end


=end
