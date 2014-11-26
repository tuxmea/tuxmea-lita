# Class lita::install
#
# private subclass
#
class lita::install {
    anchor { 'lita::install::begin': } ->
    package { 'g++':
        ensure => present,
    } ->
    rvm_gem { 'lita':
        ensure => present,
        ruby_version => '2.1.5',
    } ->
    anchor { 'lita::install::end': }
}
