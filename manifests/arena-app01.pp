include java
java::jdk { 
  'jdk8.05':
  java_archive  => 'jdk-8u5-linux-x64.tar.gz',
    java_home   => '/usr/local/java/jdk1.8.0_05/',
    java_folder => 'jdk1.8.0_05'
}
class { '::ntp':
  servers => [ 'ntp.topcoder.com', 'ntp1.topcoder.com' ],
}
include ldap
include home_dir
include download

download::file {
  '/tmp/listener2.20141203.tgz':
    uri     => 'http://10.25.45.226/listener2.20141203.tgz',
    timeout => 900;
  '/tmp/control2.20141203.tgz':
    uri     => 'http://10.25.45.226/control2.20141203.tgz',
    timeout => 900;
  '/tmp/tomcat2.20141203.tgz':
    uri     => 'http://10.25.45.226/tomcat2.20141203.tgz',
    timeout => 900;    
}
home_dir::dir { 'listener2':
  home_dir_archive => 'listener2.20141203.tgz',
  home_dir_owner   => 'listener2',
  home_directory   => '/home/listener2',
  home_dir_group   => 'apps';
   'control2':
  home_dir_archive => 'control2.20141203.tgz',
  home_dir_owner   => 'control2',
  home_directory   => '/home/control2',
  home_dir_group   => 'apps';
   'tomcat2':
  home_dir_archive => 'tomcat2.20141203.tgz',
  home_dir_owner   => 'tomcat2',
  home_directory   => '/home/tomcat2',
  home_dir_group   => 'apps';
}

class { 'timezone':
    timezone => 'America/New_York',
}
