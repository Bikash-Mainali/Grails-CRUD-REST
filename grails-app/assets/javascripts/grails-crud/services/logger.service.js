angular.module('myApp')
    .factory('logger', logger);

logger.$inject = ['$log'];

function logger($log) {
    var service = {

        error: error,
        info: info,
        success: success,
        warning: warning,
        debug: debug,

        log: $log.log
    };

    return service;
    /////////////////////

    function error(message, data, title) {
        $log.error('Error: ' + message, data);
    }

    function info(message, data, title) {
        $log.info('Info: ' + message, data);

    }

    function success(message, data, title) {
        $log.info('Success: ' + message, data);

    }

    function warning(message, data, title) {
        $log.warn('Warning: ' + message, data);

    }

    function debug(message, data, title) {
        $log.debug('Debug: ' + message, data);

    }
}