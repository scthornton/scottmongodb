#
# Cookbook:: scottmongodb
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


include_recipe "mongodb3::package_repo"

# we need python
python_runtime '3'

# specify the packages to install via pip
# pip_packages = "pymongo"

# pip_packages.each do |install_pip|
python_package 'pymongo' do
  action :install
end
# end

Chef::Log.info("Installing MongoDB client version: #{node['mongodb3']['version']}")
package 'mongodb-org-shell' do
  version node['mongodb3']['version']
  action :upgrade
end
