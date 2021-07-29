package grails.rest.crud


//@Resource(uri='/employee',formats=['json', 'xml'])
class Employee {
    String firstName
    String lastName
    String position
    Date joinDate
    String manager

    String getFirstName() {
        return firstName
    }

    void setFirstName(String firstName) {
        this.firstName = firstName
    }
    String department

    Employee() {}

    Employee(String firstName, String lastName, String position, Date joinDate, String manager, String department) {
        this.firstName = firstName
        this.lastName = lastName
        this.position = position
        this.joinDate = joinDate
        this.manager = manager
        this.department = department
    }

    Employee(def data) {
        firstName = data[0]
        lastName = data[1]
        position = data[2]
        joinDate = data[3]
        manager = data[4]
        department = data[5]
    }
    static mapping = {
        version false
        id generator: 'increment', column: 'nid'
    }
}