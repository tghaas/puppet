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
  '/tmp/tcnode1.20140820.tgz':
    uri     => 'http://10.25.45.226/tcnode1.20140820.tgz',
    timeout => 900;

}
home_dir::dir { 'tcnode01':
  home_dir_archive => 'tcnode1.20140820.tgz',
  home_dir_owner   => 'web',
  home_directory   => '/home/web',
  home_dir_group   => 'apps';
}

class { 'timezone':
    timezone => 'America/New_York',
}

class {'nfs_mounts':
  nfs_mounts => 'tc.nfs_mounts',
}