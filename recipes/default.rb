#
# Cookbook Name:: rhodecode
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "python::default"
include_recipe "supervisor::default"
include_recipe "git::source"

user node["rhodecode"]["user"] do
  action :create
  home "/var/rhodecode"
  system true
  shell "/sbin/nologin"
end

%w{/var/rhodecode /var/rhodecode/rhodecode}.each do |dir|
  directory dir do
    action :create
    owner "rhodecode"
    group "rhodecode"
    mode 0755
  end
end

cookbook_file "/var/rhodecode/rhodecode/rhodecode-installer.py" do
  owner "rhodecode"
  group "rhodecode"
  mode 0755
end
  
template "/var/rhodecode/rhodecode/noninteractive.ini" do
  owner "rhodecode"
  group "rhodecode"
  mode 0755
end

bash "install-rhodecode" do
  cwd "/var/rhodecode/rhodecode"
  code <<-EOH
python ./rhodecode-installer.py -n
sed -i -e '1a # chkconfig: 2345 80 20' /etc/init.d/rhodecode
EOH
  creates "/etc/init.d/rhodecode"
end

service "rhodecode" do
  action [ :enable, :start ]
  supports :status => true, :restart => true
end

