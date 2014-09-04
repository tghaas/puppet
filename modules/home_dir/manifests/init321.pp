# Purpose: Extract Home Directory
#
# Override defaults in the node manifest:
#
#
#class { 'home_dir':
#  home_dir_archive => 'tcnode2.20140819.tgz',
#  home_dir_owner   => 'web',
#  home_directory   => '/home/web',
#  home_dir_group   => 'apps'
#}
class home_dir
  {
  define home_dir (
    
      $home_dir_archive = 'web.20140819.tgz',
      $home_dir_owner   = 'web',
      $home_directory   = '/home/${home_dir_owner}',
      $home_dir_group   = 'apps',
  ){
  Exec {
    path => [ '/usr/bin', '/bin', '/usr/sbin']
  }

  file { "/tmp/${home_dir_archive}" :
    ensure => present,
    source => "puppet:///modules/home_dir/${home_dir_archive}",
    owner  => vagrant,
    mode   => '0755',
  }

  exec { 'extract home_dir':
    cwd     => '/tmp',
    command => "tar xfv ${home_dir_archive}",
    creates => $home_directory,
    require => File["/tmp/${home_dir_archive}"],
  }

  file { "/tmp/${home_dir_owner}" :
    ensure  => directory,
    owner   => vagrant,
    require => Exec['extract home_dir'],
  }

  exec { 'move home_dir':
    cwd     => '/tmp',
    creates => $home_directory,
    require => File["/tmp/${home_dir_owner}"],
    command => "mv /tmp/${home_dir_owner} /home/${home_dir_owner}",
  }

  exec { 'chown':
    command => "/bin/chown -R $home_dir_owner.$home_dir_group /home/$home_dir_owner",
    path    => '/bin',
    user    => 'root',
    require => Exec['move home_dir'],
  }
}
}