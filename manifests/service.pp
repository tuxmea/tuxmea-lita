# Class lita::service
#
# private subclass
#
class lita::service {
    private("Class lita::service is private and may not be called from ${caller_module_name}")
    $lita_name = $lita::lita_name
    $adapter = $lita::adapter
    file { '/etc/init.d/lita':
        ensure  => file,
        mode    => '0755',
        owner   => 'root',
        group   => 'root',
        content => template('lita/lita_init.sh.erb'),
    }
    service { 'lita':
        ensure  => running,
        enable  => true,
        require => File['/etc/init.d/lita'],
    }
}
