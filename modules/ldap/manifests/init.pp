# Sets up the machine to use LDAP for local account authentication
class ldap{

  package { "openldap-clients": 
    ensure => installed,
  }

  package { "pam_ldap": 
    ensure => installed,
  }

  package { "nss-pam-ldapd": 
    ensure   => installed,
    provider => yum,
  }
  
  package { "sssd": 
    ensure => installed,
  }   

  package { "sssd-client": 
    ensure => installed,
  }   

  package { "sssd-tools": 
    ensure => installed,
  }  

  package { "libsss_sudo": 
    ensure => installed,
  }  
    
  file { "/etc/sssd/sssd.conf":
    ensure  => file,
    mode    => 600,
    owner   => root,
    group   => root,
    source  => "puppet:///modules/ldap/sssd.conf",
    require => Package['sssd'],
   }   

  service {"sssd":
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/sssd/sssd.conf'],
  }

  service {"nscd":
    ensure    => running,
    enable    => true,
  }

  file { "/etc/openldap/certs/TC_PROD_CA.pem":
    mode   => 644,
    owner  => root,
    group  => root,
    source => "puppet:///modules/ldap/TC_PROD_CA.pem",
  }
  
  file { "/etc/openldap/ldap.conf":
    mode   => 644,
    owner  => root,
    group  => root,
    source => "puppet:///modules/ldap/ldap.conf",
  }

  file { "/etc/pam.d/system-auth-ac":
    mode   => 644,
    owner  => root,
    group  => root,
    source => "puppet:///modules/ldap/system-auth-ac",
  }

  file { "/etc/pam.d/password-auth-ac":
    mode   => 644,
    owner  => root,
    group  => root,
    source => "puppet:///modules/ldap/system-auth-ac",
  }

  file { "/etc/ldap.conf":
    ensure => file,
    mode   => 644,
    owner  => root,
    group  => root,
    source => "puppet:///modules/ldap/ldap_etc.conf",
  }

  file { "/etc/nsswitch.conf":
    mode   => 644,
    owner  => root,
    group  => root,
    source => "puppet:///modules/ldap/nsswitch.conf",
  }
}