package grails.rest.crud

import models.ResponseModel

class ApiController {

    //to send data as json or xml format as a response
    static responseFormats = ['json', 'xml']
    // static allowedMethods = [getAllEmployee: 'GET', getEmployeeById: 'GET', addEmployee: 'POST', deleteById: 'DELETE']
    ResponseModel responseModel

    def employeeService

    def getAllEmployee() {
        String uriPath = request.forwardURI
        responseModel = employeeService.findAll(uriPath)
        //println("......."+(responseModel as JSON))
        respond responseModel
    }

    def getEmployeeById(Long id) {
        respond employeeService.findById(id)
    }

    def addEmployee() {
        Map requestData = request.JSON as Map // request gets data from requestBody
        Employee employee = new Employee()
        employee.properties = requestData //this line maps requestData map to the model class
        respond employeeService.doSave(employee);
    }

    def deleteById(Long id) {
        // here to get id as a path parameter you should arrange id in UrlMapping method in UrlMappings class
        println("id to be deleted is.." + id)
        employeeService.delete(id)
        redirect action: "getAllEmployee", method: "GET"
    }

    def updateEmployeeById(Long id) {
        println("id to be updated is..." + id)
        //get data by id first
        // respond employeeService.get(id)
/*
        def session = sessionFactory.openSession()
        session.beginTransaction()
        String sql = String.format("insert into employee ", outputLayoutId)
        def q = session.createSQLQuery(sql)
        session.getTransaction().commit()
        def result = q.list()
        session.close()
*/
    }

    private void renderJson() {
        log.info("Receive data: ${params}")
        //render([controller: employee, action: actionName, uri: actionUri] as JSON)
    }

}