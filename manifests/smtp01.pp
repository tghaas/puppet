
include ntp
include ldap

class { 'timezone':
    timezone => 'America/New_York',
}