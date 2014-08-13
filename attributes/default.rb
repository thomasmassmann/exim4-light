#
# Cookbook Name:: exim4-light
# Attributes:: default
#
# Author:: Thomas Massmann (<thomas.massmann@inqbus.de>)
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

# General attributes
case node[:platform]
when "ubuntu","debian"
  default[:exim4][:user]             = 'Debian-exim'
when "redhat","centos","fedora","scientific","amazon"
  default[:exim4][:user]             = 'root'
else
  default[:exim4][:user]             = 'root'
end

# update-exim4.conf attributes
default[:exim4][:configtype]        = 'none'
default[:exim4][:other_hostnames]   = ''
default[:exim4][:local_interfaces]  = '127.0.0.1'
default[:exim4][:readhost]          = node[:fqdn]
default[:exim4][:relay_domains]     = ''
default[:exim4][:minimaldns]        = false
default[:exim4][:relay_nets]        = ''
default[:exim4][:use_split_config]  = false
default[:exim4][:hide_mailname]     = false
default[:exim4][:mailname_in_oh]    = true
default[:exim4][:localdelivery]     = 'maildir_home'
default[:exim4][:other_options]		= {}

# passwd.client attributes
default[:exim4][:smarthost_server]  = ''
default[:exim4][:smarthost_auth_server] = nil
default[:exim4][:smarthost_port]    = ''
default[:exim4][:smarthost_login]   = ''
default[:exim4][:smarthost_pwd]     = ''

default[:exim4][:encrypted][:enabled] = false
default[:exim4][:encrypted][:bag]     = nil
default[:exim4][:encrypted][:item]    = nil
