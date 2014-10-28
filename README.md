puppet-lita
===========

Puppet Module for Lita ChatOps

This module will install gem packages only !!

Usage
=====

Standard default installation:

  include lita

Install with parameters

  class { lita:
    adapter   => [ 'shell' | 'xmpp' | 'hipchat' ],
    redis     => { host => '1.2.3.4', port => '1234' },
    http_port => '8082',
    log_level => [ 'debug' | 'info' | 'warn' | 'error' | 'fatal' ], 
  }

Parameters
==========

  adapter:
  Choose which adapter to use.
  Defaults to shell
  Will install required gems

  redis:
  Use a hash to configure an existing redis server to use

  http_port:
  Configure lita http port

Contributors
============

  Martin Alfke <tuxmea@gmail.com>

License
=======

APL v2

