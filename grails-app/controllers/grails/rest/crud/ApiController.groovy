package grails.rest.crud

import grails.converters.JSON
import models.ResponseModel
import util.FileUtil

import javax.servlet.http.HttpServletRequest

class ApiController {

    //to send data as json or xml format as a response
    static responseFormats = ['json', 'xml']
    // static allowedMethods = [getAllEmployee: 'GET', getEmployeeById: 'GET', addEmployee: 'POST', deleteById: 'DELETE', updateEmployeeById: 'PUT']
    ResponseModel responseModel

    EmployeeService employeeService

    def getAllEmployee() {
        String uriPath = request.forwardURI
        responseModel = employeeService.findAll(uriPath)
        def firstData = responseModel.data
        firstData = null
        println(firstData?.position)

      /*  def lst = [1,2,3,4];
        lst.each {it->if(it%2==0){println(it)}}
        print("The list will only display those numbers which are divisible by 2")

*/

        def lst = [1,2,3,4];
        def newlst = [];
        newlst = lst.collect {element -> return element * element}
        println(newlst);

        respond responseModel
    }

    def getEmployeeById(Long id) {
        respond employeeService.findById(id, request.forwardURI)
    }

    def addEmployee(Employee employee) {
        //Map requestData = request.JSON as Map
        // employeeService.doPersist(employee)
        //def file = request.getFile('file')
        //println(file.getBytes())
        // def uploadedFile = request.getFile('file')
        //employee.payload = uploadedFile.getBytes()
        // employee.fileName = uploadedFile.originalFilename
        responseModel = employeeService.doSave(employee, request.forwardURI)
        //Integer i = (int) (long) responseModel.data.id
        //FileUtil.uploadImage(i,file)
        respond responseModel
    }

    def deleteById(Long id) {
        println("deleting id...." + id)
        // here to get id as a path parameter you should arrange id in UrlMapping method in UrlMappings class
        respond employeeService.delete(id, request.forwardURI)
    }

    def updateEmployeeById(Employee employee,Long id) {
        //here id  automatically binds with path variable and request body automatically binds with employee object
        employee.id = id   // same as employee.setId(id)
        respond employeeService.updateData(employee, request.forwardURI)
    }

/*
    def uploadFile(){



        *//*      if (request.getFile("contactImage") && !request.getFile("contactImage").filename.equals("")){
                  String image = fileUtil.uploadContactImage(request.getFile("contactImage"))
                  if (!image.equals("")){
                      contact.image = image
                      contact.save(flush:true)
                  }
              }*//*
    }*/


}