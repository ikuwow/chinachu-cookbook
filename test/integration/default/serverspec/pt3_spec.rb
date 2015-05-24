require 'serverspec'
set :backend, :exec

%w{git build-essential}.each do |pkg|
    describe package(pkg) do
        it { should be_installed }
    end
end

describe command('lsmod | grep pt3_drv') do
    its(:exit_status) { should eq 0 }
end
