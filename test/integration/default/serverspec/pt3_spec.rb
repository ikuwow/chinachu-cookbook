require 'serverspec'
set :backend, :exec

%w{git build-essential}.each do |pkg|
    describe package(pkg) do
        it { should be_installed }
    end
end
