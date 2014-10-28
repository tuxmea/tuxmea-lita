class lita (
    $lita_name = $lita::params::lita_name,
    $adapter   = $lita::params::adapter,
    $redis     = $lita::params::redis,
    $http_port = $lita::params::http_port,
    $log_level = $lita::params::log_level,
) inherits lita::params {
    include lita::install
    include lita::new
    include lita::config
    include lita::service
    Class['lita::install'] -> Class['lita::new'] -> Class['lita::config'] ~> Class['lita::service']
    Class['lita::install'] ~> Class['lita::service']
}
