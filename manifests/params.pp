# Class lita::params
#
# APL v2
#
# Martin Alfke
# <info@martin-alfke.de>
#
# Set defaults for lita puppetmodule
#
# can be overwritten by using lita as a parameterized class
#
class lita::params {
    #private("Class lita::params is private and may not be called from ${caller_module_name}")
    $lita_name      = 'lita'
    $adapter        = 'shell'
    $redis          = {}
    $http_port      = '8080'
    $log_level      = 'info'
    $adapter_config = {}
    $handler_config = {}
    $known_handler  = ['jenkins']
}
