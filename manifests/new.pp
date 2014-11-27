# Class lita::new
#
# private subclass
#
class lita::new {
    $lita_name = $lita::lita_name
    file { '/etc/lita':
        ensure => directory,
    }
    exec { 'lita_new':
        command     => "source /usr/local/rvm/scripts/rvm && lita new ${lita_name}",
        path        => '/usr/bin:/usr/local/bin:/usr/local/rvm/gems/ruby-2.1.5/bin',
        environment => 'HOMEPATH=/root',
        cwd         => '/etc/lita',
        require     => File['/etc/lita'],
        creates     => "/etc/lita/${lita_name}/Gemfile",
    }
}
