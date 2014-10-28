class lita::install {
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
