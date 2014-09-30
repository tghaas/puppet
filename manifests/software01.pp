include java
java::jdk { 'jdk6.18':
  java_archive => 'jdk-6u18-linux-x64.tar.gz',
  java_home    => '/usr/local/java/jdk1.6.0_18_x64/',
  java_folder  => 'jdk1.6.0_18_x64';
  'jdk5.22':
  java_archive => 'jdk-1.5.0_22.linux.i386.tar.gz',
  java_home    => '/usr/local/java/jdk1.5.0_22/',
  java_folder  => 'jdk1.5.0_22';
}
include ntp
include ldap
include home_dir
include download

download::file {
  '/tmp/software.20140929.tgz':
    uri     => 'http://10.25.45.226/software.20140929.tgz',
    timeout => 900;

}
home_dir::dir { 'apps':
  home_dir_archive => 'software.20140929.tgz',
  home_dir_owner   => 'apps',
  home_directory   => '/home/apps',
  home_dir_group   => 'apps';
  'tt':
  home_dir_archive => 'tt.20140929.tgz',
  home_dir_owner   => 'tt',
  home_directory   => '/home/tt',
  home_dir_group   => 'apps';
}

class { 'timezone':
    timezone => 'America/New_York',
}

class {'nfs_mounts':
  nfs_mounts => 'software.nfs_mounts',
}

file { '/usr/local/java/jdk1.6.0_18':
  ensure  => 'link',
  target  => '/usr/local/java/jdk1.6.0_18_x64/',
  require => Java::Jdk['jdk6.18'],
}