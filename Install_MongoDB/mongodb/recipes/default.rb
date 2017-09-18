#
# Cookbook:: mongodb
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#
## Set up mongodb yum repository
yum_repository 'mongodb' do
  description 'MongoDB Repository'
  baseurl 'http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/'
  gpgcheck false
  enabled true
  action :create
end

## install mongodb-org and dependencies

package 'mongodb-org' do
  action :install
end

## start and enable the mongod service 
service 'mongod' do
  action [ :enable, :start ]
end


