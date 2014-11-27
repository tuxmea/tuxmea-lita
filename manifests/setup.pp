# Class lita::setup
#
# prepare system
# private class
#
class lita::setup {
    class { 'rvm': }
    rvm_system_ruby { 'ruby-2.1.5':
        ensure      => present,
        default_use => true,
    }
}
