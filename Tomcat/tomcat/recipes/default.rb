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

## Download tomcat

remote_file '/tmp/apache-tomcat-8.0.46.tar.gz' do
  source 'http://www-us.apache.org/dist/tomcat/tomcat-8/v8.0.46/bin/apache-tomcat-8.0.46.tar.gz'
  action :create
end

## Create and set up tomcat directory

directory '/opt/tomcat' do
  action :create
  recursive true
end



