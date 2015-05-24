require 'serverspec'
set :backend, :exec

%w{zip pkg-config libpcsclite-dev autoconf automake}.each do |p|
    describe package(p) do
        it { should be_installed}
    end
end

describe file('/usr/local/lib/libarib25.so') do
    it { should be_file }
end

describe command("which recpt1") do
    its(:exit_status) { should eq 0 }
end