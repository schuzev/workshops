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

## Extract tomcat 

execute 'extract_tomcat' do
  command 'sudo tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1'
  cwd '/tmp'
end

## Set tomcat directory permissions and ownership

directory '/opt/tomcat/conf' do
  group 'tomcat'
  mode '0474'
end


execute 'chmod g+r conf/*' do
  cwd '/opt/tomcat'
end

execute 'chown -R tomcat webapps/ work/ temp/ logs/ conf/' do
  cwd '/opt/tomcat'
end

