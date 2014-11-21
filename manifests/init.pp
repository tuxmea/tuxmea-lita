# Class lita
#
# APL v2
#
# Martin Alfke
# <info@martin-alfke.de>
#
# Initial lita chatops class
#
# lita.io
#
# Parameters:
#
#  lita_name
#  adapter
#  redis
#  http_port
#  log_level
#  adapter_config
#  handler_config
#
# Example usage:
#
# class { 'lita':
#   lita_name      => 'ChatOps',
#   adapter        => 'jabber',
#   http_port      => '8080'
#   log_level      => 'info',
#   adapter_config => { },
# }
#
class lita (
    $lita_name      = $lita::params::lita_name,
    $adapter        = $lita::params::adapter,
    $redis          = $lita::params::redis,
    $http_port      = $lita::params::http_port,
    $log_level      = $lita::params::log_level,
    $adapter_config = $lita::params::adapter_config,
    $handler_config = $lita::params::handler_config,
) inherits lita::params {
    $known_handler = $lita::params::known_handler
    include stdlib
    class { lita::setup:
        stage => 'setup',
    }
    include lita::install
    include lita::new
    include lita::config
    include lita::adapter
    include lita::service
    Class['lita::install'] -> Class['lita::new'] -> Class['lita::config'] -> Class['lita::adapter'] ~> Class['lita::service']
    Class['lita::install'] ~> Class['lita::service']
    Class['lita::adapter'] ~> Class['lita::service']
}
