require 'serverspec'
set :backend, :exec

describe file('/usr/local/lib/libarib25.so') do
    it { should be_file }
end
