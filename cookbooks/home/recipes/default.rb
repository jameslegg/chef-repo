#
# Cookbook Name:: home
# Recipe:: default
# Stuff I want to do to my home box
package "lm-sensors"

#hack to get avahi working for TimeMachine
package "avahi-daemon"
template "/etc/avahi/services/afpd.conf" do
  source "afpd.conf.erb"
  owner  "root"
  group "root"
  mode   "0644"
  notifies :restart, 'service[avahi-daemon]'
end

service 'avahi-daemon' do
  supports :restart => true
  action [:enable, :start]
end
