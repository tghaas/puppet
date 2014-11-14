class { '::ntp':
  servers => [ 'ntp.topcoder.com', 'ntp1.topcoder.com' ],
}

class { 'timezone':
  timezone => 'America/New_York',
}
