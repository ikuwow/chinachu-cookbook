require 'serverspec'
set :backend, :exec


[
    "git",
    "build-essential"
].each do |pkg|
    describe package(pkg) do
        it { should be_installed }
    end
end

=begin
if os[:release].to_f >= 8.0
    os_release = `uname -r`
    describe package("linux-headers-#{os_release}") do
        it { should be_installed }
    end
end
=end
# TODO: test whether linux-headers-`uname -r` is installed

describe command('lsmod | grep pt3_drv') do
    its(:exit_status) { should eq 0 }
end

describe command('cat /etc/modules | grep pt3_drv') do
    its(:exit_status) { should eq 0 }
end
