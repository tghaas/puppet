define download::file ($uri, $timeout = 300) {
  package { "wget": 
    ensure => installed,
  }
  exec {
    "download $uri":
      command => "/usr/bin/wget -q '$uri' -O $name",
      creates => $name,
      timeout => $timeout,
      require => Package["wget"],
  }
}