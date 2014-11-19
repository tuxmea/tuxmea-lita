puppet-lita
===========

Puppet Module for Lita ChatOps

[![Build Status](https://travis-ci.org/tuxmea/tuxmea-lita.png)](https://travis-ci.org/tuxmea/tuxmea-lita)

This module will install gem packages only !!

Usage
=====

Standard default installation:

  include lita

Install with parameters
  ```
  class { lita:
    lita_name => 'ChatOps'
    adapter        => [ 'shell' | 'xmpp' | 'hipchat' ],
    redis          => { host => '1.2.3.4', port => '1234' },
    http_port      => '8082',
    log_level      => [ 'debug' | 'info' | 'warn' | 'error' | 'fatal' ], 
    adapter_config => { jid => 'user', password => 'pass', debug => false, muc_domain => 'conference.server.com' },
    handler_config => { jenkins => { 'url' => 'http://server.com:8080' } },
  }
  ```

Install handlers
  ```
  lita::handler { 'dig': }
  lita::handler { 'jenkins': }
  ```

Parameters
==========

  lita_name:
    Individual name to use for the lita ChatOps

  adapter:
    Choose which adapter to use.
    Defaults to shell
    Will install required gems

  redis:
    Use a hash to configure an existing redis server to use

  http_port:
    Configure lita http port

  log_level:
    Lita LogLevel

  adapter_config:
    Hash of adapter specific configuration attributes

  handler_config:
    Hash of handler specific configuratoin attributes

Contributors
============

  Martin Alfke <tuxmea@gmail.com>

License
=======

  APL v2

