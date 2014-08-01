# Class for installing and configuring
# Network Time Protocol
class ntp {

  package { 'ntp':
    ensure => installed,
  }

  service { 'ntpd':
    ensure => running,
    enable => true,
  }

  file { '/etc/ntp.conf':
    mode   => '0644',
    owner  => root,
    group  => root,
    source => 'puppet:///modules/ntp/ntp.conf',
  }
}
