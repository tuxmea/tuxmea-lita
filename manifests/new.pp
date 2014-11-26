# Class lita::new
#
# private subclass
#
class lita::new {
    $lita_name = $lita::lita_name
    file { '/etc/lita':
        ensure => directory,
    }
    file { "/etc/lita/${lita_name}":
        ensure => directory,
    }
    exec { 'lita_new':
        command => "lita new ${lita_name}",
        path    => '/usr/bin:/usr/local/bin',
        cwd     => "/etc/lita/${lita_name}",
        require => File["/etc/lita/${lita_name}"],
        creates => "/etc/lita/${lita_name}/Gemfile",
    }
    concat { "/etc/lita/${lita_name}/Gemfile":
        ensure => present,
    }
    concat { "/etc/lita/${lita_name}/lita_config.rb":
        ensure => present,
    }
}
