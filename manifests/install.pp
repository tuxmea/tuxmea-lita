class lita::install {
    private("Class lita::adapter is private and my not be called from ${caller_module_name}")
    anchor { 'lita::install::begin': } ->
    package { 'ruby':
        ensure   => present,
    } ->
    package { 'lita':
        ensure   => present,
        provider => gem,
    } ->
    anchor { 'lita::install::end': }
}
