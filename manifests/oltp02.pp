class { 'java':
  java_archive  => 'jdk-8u5-linux-x64.tar.gz',
    java_home   => '/usr/local/java/jdk1.8.0_05/',
    java_folder => 'jdk1.8.0_05'
}
class { '::ntp':
  servers => [ 'ntp.topcoder.com', 'ntp1.topcoder.com' ],
}
include ldap