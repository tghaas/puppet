include java
java::jdk { 'jdk5.11':
  java_archive => 'jdk-1_5_0_11-linux-i586.tar.gz',
  java_home    => '/usr/local/java/jdk1.5.0_11/',
  java_folder  => 'jdk1.5.0_11';

  'jdk5.12':
  java_archive => 'jdk-1_5_0_12-linux-i586.tar.gz',
  java_home    => '/usr/local/java/jdk1.5.0_12/',
  java_folder  => 'jdk1.5.0_12';
}
include ntp
include ldap
include home_dir
include download

download::file {
  '/tmp/dot204cache.20140911.tgz':
    uri     => 'http://10.25.45.226/dot204cache.20140911.tgz',
    timeout => 900;
  '/tmp/dot204cache2.20140911.tgz':
    uri     => 'http://10.25.45.226/dot204cache2.20140911.tgz',
    timeout => 900;   
}
home_dir::dir { 'cache':
  home_dir_archive => 'dot204cache.20140911.tgz',
  home_dir_owner   => 'cache',
  home_directory   => '/home/cache',
  home_dir_group   => 'apps';
  
  'cache2':
  home_dir_archive => 'dot204cache2.20140911.tgz',
  home_dir_owner   => 'cache2',
  home_directory   => '/home/cache2',
  home_dir_group   => 'apps';
}

class { 'timezone':
    timezone => 'America/New_York',
}
