name              "exim4-light"
maintainer        "Inqbus"
maintainer_email  "thomas.massmann@inqbus.de"
license           "Apache v2.0"
description       "Installs and configures exim4-light."
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.1.2"

%w{ debian ubuntu }.each do |os|
  supports os
end

recipe "exim4-light", "Installs and configures exim4 for client or outbound relayhost."


attribute "exim4/user",
  :display_name => "user",
  :description => "Exim4 User",
  :default => "root"

attribute "exim4/configtype",
  :choice => [ 'internet', 'smarthost', 'satellite', 'local', 'none' ],
  :display_name => "configtype",
  :description => "The main configuration type.",
  :default => "none"

attribute "exim4/other_hostnames",
  :display_name => "other_hostnames",
  :description => "Is used to build the local_domains list, together with `localhost. This is the list of domains for which this machine should consider itself the final destination.",
  :default => ""

attribute "exim4/local_interfaces",
  :display_name => "local_interfaces",
  :description => "List of IP addresses the Exim daemon should listen on. If this is left empty, Exim listens on all interfaces.",
  :default => "127.0.0.1"

attribute "exim4/readhost",
  :display_name => "readhost",
  :description => "For 'smarthost' and 'satellite' it is possible to hide the local mailname in the headers of outgoing mail and replace it with this value instead, using rewriting.",
  :default => "fqdn"

attribute "exim4/relay_domains",
  :display_name => "relay_domains",
  :description => "Is a list of domains for which we accept mail from anywhere on the Internet but which are not delivered locally, e.g. because this machine serves as secondary MX for these domains.",
  :default => ""

attribute "exim4/minimaldns",
  :display_name => "minimaldns",
  :description => "Boolean option to activate some option to minimize DNS lookups.",
  :default => "false"

attribute "exim4/relay_nets",
  :display_name => "relay_nets",
  :description => "A list of machines for which we serve as smarthost. Please note that '127.0.0.1' and '::1' are always permitted to relay since '/usr/lib/sendmail' is available anyway and relay control doesn't make sense here.",
  :default => ""

attribute "exim4/use_split_config",
  :display_name => "use_split_config",
  :description => "Boolean option that controls whether 'update-exim4.conf' uses '/etc/exim4/exim4.conf.template' ('false') or the multiple files below '/etc/exim4/conf.d' ('true') as input.",
  :default => "false"

attribute "exim4/hide_mailname",
  :display_name => "hide_mailname",
  :description => "Boolean option that controls whether the local mailname in the headers of outgoing mail should be hidden. (Only effective for 'smarthost' and 'satellite'.",
  :default => "false"

attribute "exim4/localdelivery",
  :display_name => "localdelivery",
  :description => "Name of the default transport for local mail delivery. Defaults to mail_spool if unset, use maildir_home for delivery to '~/Maildir/'.",
  :default => "maildir_home"

attribute "exim4/smarthost_server",
  :display_name => "smarthost_server",
  :description => "Server to which all outgoing mail is passed to and that takes care of delivering it. All deliveries go out to TCP port 25 unless a different port is specified (use 'smarthost_port'). Colons in IPv6 addresses need to be doubled. If a port number follows, IP addresses may be enclosed in brackets, which might be the only possibility to specify delivery to an IPv6 address and a different port.",
  :default => ""

attribute "exim4/smarthost_port",
  :display_name => "smarthost_port",
  :description => "TCP port for the mail server. If no port is given exim uses 25 by default.",
  :default => ""

attribute "exim4/smarthost_login",
  :display_name => "smarthost_login",
  :description => "Login used for the smarthost.",
  :default => ""

attribute "exim4/smarthost_pwd",
  :display_name => "smarthost_pwd",
  :description => "Password used for the smarthost",
  :default => ""

attribute "exim4/encrypted/enabled",
  :display_name => "Use encrypted data bag",
  :description => "Enable usage of encrypted data bag for smarthost credentials.",
  :default => "false"

attribute "exim4/encrypted/bag",
  :display_name => "Encrypted data bag name",
  :description => "Name of the encrypted data bag.",
  :default => ""

attribute "exim4/encrypted/item",
  :display_name => "Encrypted data bag item",
  :description => "Name of the encrypted data bag item.",
  :default => ""
