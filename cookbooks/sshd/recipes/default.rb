#
# Cookbook Name:: sshd
# Recipe:: default
#
# Copyright 2013, James Legg
#
#
config = data_bag_item('sshd', 'config')
template "/etc/ssh/sshd_config" do
    source     "sshd_config.erb"
    mode       "0644"
    variables(
        :sshd_ports => config['ports'],
        :sshd_chal_resp => config['chal_resp']
)
end

template "/etc/pam.d/sshd" do
    source "pam-sshd.erb"
end

service "ssh" do
    action [ :restart ]
end
