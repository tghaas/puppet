include java
java::jdk {  'jdk6.45':
  java_archive => 'jdk-6u45-linux-x64.tar.gz',
  java_home    => '/usr/local/java/jdk1.6.0_45/',
  java_folder  => 'jdk1.6.0_45';
}
include ntp
include ldap
include home_dir
include download

download::file {
  '/tmp/cache.20140909.tgz':
    uri     => 'http://10.25.45.226/cache.20140909.tgz',
    timeout => 900;

}
home_dir::dir { 'cache':
  home_dir_archive => 'cache.20140909.tgz',
  home_dir_owner   => 'cache',
  home_directory   => '/home/cache',
  home_dir_group   => 'apps';
}

class { 'timezone':
    timezone => 'America/New_York',
}