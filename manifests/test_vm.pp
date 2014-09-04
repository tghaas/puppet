java::jdk {'jdk8.05':
  java_archive => 'jdk-8u5-linux-x64.tar.gz',
  java_home    => '/usr/local/java/jdk1.8.0_05/',
  java_folder  => 'jdk1.8.0_05'
}
include ntp
include ldap
include home_dir

home_dir::dir { 'tc_node1':
  home_dir_archive => 'tcnode1.20140820.tgz',
  home_dir_owner   => 'web',
  home_directory   => '/home/web',
  home_dir_group   => 'apps';

'wiki':
  home_dir_archive => 'wiki.20140820.tgz',
  home_dir_owner   => 'wiki',
  home_directory   => '/home/wiki',
  home_dir_group   => 'apps';
}