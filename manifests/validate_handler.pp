# Define lita::validate_handler
#
# private subclass
#
define lita::validate_handler(
    $handler_config,
){
    private("Do not call lita::validate_handler directly.")
    $handler = $title
    case $handler {
        'jenkins': {
            validate_string($handler_config[$handler]['url'])
        }
        default: {
            fail("No matching handler varification found in lita::validate_handler.")
        }
    }
}
