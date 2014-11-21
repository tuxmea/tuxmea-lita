# Class lita::setup
#
# prepare system
# private class
#
class lita::setup {
    private("Class lita::setup is private and may not be called from ${caller_module_name}")
    package { 'gem':
        ensure => present,
    }
}
