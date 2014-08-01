class custom_scripts{
  file { "/usr/local/bin/concatenate_configs.sh":
    mode   => 755,
    owner  => root,
    group  => root,
    source => "puppet:///modules/custom_scripts/concatenate_configs.sh",
 }
}
