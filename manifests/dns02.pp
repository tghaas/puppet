
class { '::ntp':
  servers => [ 'ntp.topcoder.com', 'ntp1.topcoder.com' ],
}
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
      'type slave',
      'masters { 10.25.70.15; }',
      'file "/var/named/slaves/named.topcoder"',
    ],
    '70.25.10.in-addr.arpa' => [
      'type slave',
      'masters { 10.25.70.15; }',
      'file "/var/named/slaves/70.25.10.in-addr.arpa"',
    ],
    'ec2.internal' => [
      'type forward',
      'forwarders { 10.25.0.2; 169.254.169.253; }' 
    ],
  },
}
class { 'timezone':
    timezone => 'America/New_York',
}
