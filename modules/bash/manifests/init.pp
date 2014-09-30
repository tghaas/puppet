class bash{
  exec { "bash":
    command => "/usr/bin/yum -y update bash",
  }
}