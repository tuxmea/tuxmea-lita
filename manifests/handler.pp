define lita::handler {
    $handler        = $title
    $lita_name      = $lita::lita_name
    $handler_config = $lita::handler_config
    validate_string($handler)
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
        content => template("lita/config_handler.erb"),
        order   => '50',
    }
}