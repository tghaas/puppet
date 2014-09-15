include ntp
include ldap

class { 'timezone':
  timezone => 'America/New_York',
}
file { '/nfs_shares':
  ensure => 'directory',
  owner  => 'root',
  mode   => '0755',
}
class { 'nfs::server':
  exports => [
    '/nfs_shares/studiofiles',
    '/nfs_shares/jira_attachments',
    '/nfs_shares/forum_files',
    '/nfs_shares/wiki_attachments',
    '/nfs_shares/assets',
    '/nfs_shares/wordpress',
    '/nfs_shares/captcha',
    '/nfs_shares/member_photos',
    '/nfs_shares/tcs-downloads',
    '/nfs_shares/tcssubmissions',
    '/nfs_shares/invoices',
  ],
  networkallowed => '10.0.0.0',
  netmaskallowed => '255.0.0.0',
  require        => File['/nfs_shares'],
}
