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
  '/tmp/direct-api.20141008.tgz':
    uri     => 'http://10.25.45.226/direct-api.20141008.tgz',
    timeout => 900;
}

home_dir::dir { 'direct-api01':
  home_dir_archive => 'direct-api.20141008.tgz',
  home_dir_owner   => 'api',
  home_directory   => '/home/api',
  home_dir_group   => 'apps';
}

class { 'timezone':
    timezone => 'America/New_York',
}
