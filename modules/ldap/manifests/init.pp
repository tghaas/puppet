class ldap{

	package { "openldap-clients": 
        ensure => installed,
    }
	
    package { "pam_ldap": 
        ensure => installed,
    }

    package { "nss-pam-ldapd": 
        ensure => installed,
	  provider => yum,
    }	
	
    file { "/etc/openldap/certs/TC_PROD_CA.pem":
          mode => 644,
         owner => root,
         group => root,
	    source => "puppet:///modules/ldap/TC_PROD_CA.pem",
    }

	file { "/etc/openldap/ldap.conf":
          mode => 644,
         owner => root,
         group => root,
	    source => "puppet:///modules/ldap/ldap.conf",
    }

	file { "/etc/ldap.conf":
	    ensure => file,
          mode => 644,
         owner => root,
         group => root,
	    source => "puppet:///modules/ldap/ldap_etc.conf",
    }

	file { "/etc/sssd/sssd.conf":
	    ensure => file,
          mode => 600,
         owner => root,
         group => root,
	    source => "puppet:///modules/ldap/sssd.conf",
    }	
	
    file { "/etc/nsswitch.conf":
          mode => 644,
         owner => root,
         group => root,
	    source => "puppet:///modules/ldap/nsswitch.conf",
    }
}