package grails.rest.crud
import grails.gorm.transactions.Transactional

@Transactional
class EmployeeMvcService {

    def list() {
        return Employee.list();
    }

    def get(id){
        return Employee.get(id)
    }

    def save(Employee employee){
        employee.save()
    }
    def delete(id){
        Employee.get(id).delete()
    }
}

