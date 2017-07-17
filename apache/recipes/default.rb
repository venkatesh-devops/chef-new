#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Re
package 'apache2' do
  action :install
end
service 'apache2' do
  action :start
end

file '/var/www/html/index.html' do
  content 'welcome to srivenkatesh'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end 
package 'tomcat7' do
  action :install
end
service 'tomcat7' do
  action :start
end
package 'tomcat7-docs' do
  action :install
end
package 'tomcat7-examples' do
  action :install
end
package 'tomcat7-admin' do
  action :install
end
remote_file '/var/lib/tomcat7/webapps/jenkins.war' do
  source 'http://ftp-chi.osuosl.org/pub/jenkins/war-stable/2.60.1/jenkins.war'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
execute 'make dir' do
  command 'sudo mkdir /usr/share/tomcat7/.jenkins'
  action :run
end
execute 'permission' do
  command 'sudo chmod -R 777 /usr/share/tomcat7/.jenkins'
  action :run
end

service 'tomcat7' do
  action :restart
end
