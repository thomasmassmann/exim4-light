#
# Cookbook Name:: exim4-light
# Recipe:: default
#
# Copyright 2012, Inqbus
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

case node['platform']
when "ubuntu","debian"
  package "exim4-daemon-light"
end

template "/etc/mailname" do
  source "mailname.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :run, "execute[update-exim4.conf]"
end

if node['exim4']['encrypted']['enabled']
  encrypted = Chef::EncryptedDataBagItem.load(node['exim4']['encrypted']['bag'], node['exim4']['encrypted']['item'])
  login = encrypted["smarthost_login"]
  pwd = encrypted["smarthost_pwd"]
else
  login = node['exim4']['smarthost_login']
  pwd = node['exim4']['smarthost_pwd']
end

template "/etc/exim4/passwd.client" do
  source "passwd.client.erb"
  owner "root"
  group node['exim4']['user']
  mode 0640
  variables({
    :smarthost_server => (node['exim4']['smarthost_auth_server'] || node['exim4']['smarthost_server']),
    :smarthost_login => login,
    :smarthost_pwd => pwd
  })
end

template "/etc/exim4/update-exim4.conf.conf" do
  source "update-exim4.conf.conf.erb"
  owner "root"
  group "root"
  mode 0644
  variables({
    :configtype => node['exim4']['configtype'],
    :other_hostnames => node['exim4']['other_hostnames'],
    :local_interfaces => node['exim4']['local_interfaces'],
    :readhost => node['exim4']['readhost'],
    :relay_domains => node['exim4']['relay_domains'],
    :minimaldns => node['exim4']['minimaldns'],
    :relay_nets => node['exim4']['relay_nets'],
    :smarthost_server => node['exim4']['smarthost_server'],
    :smarthost_port => node['exim4']['smarthost_port'],
    :use_split_config => node['exim4']['use_split_config'],
    :hide_mailname => node['exim4']['hide_mailname'],
    :mailname_in_oh => node['exim4']['mailname_in_oh'],
    :localdelivery => node['exim4']['localdelivery'],
    :other_options => node['exim4']['other_options']
  })
  notifies :run, "execute[update-exim4.conf]"
end

execute "update-exim4.conf" do
  action :nothing
end
