include ntp
include java
include ldap

java::jdk {'jdk8.05':
  java_archive => 'jdk-8u5-linux-x64.tar.gz',
  java_home    => '/usr/local/java/jdk1.8.0_05/',
  java_folder  => 'jdk1.8.0_05'
}
java::jdk {'jdk7.45':
  java_archive => 'jdk-7u45-linux-x64.tar.gz',
  java_home    => '/usr/local/java/jdk1.7.0_45/',
  java_folder  => 'jdk1.7.0_45'
}

