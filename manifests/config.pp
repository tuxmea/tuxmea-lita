class lita::config {
    $lita_name = $lita::lita_name
    concat::fragment { "Gemfile_${lita_name}_header":
        target  => "/etc/lita/${lita_name}/Gemfile",
        content => template('lita/Gemfile_header.erb'),
        order   => '01',
    }
    concat::fragment { "config_${lita_name}_header":
        target  => "/etc/lita/${lita_name}/lita_config.rb",
        content => template('lita/config_header.erb'),
        order   => '01',
    }
    concat::fragment { "config_${lita_name}_footer":
        target  => "/etc/lita/${lita_name}/lita_config.rb",
        content => template('lita/config_footer.erb'),
        order   => '99',
    }
}
