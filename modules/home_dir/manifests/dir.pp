define home_dir::dir (
    
      $home_dir_archive = 'web.20140819.tgz',
      $home_dir_owner   = 'web',
      $home_directory   = '/home/${home_dir_owner}',
      $home_dir_group   = 'apps',
  ) {
  Exec {
    path => [ '/usr/bin', '/bin', '/usr/sbin']
  }

  file { "/tmp/${home_dir_archive}" :
    ensure => present,
    source => "puppet:///modules/home_dir/${home_dir_archive}",
    owner  => vagrant,
    mode   => '0755',
  }

  exec { "extract::$title":
    cwd     => '/tmp',
    command => "tar xfv ${home_dir_archive}",
    creates => $home_directory,
    require => File["/tmp/${home_dir_archive}"],
  }

  file { "/tmp/${home_dir_owner}" :
    ensure  => directory,
    owner   => vagrant,
    require => Exec["extract::$title"],
  }

  exec { "move::$title":
    cwd     => '/tmp',
    creates => $home_directory,
    require => File["/tmp/${home_dir_owner}"],
    command => "mv /tmp/${home_dir_owner} /home/${home_dir_owner}",
  }

  exec { "chown::$title":
    command => "/bin/chown -R $home_dir_owner.$home_dir_group /home/$home_dir_owner",
    path    => '/bin',
    user    => 'root',
    require => Exec["move::$title"],
  }
}