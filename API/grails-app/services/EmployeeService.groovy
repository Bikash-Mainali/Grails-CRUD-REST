import grails.gorm.transactions.Transactional
import grails.rest.crud.Employee
import models.ResponseModel
import org.hibernate.Session
import org.hibernate.SessionFactory
import javax.servlet.http.HttpServletResponse

@Transactional
class EmployeeService {

    SessionFactory sessionFactory
    ResponseModel responseModel;

    def doSave(Employee employee) {
        return employee.save()
    }

    //returns list of data from domain class named 'Student'
    @Transactional(readOnly = true)
    def findAll(String uriPath) {
        //to directly fetch all data using GORM default
         def empDetailsList = Employee.list()

        //using createSqlQuery
        try {
            Session session = sessionFactory.openSession()
            session.beginTransaction()
            String sql = "SELECT  first_name, last_name, " +
                    "position,join_date, manager, department " +
                    "from employee"
            org.hibernate.Query query = session.createSQLQuery(sql)
            session.getTransaction().commit()
            def result = query.list()
            def employeeList = []

            result.forEach({ data ->
                (
                        employeeList.add(new Employee(data)))
            })
       /*    for(def data : result){
                employeeList.add(new Employee(data))
            }*/
            println("......"+result)
            try {
                session.close()
            } catch (Exception ex) {
                return new ResponseModel("Session Error!", HttpServletResponse.SC_ACCEPTED, employeeList, uriPath)
            }
            return new ResponseModel("Data fetched", HttpServletResponse.SC_OK, employeeList, uriPath)
        }
        catch (Exception ex) {
            ex.printStackTrace()
            return new ResponseModel("Something went wrong", HttpServletResponse.SC_BAD_REQUEST, uriPath)
        }
    }

    @Transactional(readOnly = true)
    def findById(id) {
        return Employee.get(id)  //return statement is optional in Grails


        /*     if (employeeService.findById(id) == null) {
                 //String toPath = ((ServletWebRequest) webRequest).getRequest().getRequestURL().toString();
                 respond new ResponseModel("No data found with id: " + id, HttpServletResponse.SC_OK, null, request.forwardURI)
             } else {
                 respond employeeService.findById(id)
             }*/
    }

    def delete(id) {
        Employee.get(id).delete()
    }
}