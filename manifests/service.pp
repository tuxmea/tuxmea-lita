# Class lita::service
#
# private subclass
#
class lita::service {
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
