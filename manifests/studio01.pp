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
  '/tmp/studio.20140910.tgz':
    uri     => 'http://10.25.45.226/studio.20140910.tgz',
    timeout => 900;

}
home_dir::dir { 'studio':
  home_dir_archive => 'studio.20140910.tgz',
  home_dir_owner   => 'studio',
  home_directory   => '/home/studio',
  home_dir_group   => 'apps';
}

class { 'timezone':
    timezone => 'America/New_York',
}

class {'nfs_mounts':
  nfs_mounts => 'studio.nfs_mounts',
}

file { '/usr/local/java/jdk1.6.0_18':
  ensure  => 'link',
  target  => '/usr/local/java/jdk1.6.0_18_x64/',
  require => Java::Jdk['jdk6.18'],
}