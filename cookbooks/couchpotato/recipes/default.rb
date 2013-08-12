#
# Cookbook Name:: couchpotato
# Recipe:: default
#
# Copyright 2013, James Legg  <mail@jamesless.co.uk>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include_recipe "git"

user node['couchpotato']['user'] do
  shell '/bin/bash'
  comment 'Web Application - CouchPotato'
  home node['couchpotato']['install_dir']
  system true
end

directory "#{node['couchpotato']['install_dir']}" do
  mode 0755
  owner node['couchpotato']['user']
end

git node['couchpotato']['install_dir'] do
  repository node['couchpotato']['git_url']
  revision node['couchpotato']['git_ref']                                   
  action :sync                                     
  user node['couchpotato']['user']                 
  group node['couchpotato']['group']                      
  notifies :restart, "bluepill_service[couchpotato]", :immediately
end

template "#{node['bluepill']['conf_dir']}/couchpotato.pill" do
  source "couchpotato.pill.erb"
  mode 0644
  notifies :load, "bluepill_service[couchpotato]", :immediately
  notifies :restart, "bluepill_service[couchpotato]", :immediately
end

bluepill_service "couchpotato" do
  action [:enable, :load, :start, :restart]
end
