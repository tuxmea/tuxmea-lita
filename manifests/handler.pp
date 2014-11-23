# Define lita::handler
#
# lita may have multiple handlers.
# see README.md for further details
#
# see params.pp for supported handlers
#
define lita::handler {
    $handler        = $title
    $lita_name      = $lita::lita_name
    $handler_config = $lita::handler_config
    $known_handler  = $lita::known_handler
    validate_string($handler, $lita_name)
    validate_hash($handler_config)
    if ! member($known_handler, $handler) {
        fail("Unknown handler: ${handler}. Please use one of ${known_handler}")
    }
    if ! $handler_config[$handler] {
        fail("No config set for handler: ${handler}")
    }
    package { "lita-${handler}":
        ensure   => present,
        provider => gem,
    }
    concat::fragment { "Gemfile_${lita_name}_${handler}":
        target  => "/etc/lita/${lita_name}/Gemfile",
        content => template('lita/Gemfile_handler.erb'),
        order   => '50',
    }
    concat::fragment { "config_${lita_name}_${handler}":
        target  => "/etc/lita/${lita_name}/lita_config.rb",
        content => template("lita/config_handler_${handler}.erb"),
        order   => '50',
    }
    lita::validate_handler { $handler:
        handler_config => $handler_config,
    }
}
