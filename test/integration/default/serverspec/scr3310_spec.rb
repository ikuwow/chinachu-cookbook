require 'serverspec'
set :backend, :exec

describe package("pcscd") do
    it { should be_installed }
end

describe service("pcscd") do
    it { should be_running }
    if os[:release].to_f < 8.0
        it { should be_enabled }
    end
    # I cannot check pcscd is enabled in jessie...
end
