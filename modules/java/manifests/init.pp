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
class java(
  $java_archive  = 'jdk-7u45-linux-x64.tar.gz',
  $java_home     = '/usr/local/java/jdk1.7.0_45/',
  $java_folder   = 'jdk1.7.0_45')
  {

  Exec {
    path => [ '/usr/bin', '/bin', '/usr/sbin']
  }

  file { "/tmp/${java_archive}" :
    ensure => present,
    source => "puppet:///modules/java/${java_archive}",
    owner  => vagrant,
    mode   => '0755'
  }

  exec { 'extract jdk':
    cwd     => '/tmp',
    command => "tar xfv ${java_archive}",
    creates => $java_home,
    require => File["/tmp/${java_archive}"],
  }

  file { '/usr/local/java' :
    ensure  => directory,
    owner   => vagrant,
    require => Exec['extract jdk']
  }

  exec { 'move jdk':
    cwd     => '/tmp',
    creates => $java_home,
    require => File['/usr/local/java'],
    command => "mv ${java_folder} /usr/local/java/"
  }

  exec {'install java':
    require   => Exec['move jdk'],
    logoutput => true,
    command   => "update-alternatives --install /bin/java java ${java_home}/bin/java 1"
  }

  exec {'set java':
    require   => Exec['install java'],
    logoutput => true,
    command   => "update-alternatives --set java ${java_home}/bin/java"
  }

  exec {'install javac':
    require   => Exec['move jdk'],
    logoutput => true,
    command   => "update-alternatives --install /bin/javac javac ${java_home}/bin/javac 1"
  }

  exec {'set javac':
    require   => Exec['install javac'],
    logoutput => true,
    command   => "update-alternatives --set javac ${java_home}/bin/javac"
  }

  file { '/etc/profile.d/java.sh':
    content => "export JAVA_HOME=${java_home}
      export PATH=\$PATH:\$JAVA_HOME/bin"
  }
}