class lita::install {
    Package {
        ensure   => present,
        provider => gem,
    }
    package { 'lita': }
}
