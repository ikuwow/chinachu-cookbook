require 'serverspec'
set :backend, :exec

describe package("pcscd") do
    it { should be_installed }
end
