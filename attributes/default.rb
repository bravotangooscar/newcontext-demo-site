#configurable
default['newcontext-demo-site']['repo_base_url'] = 'https://github.com/puppetlabs'
default['newcontext-demo-site']['repo_name'] = 'exercise-webpage'
default['newcontext-demo-site']['repo_branch'] = 'master'
default['newcontext-demo-site']['tmp_dir'] = '/tmp'

#derived
default['newcontext-demo-site']['zip_name'] = "#{default['newcontext-demo-site']['repo_name']}.zip"
default['newcontext-demo-site']['zip_url'] = "#{default['newcontext-demo-site']['repo_base_url']}/#{node['newcontext-demo-site']['repo_name']}/archive/#{node['newcontext-demo-site']['repo_branch']}.zip"
default['newcontext-demo-site']['zip_path'] = "#{node['newcontext-demo-site']['tmp_dir']}/#{node['newcontext-demo-site']['zip_name']}"

