
include ntp
include ldap
include home_dir
include download
include java
java::jdk { 'jdk7.45':
  java_archive => 'jdk-7u45-linux-x64.tar.gz',
  java_home    => '/usr/local/java/jdk1.7.0_45/',
  java_folder  => 'jdk1.7.0_45';
}
download::file {
  '/tmp/node.20141008.tgz':
    uri     => 'http://10.25.45.226/node.20141008.tgz',
    timeout => 900;
}

home_dir::dir { 'api01':
  home_dir_archive => 'node.20141008.tgz',
  home_dir_owner   => 'node',
  home_directory   => '/home/node',
  home_dir_group   => 'apps';
}

class { 'timezone':
    timezone => 'America/New_York',
}

class {'nfs_mounts':
  nfs_mounts => 'api01.nfs_mounts',
}

class {'nodejs':
  version => 'v0.10.30'
}

package { 'forever':
  ensure   => present,
  provider => 'npm',
  require  => Class['nodejs'],
}