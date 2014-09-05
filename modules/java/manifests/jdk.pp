define java::jdk (
  $java_archive  = 'jdk-7u45-linux-x64.tar.gz',
  $java_home     = '/usr/local/java/jdk1.7.0_45/',
  $java_folder   = 'jdk1.7.0_45',
  $owner         = 'root',
  $group         = 'root')
{
  Exec {
    path => [ '/usr/bin', '/bin', '/usr/sbin']
  }

  file { "/tmp/${java_archive}" :
    ensure  => present,
    source  => "puppet:///modules/java/${java_archive}",
    owner   => $owner,
    group   => $group,
    mode    => '0755',
    require => Class['java']
  }

  exec { "extract::$title":
    cwd     => '/tmp',
    command => "tar zxf /tmp/${java_archive} -C /usr/local/java/;chown -R ${owner}.${group} ${java_home}",
    creates => $java_home,
    require => File["/tmp/${java_archive}"],
  }

}