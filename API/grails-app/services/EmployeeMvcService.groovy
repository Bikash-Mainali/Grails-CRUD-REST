import grails.gorm.transactions.Transactional
import grails.rest.crud.Employee

@Transactional
class EmployeeMvcService {

    @Transactional(readOnly = true)
    def findAllEmployee() {

        //to directly fetch all data using GORM default
        def empDetailsList = Employee.list()
        return empDetailsList;

    }

    @Transactional(readOnly = true)
    def get(id) {
        return Employee.get(id)
    }

    def save(Employee employee) {
        return employee.save()
    }

    def delete(id) {
        Employee.get(id).delete()
    }

}
