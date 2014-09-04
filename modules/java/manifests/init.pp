# Purpose: Install Java 7
#
# default version of java can be overridden in the node manifest:
# instead of include java use this syntax:
#
#
#class { "java":
#    java_archive => 'jdk-8u5-linux-x64.tar.gz',
#    java_home    => '/usr/local/java/jdk1.8.0_05/',
#    java_folder  => 'jdk1.8.0_05'
#}
class java
  {
      file { '/usr/local/java' :
    ensure  => directory,
    owner   => vagrant,

  }
}