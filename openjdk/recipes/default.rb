#
# Cookbook:: openjdk
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


apt_update 'update' do 
   action :update 
   end 

   package 'openjdk-7-jdk' do
     action :install
   end
 
 #source:https://discourse.chef.io/t/environment-path-not-being-applied-using-ruby-block-in-recipe/8604
 
   ruby_block 'set-java-path' do
  block do
    ENV['PATH'] = "#{ENV['PATH']}:/usr/bin/java"
  end
end
ruby_block 'print java path' do
  block do
    puts "System Path is : #{ENV['PATH']}"
  end
end

#  for the out put  --- you type which java you see the /usr/bin/java
 