#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#
## Install dependencies (jdk)
#
package 'java-1.7.0-openjdk-devel' do
  action :install
end
#
## Create users and groups
group 'tomcat' do
  action :create
end 

user 'tomcat' do
  group :'tomcat'
end


