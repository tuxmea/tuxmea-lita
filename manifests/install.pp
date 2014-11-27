# Class lita::install
#
# private subclass
#
class lita::install {
    package { 'g++':
        ensure => present,
    }
}
