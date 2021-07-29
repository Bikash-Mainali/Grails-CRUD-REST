package models

import javax.servlet.http.HttpServletResponse

class ResponseModel {
    String responseMessage
    Integer responseCode = HttpServletResponse.SC_OK
    Boolean isSuccess
    def data = null
    String path;

    ResponseModel(String responseMessage, Integer responseCode, def data, String path) {
        this.responseMessage = responseMessage
        this.isSuccess = responseCode.equals(HttpServletResponse.SC_OK)
        this.responseCode = responseCode
        this.data = data
        this.path = path;
    }

    ResponseModel(String responseMessage, Integer responseCode, String path) {
        this.responseMessage = responseMessage
        this.isSuccess = responseCode.equals(HttpServletResponse.SC_OK)
        this.responseCode = responseCode
        this.data = data
        this.path = path;
    }

    ResponseModel(def data) {
        this.data = data;
        println(data)
    }
}
