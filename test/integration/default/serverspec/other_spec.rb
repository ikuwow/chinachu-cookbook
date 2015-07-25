require 'serverspec'
set :backend, :exec

%w{vim aptitude handbrake-cli}.each do |p|
    describe package(p) do
        it { should be_installed }
    end
end
