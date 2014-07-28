class ntp {

    package { "ntp": 
        ensure => installed 
    }

    service { "ntpd":
        ensure => running,
    }
    file { "/etc/ntp.conf":
          mode => 644,
         owner => root,
         group => root,
	     source => "puppet:///modules/ntp/ntp.conf",
    }
}
