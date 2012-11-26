Description
===========

This cookbook installs and configures exim4 for client or outbound relayhost.

Requirements
============

## Platform:

* Debian 6.0+

May work on other platforms with or without modification.

Attributes
==========

See `attributes/default.rb` for default values.

* `node['exim4']['user']` - The exim4 user.
* `node['exim4']['configtype']` - The main configuration type. One of
  `internet`, `smarthost`, `satellite`, `local` or `none`.
* `node['exim4']['other_hostnames']`- Is used to build the local_domains list,
  together with `localhost. This is the list of domains for which this
  machine should consider itself the final destination.
* `node['exim4']['local_interfaces']`- List of IP addresses the Exim daemon
  should listen on. If this is left empty, Exim listens on all interfaces.
* `node['exim4']['readhost']`- For `smarthost` and `satellite` it is possible
  to hide the local mailname in the headers of outgoing mail and replace it
  with this value instead, using rewriting.
* `node['exim4']['relay_domains']`- Is a list of domains for which we accept
  mail from anywhere on the Internet but which are not delivered locally, e.g.
  because this machine serves as secondary MX for these domains.
* `node['exim4']['minimaldns']`- Boolean option to activate some option to
  minimize DNS lookups.
* `node['exim4']['relay_nets']`- A list of machines for which we serve as
  smarthost. Please note that `127.0.0.1` and `::1` are always permitted to
  relay since `/usr/lib/sendmail` is available anyway and relay control
  doesn't make sense here.
* `node['exim4']['use_split_config']`- Boolean option that controls whether
  `update-exim4.conf` uses `/etc/exim4/exim4.conf.template` (`false`) or the
  multiple files below `/etc/exim4/conf.d` (`true`) as input.
* `node['exim4']['hide_mailname']`- Boolean option that controls whether the
  local mailname in the headers of outgoing mail should be hidden. (Only
  effective for `smarthost` and `satellite`.
* `node['exim4']['localdelivery']`- Name of the default transport for local
  mail delivery. Defaults to mail_spool if unset, use maildir_home for
  delivery to `~/Maildir/`.
* `node['exim4']['smarthost_server']`- List of hosts to which all outgoing
  mail is passed to and that takes care of delivering it. Each of the hosts
  is tried, in the order specified (See exim specification, chapter 20.5).
  All deliveries go out to TCP port 25 unless a different port is specified
  after the host name, separated from the host name by two colons. Colons in
  IPv6 addresses need to be doubled. If a port number follows, IP addresses
  may be enclosed in brackets, which might be the only possibility to specify
  delivery to an IPv6 address and a different port.
* `node['exim4']['smarthost_login']`- Login used for the smarthost.
* `node['exim4']['smarthost_pwd']`- Password used for the smarthost.


Usage
=====

License and Author
==================

Author:: Thomas Massmann <thomas.massmann@inqbus.de>

Copyright:: 2012, Inqbus

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
