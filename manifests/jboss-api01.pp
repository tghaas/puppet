include java
java::jdk { 'jdk6.18':
  java_archive => 'jdk-6u18-linux-x64.tar.gz',
  java_home    => '/usr/local/java/jdk1.6.0_18_x64/',
  java_folder  => 'jdk1.6.0_18_x64';
}
include ntp
include ldap
include home_dir
include download

download::file {
  '/tmp/jboss-api.20141006.tgz':
    uri     => 'http://10.25.45.226/jboss-api.20141006.tgz',
    timeout => 900;
}

home_dir::dir { 'jboss-api01':
  home_dir_archive => 'jboss-api.20141006.tgz',
  home_dir_owner   => 'api',
  home_directory   => '/home/api',
  home_dir_group   => 'apps';
}

class { 'timezone':
    timezone => 'America/New_York',
}

file { '/usr/local/java/jdk1.6.0_18':
  ensure  => 'link',
  target  => '/usr/local/java/jdk1.6.0_18_x64/',
  require => Java::Jdk['jdk6.18'],
}