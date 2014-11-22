# Class validate_adapter
#
# checks for known adapters and their required configuration options
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
}
