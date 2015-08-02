#
# Cookbook Name:: newcontext-demo-site
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'newcontext-demo-site::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      stub_command("which nginx").and_return("nginx")
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end


    it 'includes the nginx recipe' do
    	expect(chef_run).to include_recipe 'nginx'
    end
    it 'includes the zip recipe' do
    	expect(chef_run).to include_recipe 'zip'
    end

    it 'creates the nginx www root directory' do
    	expect(chef_run).to create_directory('/var/www/nginx-default')
    		.with(owner: 'root', group: 'www-data', mode: "0755")
    end

    it 'does not run unzip_archive by default' do
    	expect(chef_run).to_not run_execute('unzip_archive')
    end

    it 'creates demo zip file' do
    	expect(chef_run).to create_remote_file('/tmp/exercise-webpage.zip')
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end
  end
end
