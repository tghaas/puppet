
include ntp
include ldap
include bind
bind::server::conf { '/etc/named.conf':
  listen_on_addr    => [ 'any' ],
  listen_on_v6_addr => [ 'any' ],
  forwarders        => [ '8.8.8.8', '8.8.4.4' ],
  allow_query       => [ 'localnets' ],
  allow_transfer	=> [ 'localhost','10.25.70.16'],
  zones             => {
    'topcoder.com' => [
      'type master',
      'file "named.topcoder"',
    ],
  },
}
bind::server::file { 'named.topcoder':
  source => 'puppet:///modules/config_files/named.topcoder',
}
class { 'timezone':
    timezone => 'America/New_York',
}
