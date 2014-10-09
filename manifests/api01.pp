
include ntp
include ldap
include home_dir
include download

download::file {
  '/tmp/node.20141008.tgz':
    uri     => 'http://10.25.45.226/node.20141008.tgz',
    timeout => 900;
}

home_dir::dir { 'api01':
  home_dir_archive => 'node.20141008.tgz',
  home_dir_owner   => 'node',
  home_directory   => '/home/node',
  home_dir_group   => 'apps';
}

class { 'timezone':
    timezone => 'America/New_York',
}

class {'nfs_mounts':
  nfs_mounts => 'api01.nfs_mounts',
}

class {'nodejs':
  version => '0.10.30'
}