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
    $lita_name      = 'lita'
    $adapter        = 'shell'
    $redis          = {}
    $http_port      = '8080'
    $log_level      = 'info'
    $adapter_config = { 'shell' => {} }
    $handler_config = {}
    $known_handler  = ['jenkins']
    $known_adapter  = ['shell', 'irc', 'hipchat', 'xmpp']
}
