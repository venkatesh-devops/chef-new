#
# Cookbook:: jenkins
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
execute 'download jenkins package' do
  command 'wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -'
  action :run
end
execute 'unpacking' do
  command 'echo deb http://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list'
  action :run
end
 apt_update 'update' do 
   action :update 
   end 
 package 'jenkins' do
   action :install
 end
 execute 'start service' do
   command 'sudo systemctl start jenkins'
   action :run
 end
