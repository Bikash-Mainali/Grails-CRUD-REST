package grails.rest.crud

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        /*  "/"(view:"/employee/index")*/
        //for MVC only
        '/'(controller:'employee', action:'index')
        '/employee/getAllEmployee'(controller:'employee',action:'getAllEmployee')
        // employee is a controller and getAllEmployee is a method
        '/employee/getEmployeeById'(controller:'employee',action:'getEmployeeById')

        //for REST API
        '/api/getAllEmployee'(controller:'api',action:'getAllEmployee')
        '/api/getEmployeeById'(controller:'api',action:'getEmployeeById')
        '/api/deleteById'(controller:'api',action:'deleteById')
        '/api/updateEmployeeById'(controller:'api',action:'updateEmployeeById')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}

/*

package com.djamware

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }


    }
}
*/
