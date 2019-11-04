package com.ling.ssm.controller;

import com.ling.ssm.biz.ProductImgBiz;
import com.ling.ssm.entity.Product;
import com.ling.ssm.entity.ProductImg;
import com.ling.ssm.entity.Test;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.File;
import java.util.*;

@Controller("productImgController")
@RequestMapping("/houtai/productImg")
public class ProductImgController {

    @Autowired
    private ProductImgBiz productImgBiz;

    //图片套餐列表
    @RequestMapping("/list")
    public String list(Map<String,Object> map){
        map.put("list",productImgBiz.getAll());
        return "/houtai/product_img_list";
    }

    //跳转添加页面
    @RequestMapping("/to_add")
    public String toAdd(){

        return "/houtai/product_img_add";
    }

//    //添加
//    @RequestMapping("/add")
//    public String add(ProductImg productImg){
//        productImgBiz.add(productImg);
//        return "redirect:list";
//    }

    @RequestMapping("/upload")
    public String springUpload(HttpServletRequest request,MultipartFile[] header,ProductImg productImg) {
        String name = "";
        List<String> listImagePath = new ArrayList<>();
        for (int i=0;i < header.length;i++){
            System.out.println(header[i]);
            //使用UUID给图片重命名，并去掉四个“-”
            name = UUID.randomUUID().toString().replaceAll("-", "");
            //获取文件的扩展名
            String ext = FilenameUtils.getExtension(header[i].getOriginalFilename());
            //设置图片上传路径
            String url = "C:\\java\\images\\";
            String picName = "/upload/" +name + "." + ext;
            try {
                header[i].transferTo(new File(url + name + "." + ext));
            } catch (Exception e) {
                e.printStackTrace();
            }
            System.out.println(url);
            System.out.println("第" + i + " 文件名：" + picName);
            listImagePath.add(picName);
        }
        System.out.println("name:" +name);
        productImg.setgImage1(listImagePath.get(0));
        productImg.setgImage2(listImagePath.get(1));
        productImg.setgImage3(listImagePath.get(2));
        productImg.setgImage4(listImagePath.get(3));
        productImg.setgImage5(listImagePath.get(4));
        productImgBiz.add(productImg);
        return "redirect:list";
    }


    //跳转修改页面  使用params属性，强制要求 必须传入 gGno 图片套餐编号
    @RequestMapping(value = "/to_update",params = "gGno")
    public String toUpdate(int gGno,Map<String,Object> map){
        map.put("productImg",productImgBiz.get(gGno));
        return "/houtai/product_img_update";
    }

//    //添加

//    @RequestMapping("/update")
//    public String update(ProductImg productImg){
//        productImgBiz.edit(productImg);
//        return "redirect:list";
//    }
    @RequestMapping("/update")
    public String update(HttpServletRequest request,MultipartFile[] header,ProductImg productImg) {
        String name = "";
        List<String> listImagePath = new ArrayList<>();
        for (int i=0;i < header.length;i++){
           if(header[i].getOriginalFilename() == null || header[i].getOriginalFilename() == "" ){
               listImagePath.add(null);
                continue;
           }else{
               //使用UUID给图片重命名，并去掉四个“-”
               name = UUID.randomUUID().toString().replaceAll("-", "");
               //获取文件的扩展名
               String ext = FilenameUtils.getExtension(header[i].getOriginalFilename());
               //设置图片上传路径
               String url = "C:\\java\\images\\";
               String picName = "/upload/" +name + "." + ext;
               try {
                   header[i].transferTo(new File(url + name + "." + ext));
               } catch (Exception e) {
                   e.printStackTrace();
               }
            /*   System.out.println(url);
               System.out.println("第" + i + " 文件名：" + picName);*/
               listImagePath.add(picName);
           }
        }
        productImg.setgImage1(listImagePath.get(0));
        productImg.setgImage2(listImagePath.get(1));
        productImg.setgImage3(listImagePath.get(2));
        productImg.setgImage4(listImagePath.get(3));
        productImg.setgImage5(listImagePath.get(4));
        productImgBiz.edit(productImg);
        return "redirect:list";
    }
    //删除套餐图片
    @RequestMapping(value = "/remove",params = "gGno")
    public String remove(int gGno){
        try {
            productImgBiz.remove(gGno);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:list";
    }



}
