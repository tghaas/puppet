class { '::ntp':
  servers => [ 'ntp.topcoder.com', 'ntp1.topcoder.com' ],
}
include ldap
class { 'timezone':
  timezone => 'America/New_York',
}

class {'nfs_mounts':
  nfs_mounts => 'web.nfs_mounts',
  require    => File['/home/apps/apache_docs'],
}
