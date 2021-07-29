package util

import grails.util.Holders
import org.springframework.web.multipart.MultipartFile

class FileUtil {

    public static String getRootPath(){
        return Holders.servletContext?.getRealPath("")
    }


    public static File makeDirectory(String path){
        File file = new File(path)
        if (!file.exists()){
            file.mkdirs()
        }
        return file
    }

//    request.getFile("productFile")
    public static void uploadImage(Integer contactId, MultipartFile multipartFile){
           // String contactImagePath = "${getRootPath()}image/"
            String contactImagePath = "/home/Bikash.Mainali/FM Workspace/Grails-REST-Crud/grails-app/assets/images/"
            makeDirectory(contactImagePath)
            multipartFile.transferTo(new File(contactImagePath, contactId + "-profileImage.jpg"))
            //return multipartFile.originalFilename
    }
}