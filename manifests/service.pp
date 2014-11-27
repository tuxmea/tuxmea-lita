# Class lita::service
#
# private subclass
#
class lita::service {
    $lita_name = $lita::lita_name
    $adapter = $lita::adapter
    exec { 'install_gems':
        command => 'source /usr/local/rvm/scripts/rvm && bundle install',
        cwd     => "/etc/lita/${lita_name}",
        path    => '/usr/bin:/usr/local/bin:/usr/local/rvm/gems/ruby-2.1.5/bin',
        creates => "/etc/lita/${lita_name}/Gemfile.lock",
    } ->
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
