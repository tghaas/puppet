class nfs_mounts ( $nfs_mounts ){
  package { "nfs-utils": 
    ensure => installed,
  }
  file { "/nfs_shares":
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => 755,
    require => [Package['nfs-utils'],
                 Class['ldap']
               ]
  }
  file { "/nfs_shares/studiofiles":
    ensure  => directory,
    owner   => 503,
    group   => 501,
    mode    => 775,
    require => File['/nfs_shares']
  }
  file { "/nfs_shares/tcs-downloads":
    ensure  => directory,
    owner   => 501,
    group   => 501,
    mode    => 775,
    require => File['/nfs_shares']
  }
  file { "/nfs_shares/tcssubmissions":
    ensure  => directory,
    owner   => 501,
    group   => 501,
    mode    => 775,
    require => File['/nfs_shares']
  }
  file { "/nfs_shares/member_photos":
    ensure  => directory,
    owner   => 501,
    group   => 501,
    mode    => 775,
    require => File['/nfs_shares']
  }
  file { "/nfs_shares/assets":
    ensure  => directory,
    owner   => 503,
    group   => 501,
    mode    => 775,
    require => File['/nfs_shares']
  }
  file { "/nfs_shares/invoices":
    ensure  => directory,
    owner   => 529,
    group   => 501,
    mode    => 775,
    require => File['/nfs_shares']
  }
  file { "/nfs_shares/captcha":
    ensure  => directory,
    owner   => 501,
    group   => 501,
    mode    => 775,
    require => File['/nfs_shares']
  }
  file { "/nfs_shares/forum_files":
    ensure  => directory,
    owner   => 506,
    group   => 501,
    mode    => 775,
    require => File['/nfs_shares']
  }
  file { "/nfs_shares/jira_attachments":
    ensure  => directory,
    owner   => 515,
    group   => 501,
    mode    => 775,
    require => File['/nfs_shares']
  }
  file { "/nfs_shares/wiki_attachments":
    ensure  => directory,
    owner   => 507,
    group   => 501,
    mode    => 775,
    require => File['/nfs_shares']
  }
  file { "/etc/init.d/nfs_mounts":
    ensure  => file,
    mode    => 755,
    owner   => root,
    group   => root,
    source  => "puppet:///modules/nfs_mounts/$nfs_mounts",
    require => Package['nfs-utils'],
   }    
  file { '/etc/rc4.d/S99nfs_mounts':
    ensure  => 'link',
    target  => '/etc/init.d/nfs_mounts',
    require => File['/etc/init.d/nfs_mounts'],
  }
  file { '/etc/rc3.d/S99nfs_mounts':
    ensure  => 'link',
    target  => '/etc/init.d/nfs_mounts',
    require => File['/etc/init.d/nfs_mounts'],
  }
  exec { "mount_nfs":
    command => "/etc/rc3.d/S99nfs_mounts",
    path    => "/usr/local/bin/:/bin/",
    require => File['/etc/rc3.d/S99nfs_mounts'],
  }
}