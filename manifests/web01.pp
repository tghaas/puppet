include ntp
include ldap
class { 'timezone':
  timezone => 'America/New_York',
}
package { "httpd": 
  ensure => installed,
}
package { "php": 
  ensure => installed,
}
package { "php-gd": 
  ensure => installed,
}
package { "php-mysql": 
  ensure => installed,
}
package { "php-ldap": 
  ensure => installed,
}
package { "php-xml": 
  ensure => installed,
}
package { "php-snmp": 
  ensure => installed,
}
file { "/home/apps":
  ensure  => directory,
  owner   => 501,
  group   => 501,
  mode    => 755,
}
file { "/home/apps/apache_docs":
  ensure  => directory,
  owner   => 501,
  group   => 501,
  mode    => 755,
  require => '/home/apps',
}
class {'nfs_mounts':
  nfs_mounts => 'web.nfs_mounts',
  require    => File['/home/apps/apache_docs'],
}