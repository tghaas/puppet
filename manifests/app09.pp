class { 'java':
  java_archive => 'jdk-6u18-linux-x64.tar.gz',
  java_home    => '/usr/local/java/jdk1.6.0_18_x64/',
  java_folder  => 'jdk1.6.0_18_x64'
}
class { 'java':
  java_archive => 'jdk-6u45-linux-x64.tar.gz',
  java_home    => '/usr/local/java/jdk1.6.0_45/',
  java_folder  => 'jdk1.6.0_45'
}
include ntp
include ldap

class { 'home_dir':
  home_dir_archive => 'bugs.20140829.tgz',
  home_dir_owner   => 'bugs',
  home_directory   => '/home/bugs',
  home_dir_group   => 'apps'
}
class { 'home_dir':
  home_dir_archive => 'wiki.20140820.tgz',
  home_dir_owner   => 'wiki',
  home_directory   => '/home/wiki',
  home_dir_group   => 'apps'
}
class { 'home_dir':
  home_dir_archive => 'forums20140828.tgz',
  home_dir_owner   => 'forums',
  home_directory   => '/home/forums',
  home_dir_group   => 'apps'
}

class { 'timezone':
    timezone => 'America/New_York',
}
