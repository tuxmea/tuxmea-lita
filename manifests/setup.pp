# Class lita::setup
#
# prepare system
# private class
#
class lita::setup {
    package { 'gem':
        ensure => present,
    }
}
