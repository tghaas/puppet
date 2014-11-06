
class { '::ntp':
  servers => [ 'ntp.topcoder.com', 'ntp1.topcoder.com' ],
}
include ldap
include bind
bind::server::conf { '/etc/named.conf':
  listen_on_addr    => [ 'any' ],
  listen_on_v6_addr => [ 'any' ],
  forwarders        => [ '8.8.8.8', '8.8.4.4' ],
  allow_query       => [ 'localnets', '10.25/16'],
  allow_transfer	=> [ 'localhost', '10.25.70.16'],
  zones             => {
    'topcoder.com' => [
      'type slave',
      'masters { 10.25.70.15; }',
      'file "named.topcoder"',
    ],
    '70.25.10.in-addr.arpa' => [
      'type slave',
      'masters { 10.25.70.15; }',
      'file "70.25.10.in-addr.arpa"',
    ],
  },
}
class { 'timezone':
    timezone => 'America/New_York',
}
#include java
#include ldap
#include download
#include bash

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
#class {'nodejs':
#  version => 'v0.10.30'
#}
#exec { 'install npm java':
#  path        => '/usr/bin:/usr/sbin:/usr/local/java/jdk1.8.0_05/bin',
#  environment => 'JAVA_HOME=/usr/local/java/jdk1.8.0_05',
#  command     => '/usr/local/node/node-default/bin/npm install java &>/dev/null',
#  require     => [ Class['nodejs'],
#         Java::Jdk['jdk8.05'],
#         ]
# }
#package {'java-1.7.0-openjdk':
#  ensure => present,
#}

#package { 'java':
##  ensure   => present,
 # provider => 'npm',
#  require  => [ Class['nodejs'],
#          Package ['java-1.7.0-openjdk'],
#          ]
#}
#package { 'forever':
#  ensure   => present,
#  provider => 'npm',
#  require  => Class['nodejs'],
#}
#home_dir::dir { 'tcnode2':
#  home_dir_archive => 'tcnode2.20140819.tgz',
# home_dir_owner   => 'web',
#  home_directory   => '/home/web',
#  home_dir_group   => 'apps';
  
#  'wiki':
#  home_dir_archive => 'wiki.20140820.tgz',
#  home_dir_owner   => 'wiki',
#  home_directory   => '/home/wiki',
#  home_dir_group   => 'apps';
#}
#download::file {
#  '/tmp/wiki.20140820.tgz':
#    uri     => 'http://192.168.1.134/wiki.20140820.tgz',
#    timeout => 900;
#  '/tmp/tcnode2.20140819.tgz':
#   uri     => 'http://192.168.1.134/tcnode2.20140819.tgz',
#    timeout => 900;   
#}