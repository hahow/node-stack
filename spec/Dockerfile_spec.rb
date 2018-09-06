require 'serverspec'
require 'docker'

describe 'Dockerfile' do
  before(:all) do
    image = Docker::Image.build_from_dir('.')

    set :os, family: :debian
    set :backend, :docker
    set :docker_image, image.id
  end

  describe file('/etc/debian_version') do
    it { should contain '8.11' }
  end

  describe command('node -v') do
    its(:stdout) { should match /^v6/ }
  end

  describe command('which npm') do
    its(:exit_status) { should eq 0 }
  end

  describe command('mongo --version') do
    its(:stdout) { should contain '2.6.12' }
  end
end
