package grails.rest.crud

import grails.gorm.transactions.Transactional
import models.ResponseModel
import javax.servlet.http.HttpServletRequest
import org.hibernate.Query
import org.hibernate.Session
import org.hibernate.SessionFactory
import util.FileUtil

import javax.servlet.http.HttpServletResponse

@Transactional
class EmployeeService {

    SessionFactory sessionFactory

    FileUtil fileUtil


    def doSave(Employee employee, uriPath) {
        // println("///////////"+employee.getPayload())

        println("....." + employeeAlreadyExist(employee))

        if (employeeAlreadyExist(employee) >= 1) {
            employee.setFirstName(employee.firstName + " " + employeeAlreadyExist(employee))
        }
        def result = employee.save(flush: true, failOnError: true)
        return new ResponseModel("Data Persisted", HttpServletResponse.SC_CREATED, result, uriPath)
    }

    def doPersist(Employee employee) {

        try {
            Session session = sessionFactory.openSession()
            session.beginTransaction()
            String sql = "INSERT INTO employee (emp_id, position, join_date, manager, first_name, last_name, department) VALUES (242, 'asdfas', '2021-03-09', 'asdf', 'fasdfa', 'asdfaas', 'fasdf')"
            Query query = session.createSQLQuery(sql)
            Employee.executeQuery(query)
            println("query ......" + query)
            session.getTransaction().commit()
            session.createSQLQuery(sql)
            try {
                session.close()
            } catch (Exception ex) {
            }
            return new ResponseModel("Data persisted", HttpServletResponse.SC_OK, null, null)
        }
        catch (Exception ex) {
            ex.printStackTrace()
        }
    }

    //returns list of data from domain class named 'Employee'
    @Transactional(readOnly = true)
    def findAll(String uriPath) {
        // return employeeService.list()

        //using createSqlQuery
        try {
            Session session = sessionFactory.openSession()
            session.beginTransaction()
            String sql = "SELECT  emp_id,first_name, last_name, " +
                    "position,join_date, manager, department " +
                    "from employee"
            Query query = session.createSQLQuery(sql)
            session.getTransaction().commit()
            def result = query.list()
            def employeeList = []

            result.forEach({ data ->
                (
                        employeeList.add(new Employee(data)))
            })
            try {
                session.close()
            } catch (Exception ex) {
                println "Session Error"
                return new ResponseModel("Session Error!", HttpServletResponse.SC_ACCEPTED, employeeList, uriPath
                )
            }
            return new ResponseModel("Data fetched", HttpServletResponse.SC_OK, employeeList, uriPath)
        }
        catch (Exception ex) {
            ex.printStackTrace()
            return new ResponseModel("Something went wrong", HttpServletResponse.SC_BAD_REQUEST, uriPath)
        }
    }

    @Transactional(readOnly = true)
    def findById(id, uriPath) {
        try {
            if (Employee.exists(id)) {
                def result = Employee.findById(id)
                println("//////////////" + result)
                return new ResponseModel("Data fetched", HttpServletResponse.SC_OK, result, uriPath)
            } else {
                def result = null
                return new ResponseModel("No data found with id: " + id, HttpServletResponse.SC_NOT_FOUND, result, uriPath)
            }
        }
        catch (Exception ex) {
            ex.printStackTrace()
            return new ResponseModel("Something went wrong", HttpServletResponse.SC_BAD_REQUEST, uriPath)
        }
    }

    def delete(id, uriPath) {
        try {
            if (Employee.exists(id)) {
                Employee.findById(id).delete()
                return new ResponseModel("Employee of : " + id + " Deleted", HttpServletResponse.SC_OK, null, uriPath)
            }
            return new ResponseModel("Employee of : " + id + " Not Found", HttpServletResponse.SC_OK, null, uriPath)
        }
        catch (Exception ex) {
            ex.printStackTrace()
            return new ResponseModel("Something went wrong", HttpServletResponse.SC_BAD_REQUEST, uriPath)
        }
    }

    def update(id, requestData, uriPath) {
        Employee employee = new Employee()
        employee.properties = requestData
        employee.id = id
        def result = employee.save(flush: true, failOnError: true)
        return new ResponseModel("Data Persisted", HttpServletResponse.SC_CREATED, result, uriPath)


        /* try {
             Session session = sessionFactory.openSession()
             session.beginTransaction()
             println("to be updated first name is====== " + requestData.get("firstName"))
             String sql = "UPDATE employee  set " +
                     "first_name ='" + requestData.get("firstName") + "' where id=283"
             Query query = session.createSQLQuery(sql)
             // query.setParameter("id", 2)
             try {
                 session.close()
             } catch (Exception ex) {
                 println "Session Error"
                 return new ResponseModel("Session Error!", HttpServletResponse.SC_ACCEPTED, null, uriPath)
             }
             return new ResponseModel("Data Updated", HttpServletResponse.SC_OK, requestData, uriPath)
         }
         catch (Exception ex) {
             ex.printStackTrace()
             return new ResponseModel("Something went wrong", HttpServletResponse.SC_BAD_REQUEST, uriPath)
         }*/
    }

    def updateData(Employee employee, uriPath) {
        if (employeeExist(employee.id) != null) {
            def result = employee?.save(flush: true, failOnError: true)
            return new ResponseModel("Data Updated", HttpServletResponse.SC_CREATED, result, uriPath)
        } else {
            return new ResponseModel("Data not found with the id:" + employee.id, HttpServletResponse.SC_OK, null, uriPath)
        }
    }

    def employeeExist(def id) {
        return Employee.findById(id)
    }

    def employeeAlreadyExist(Employee employee) {
        try {
            Session session = sessionFactory.openSession()
            session.beginTransaction()
            String sql = "SELECT  emp_id,first_name, last_name, " +
                    "position,join_date, manager, department " +
                    "from employee where first_name like :firstName"
            Query query = session.createSQLQuery(sql)
            query.setParameter("firstName", "%" + employee.firstName + "%")
            session.getTransaction().commit()
            def result = query.list()
            def employeeList = []

            result.forEach({ data ->
                (
                        employeeList.add(new Employee(data)))
            })
            try {
                session.close()
            } catch (Exception ex) {
                println "Session Error"
                return employeeList.size()
            }
            return employeeList.size()
        }
        catch (Exception ex) {
            ex.printStackTrace()
            return employeeList.size()
        }

    }
}