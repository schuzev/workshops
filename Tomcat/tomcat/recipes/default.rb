#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#
## dependency on JDK recipe
#
include_recipe 'tomcat::java'
#
## Create users and groups
group 'tomcat' do
  action :create
end 

user 'tomcat' do
  action :create
  group 'tomcat'
end


