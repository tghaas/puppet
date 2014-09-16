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