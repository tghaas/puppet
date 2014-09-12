include java
java::jdk { 
  'jdk6.05':
  java_archive => 'jdk-6u5-linux-i586.tar.gz',
  java_home    => '/usr/local/java/jdk1.6.0_05/',
  java_folder  => 'jdk1.6.0_05';
}
include ntp
include ldap
include home_dir
include download

download::file {
  '/tmp/mm2.20140904.tgz':
    uri     => 'http://10.25.45.226/mm2.20140904.tgz',
    timeout => 900;
  '/tmp/mmcache.20140910.tgz':
    uri     => 'http://10.25.45.226/mmcache.20140910.tgz',
    timeout => 900;   
}
home_dir::dir { 'mm2':
  home_dir_archive => 'mm2.20140904.tgz',
  home_dir_owner   => 'mm2',
  home_directory   => '/home/mm2',
  home_dir_group   => 'apps';
  
  'mmcache':
  home_dir_archive => 'mmcache.20140910.tgz',
  home_dir_owner   => 'mmcache',
  home_directory   => '/home/mmcache',
  home_dir_group   => 'apps';

}

class { 'timezone':
    timezone => 'America/New_York',
}
