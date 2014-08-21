class { 'java':
  java_archive  => 'jdk-8u5-linux-x64.tar.gz',
    java_home   => '/usr/local/java/jdk1.8.0_05/',
    java_folder => 'jdk1.8.0_05'
}
include ntp
include ldap

class { 'home_dir':
  home_dir_archive => 'tcnode2.20140819.tgz',
  home_dir_owner   => 'web',
  home_directory   => '/home/web',
  home_dir_group   => 'apps'
}