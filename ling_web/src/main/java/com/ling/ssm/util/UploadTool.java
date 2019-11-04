package com.ling.ssm.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class UploadTool {

    public static String uploadImage(MultipartFile imageFile) throws IOException {
        String newImageName = null;
        if (!imageFile.isEmpty()) {    //(1)
            String realPath = "C:\\java\\images\\";  //(2)
            String originalName = imageFile.getOriginalFilename();  //(3)
            String uuidName = UUID.randomUUID().toString();  //(4)
            newImageName = uuidName + originalName.substring(originalName.lastIndexOf("."));  //(4)
            File file = new File(realPath + newImageName);  //(5)
            imageFile.transferTo(file);  //(6)
            return newImageName;  //(7)
        }
        return newImageName;
    }

}
