
include ntp
include ldap
include bind
bind::server::conf { '/etc/named.conf':
  listen_on_addr    => [ 'any' ],
  listen_on_v6_addr => [ 'any' ],
  forwarders        => [ '8.8.8.8', '8.8.4.4' ],
  allow_query       => [ 'localnets', '10.25/16'],
  allow_transfer	=> [ 'localhost', '10.25.70.16'],
  zones             => {
    'topcoder.com' => [
      'type master',
      'file "named.topcoder"',
    ],
    '70.25.10.in-addr.arpa' => [
      'type master',
      'file "70.25.10.in-addr.arpa"',
    ],
  },
}
bind::server::file { 'named.topcoder':
  source => 'puppet:///modules/config_files/named.topcoder',
}
bind::server::file { 'named.topcoder':
  source => 'puppet:///modules/config_files/70.25.10.in-addr.arpa',
}
class { 'timezone':
    timezone => 'America/New_York',
}
