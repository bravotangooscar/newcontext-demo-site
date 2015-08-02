#
# Cookbook Name:: newcontext-demo-site
# Recipe:: default
#
# Copyright (c) 2015 Brian OConnell, All Rights Reserved.

include_recipe 'nginx'
include_recipe 'zip'

require 'pathname'

# Create the nginx default directory, if it does not exist
directory node['nginx']['default_root'] do
	action :create
	recursive true
	owner 'root'
	group node['nginx']['group']
	mode '0755'
end

# Unzip the webpage into the webroot. Requires a bit of hand-waving to remove
#  the top-level directory, because `unzip` can't handle that itself.
# In order to prevent the same files from being overwritten, set this with no 
#  action and only perform it if the remote_file resource state changes 
bash 'unzip_archive' do
	code <<-EOH
		unzip -o "#{node['newcontext-demo-site']['zip_path']}" -d "#{node['nginx']['default_root']}"
		mv #{node['nginx']['default_root']}/#{node['newcontext-demo-site']['repo_name']}-#{node['newcontext-demo-site']['repo_branch']}/* "#{node['nginx']['default_root']}"
		rmdir "#{node['nginx']['default_root']}/#{node['newcontext-demo-site']['repo_name']}-#{node['newcontext-demo-site']['repo_branch']}"
		EOH
	user 'root'
	group node['nginx']['group']
	action :nothing
end

remote_file node['newcontext-demo-site']['zip_path'] do
	source node['newcontext-demo-site']['zip_url']
	use_conditional_get true
	use_etag true
	use_last_modified true
	notifies :run, "bash[unzip_archive]", :immediately
end