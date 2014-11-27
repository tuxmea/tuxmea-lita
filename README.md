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
    lita_name => 'lita',
    adapter => 'xmpp',
    adapter_config => {
      'xmpp' => {
        'source' => 'https://github.com/tuxmea/lita-xmpp.git',
        'jid' => 'lita@chatops',
        'password' => 'puppet',
        'muc_domain' => 'conference.chatops',
        'connect_domain' => 'chatops.domain.com',
        'rooms' => 'chatops'
      }
    },
  }
  ```

Install handlers
  ```
  lita::handler { 'jenkins':
    lita_name => 'lita',
    handler_config => {
      'jenkins' => {
        'url' => 'http://jenkins.domain.com:8080'
      }
    },
  }
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

