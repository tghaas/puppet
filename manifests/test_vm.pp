include ntp
#include java
include ldap
include download
include bash

#java::jdk { 'jdk8.05':
#  java_archive => 'jdk-8u5-linux-x64.tar.gz',
#  java_home    => '/usr/local/java/jdk1.8.0_05',
#  java_folder  => 'jdk1.8.0_05';
#  'jdk7.45':
#  java_archive => 'jdk-7u45-linux-x64.tar.gz',
#  java_home    => '/usr/local/java/jdk1.7.0_45/',
#  java_folder  => 'jdk1.7.0_45';
#}
#class {'sethostname': 
#	fqdn => 'PROD.test.topcoder.com'
#}	

#class { 'nfs_mounts':
# nfs_mounts => 'tc.nfs_mounts'
#}

#class { 'nfs::server': }
#file { '/usr/local/java/jdk1.8':
#  ensure  => 'link',
#  target  => '/usr/local/java/jdk1.8.0_05',
#  require => Java::Jdk['jdk8.05'],
#}
download::file {
  '/tmp/wiki.20140820.tgz':
    uri     => 'http://192.168.1.134/wiki.20140820.tgz',
    timeout => 900;
  '/tmp/tcnode2.20140819.tgz':
   uri     => 'http://192.168.1.134/tcnode2.20140819.tgz',
    timeout => 900;  	
}
home_dir::dir { 'tcnode2':
  home_dir_archive => 'tcnode2.20140819.tgz',
  home_dir_owner   => 'web',
  home_directory   => '/home/web',
  home_dir_group   => 'apps';
  
  'wiki':
  home_dir_archive => 'wiki.20140820.tgz',
  home_dir_owner   => 'wiki',
  home_directory   => '/home/wiki',
  home_dir_group   => 'apps';
}
