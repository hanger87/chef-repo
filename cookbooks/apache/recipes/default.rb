#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#install apache package

if node['platform_family'] == "rhel"
	package = "httpd"
elsif node['platform_family'] == "debian"
	package = "apache"
end

package 'apache' do
         package_name package
	 action :install
end

service 'apache' do
	 service_name 'httpd'
	 action [:start, :enable]
end

package "ntp" do
	action :install
end

service "ntpd" do
	action [:enable, :start]
end


#creating group :
group "dba" do
	action :create
end
group "unixgrp" do
	action :create
end
group "webgrp" do
	action :create
end

#creating user :
user "unixadmin1" do
	comment "a unix user"
	uid 1000
	gid "unixgrp"
	home "/home/unixadmin1"
	shell "/bin/bash"
	password "$1$IF7a5suS$hWPGVKUGQ6Z82zlfRUNb.0"
end

directory "/home/unixadmin1/" do
	owner "unixadmin1"
	group "unixgrp"
	mode "0744"
	action :create
	recursive true
end

user "unixadmin2" do
	comment "a unix user"
	uid 1001
	gid "unixgrp"
	home "/home/unixadmin2"
	shell "/bin/bash"
	password "$1$IF7a5suS$hWPGVKUGQ6Z82zlfRUNb.0"
end

directory "/home/unixadmin2/" do
	owner "unixadmin2"
	group "unixgrp"
	mode "0744"
	action :create
	recursive true
end

user "unixadmin3" do
	comment "a unix user"
	uid 1002
	gid "unixgrp"
	home "/home/unixadmin3"
	shell "/bin/bash"
	password "$1$IF7a5suS$hWPGVKUGQ6Z82zlfRUNb.0"
end

directory "home/unixadmin3/" do
	owner "unixadmin3"
	group "unixgrp"
	mode "0744"
	action :create
	recursive true 
end

#web user create :

user "webuser1" do
	comment "a web user"
	uid 1003
	gid "webgrp"
	home "/home/webuser1"
	shell "/bin/bash"
	password "$1$IF7a5suS$hWPGVKUGQ6Z82zlfRUNb.0"
end

directory "/home/webuser1" do
	owner "webuser1"
	group "webgrp"
	mode "0744"
	action :create
	recursive true
end

user "webuser2" do
	comment "a web user"
	uid 1004
	gid "webgrp"
	home "/home/webuser2"
	shell "/bin/bash"
	password "$1$IF7a5suS$hWPGVKUGQ6Z82zlfRUNb.0"
end

directory "/home/webuser2" do
	owner "webuser2"
	group "webgrp"
	mode "0744"
	action :create
	recursive true
end

user "webuser3" do
	comment "a web user"
	uid 1005
	gid "webgrp"
	home "/home/webuser3"
	shell "/bin/bash"
	password "$1$IF7a5suS$hWPGVKUGQ6Z82zlfRUNb.0"
end

directory "home/webuser3" do
	owner "webuser3"
	group "webgrp"
	mode "0744"
	action :create
	recursive true
end

#creating oracle user :

user "oracle1" do
	comment "a oracle user"
	uid 1006
	gid "dba"
	home "/home/oracle1"
	shell "/bin/bash"
	password "$1$IF7a5suS$hWPGVKUGQ6Z82zlfRUNb.0"
end

directory "/home/oracle1" do
	owner "oracle1"
 	group "dba"
	mode "0744"
	action :create
	recursive true
end

user "oracle2" do
        comment "a oracle user"
        uid 1007
        gid "dba"
        home "/home/oracle2"
        shell "/bin/bash"
        password "$1$IF7a5suS$hWPGVKUGQ6Z82zlfRUNb.0"
end

directory "/home/oracle2" do
        owner "oracle2"
        group "dba"
        mode "0744"
        action :create
        recursive true
end


user "oracle3" do
        comment "a oracle user"
        uid 1008
        gid "dba"
        home "/home/oracle3"
        shell "/bin/bash"
        password "$1$IF7a5suS$hWPGVKUGQ6Z82zlfRUNb.0"
end

directory "/home/oracle3" do
        owner "oracle3"
        group "dba"
        mode "0744"
        action :create
        recursive true
end

