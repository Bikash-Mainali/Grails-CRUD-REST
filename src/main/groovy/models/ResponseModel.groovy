package models

import com.fasterxml.jackson.annotation.JsonFormat

import javax.servlet.http.HttpServletResponse
import java.time.LocalDateTime

class ResponseModel {
    String responseMessage
    Integer responseCode = HttpServletResponse.SC_OK
    Boolean isSuccess
    def data
    String path;

    ResponseModel(String responseMessage, Integer responseCode, def data, String path) {
        this.responseMessage = responseMessage
        this.isSuccess = responseCode.equals(HttpServletResponse.SC_OK) || responseCode.equals(HttpServletResponse.SC_CREATED)
        this.responseCode = responseCode
        this.data = data
        this.path = path;
    }

    ResponseModel(String responseMessage, Integer responseCode) {
        this.responseMessage = responseMessage
        this.isSuccess = responseCode.equals(HttpServletResponse.SC_OK)
        this.responseCode = responseCode
        this.data = data
        this.path = path;
    }

}
