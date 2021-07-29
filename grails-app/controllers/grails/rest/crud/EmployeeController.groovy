package grails.rest.crud

class EmployeeController {
    def employeeMvcService

    def index() {
        redirect action: "welcome", method: "GET"
    }

    def welcome() {}

    def getAllEmployee() {
        respond employeeMvcService.list()

    }

    def show(Long id) {
        respond employeeMvcService.get(id)
    }

    def addEmployee() {
        println("..................adding employee..............");
        println(params)
        respond new Employee(params)
    }

    def save(Employee employee) {
        employeeMvcService.save(employee)
        redirect action: "getAllEmployee", method: "GET"
    }
    def delete(Long id) {
        employeeMvcService.delete(id)
        redirect action: "getAllEmployee", method: "GET"
    }

    def employeeAddForm(){
        redirect action: "addEmployee", method: "GET"
    }

}
