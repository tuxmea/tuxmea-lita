# Class lita::adapter
#
# lita may have one adapter only.
#
# private subclass
#
class lita::adapter (
    $adapter_config = $lita::adapter_config
){
    private("Class lita::adapter is private and may not be called from ${caller_module_name}")
    $adapter = $lita::adapter
    $lita_name = $lita::lita_name
    if ! $adapter == 'shell' {
      package { "lita-${adapter}":
          ensure   => present,
          provider => gem,
      }
      concat::fragment { "Gemfile_${lita_name}_adapter":
        target  => "/etc/lita/${lita_name}/Gemfile",
        content => template('lita/Gemfile_adapter.erb'),
        order   => '02',
      }
    }
    concat::fragment { "config_${lita_name}_adapter":
        target  => "/etc/lita/${lita_name}/lita_config.rb",
        content => template("lita/config_adapter_${adapter}.erb"),
        order   => '02',
    }
}
