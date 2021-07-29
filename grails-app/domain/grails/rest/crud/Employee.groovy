package grails.rest.crud

class Employee {

    String firstName
    String lastName
    String position
    String joinDate
    String manager
    String department
    Long id
/*    byte[] payload
    String fileName*/



    static mapping = {
        version false
        id column: "emp_id"
    }

    static constraints = {
        firstName nullable: false, blank: false
        lastName nullable: false, blank: false
        position nullable: false, blank: false
        joinDate nullable: false, blank: false
        manager nullable: false, blank: false
        department nullable: false, blank: false
    }

    Employee(def data) {
        id = data[0]
        firstName = data[1]
        lastName = data[2]
        position = data[3]
        joinDate = data[4]
        manager = data[5]
        department = data[6]
     /*   payload = data[6]
        fileName = data[6]*/
    }

    //Employee() {}

/*    Employee(String firstName, String lastName, String position, String joinDate, String manager, String department) {
        this.firstName = firstName
        this.lastName = lastName
        this.position = position
        this.joinDate = joinDate
        this.manager = manager
        this.department = department
    }*/

}
