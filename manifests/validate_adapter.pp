# Class validate_adapter
#
# checks for known adapters and their required configuration options
# private class
#
class lita::validate_adapter {
    $adapter = $lita::adapter
    $adapter_config = $lita::adapter_config
    $known_adapter = $lita::known_adapter
    validate_string($adapter)
    validate_hash($adapter_config)
    if ! member($known_adapter, $adapter) {
        fail("Unknown adapter: ${adapter}")
    }
    if ! $adapter_config[$adapter] {
        fail("No config found for adapter: ${adapter}")
    }
    case $adapter {
        'hipchat': {
            validate_string($adapter_config[$adapter]['jid'])
            validate_string($adapter_config[$adapter]['password'])
            validate_string($adapter_config[$adapter]['muc_domain'])
            if $adapter_config[$adapter]['debug'] {
                validate_bool($adapter_config[$adapter]['debug'])
            }
            if $adapter_config[$adapter]['room'] {
                validate_string($adapter_config[$adapter]['room'])
            }
        }
        'irc': {
            validate_string($adapter_config[$adapter]['server'])
            validate_string($adapter_config[$adapter]['channel'])
            validate_string($adapter_config[$adapter]['username'])
            validate_string($adapter_config[$adapter]['password'])
            if $adapter_config[$adapter]['log_level'] {
                $log_levels = ['warn', 'info', 'error']
                if ! member($log_levels, $adapter_config[$adapter]['log_level']) {
                    fail("Unknown log level in adapter config for irc: ${adapter_config}[${adapter}]['log_level']")
                }
            }
        }
        'xmpp': {
            validate_string($adapter_config[$adapter]['jid'])
            validate_string($adapter_config[$adapter]['password'])
            validate_string($adapter_config[$adapter]['muc_domain'])
            if $adapter_config[$adapter]['debug'] {
                $debug_levels = ['warn', 'info', 'error']
                if ! member($debug_levels, $adapter_config[$adapter]['debug']) {
                    fail("Unknown debug level in adapter config for xmpp: ${adapter_config}[${adapter}]['debug']")
                }
            }
            if $adapter_config[$adapter]['room'] {
                validate_string($adapter_config[$adapter]['room'])
            }
            if $adapter_config[$adapter]['connect_domain'] {
                validate_string($adapter_config[$adapter]['connect_domain'])
            }
            if $adapter_config[$adapter]['mention_name'] {
                validate_string($adapter_config[$adapter]['mention_name'])
            }
        }
        'shell': {
            notice('Shell needs no data validation')
        }
        default: {
            fail('Adapter validater throws an error. You are missing adapter validation after you have enabled a new adapter')
        }
    }
}
