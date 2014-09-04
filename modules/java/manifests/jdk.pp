define java::jdk (
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

  exec { "extract::$title":
    cwd     => '/tmp',
    command => "tar xfv ${java_archive}",
    creates => $java_home,
    require => File["/tmp/${java_archive}"],
  }

  file { '/usr/local/java' :
    ensure  => directory,
    owner   => vagrant,
    require => Exec["extract::$title"]
  }

  exec { "move::$title":
    cwd     => '/tmp',
    creates => $java_home,
    require => File['/usr/local/java'],
    command => "mv ${java_folder} /usr/local/java/"
  }
}