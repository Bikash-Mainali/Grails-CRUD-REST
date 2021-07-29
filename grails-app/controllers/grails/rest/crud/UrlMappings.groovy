package grails.rest.crud

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
         //"/"(view:"/employee/welcome")
        //for MVC only
        '/'(controller:'employee', action:'index')
     /*   '/employee/getAllEmployee'(controller:'employee',action:'getAllEmployee')
        // employee is a controller and getAllEmployee is a method
        '/employee/getEmployeeById'(controller:'employee',action:'getEmployeeById')
*/
        //for REST API
        '/api/getAllEmployee'(controller:'api',action:'getAllEmployee')
        '/api/getEmployeeById'(controller:'api',action:'getEmployeeById')
        '/api/addEmployee'(controller:'api',action:'addEmployee')
        '/api/deleteById'(controller:'api',action:'deleteById')
        '/api/updateEmployeeById/$id?'(controller:'api',action:'updateEmployeeById', method:'POST')
        '/api/addEmployee'(controller:'api',action:'addEmployee')
        '/addEmployee'(controller:'employee', action: "employeeAddForm")
        '/editEmployee'(controller:'employee', action: "employeeAddForm")
        "500"(view:'/error')
        "404"(view:'/notFound')
        '/employee/test'(view: '/employee/test.gsp')
    }
}
