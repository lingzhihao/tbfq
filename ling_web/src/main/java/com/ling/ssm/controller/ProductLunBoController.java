package com.ling.ssm.controller;

import com.ling.ssm.biz.ProductImgBiz;
import com.ling.ssm.biz.ProductLunBoBiz;
import com.ling.ssm.entity.ProductImg;
import com.ling.ssm.entity.ProductLunBo;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller("productLunBoController")
@RequestMapping("/houtai/productLunBo")
public class ProductLunBoController {

    @Autowired
    private ProductLunBoBiz productLunBoBiz;

    //图片套餐列表
    @RequestMapping("/list")
    public String list(Map<String,Object> map){
        map.put("productLunBoList",productLunBoBiz.getAll());
        return "/houtai/product_lunbo_list";
    }

    //跳转添加页面
    @RequestMapping("/to_add")
    public String toAdd(){
        return "/houtai/product_lunbo_add";
    }

//    //添加
//    @RequestMapping("/add")
//    public String add(ProductImg productImg){
//        productImgBiz.add(productImg);
//        return "redirect:list";
//    }

    @RequestMapping("/upload")
    public String springUpload(HttpServletRequest request, MultipartFile[] header, ProductLunBo productLunBo) {

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
       /* System.out.println("name:" +name);*/
        productLunBo.setlImage1(listImagePath.get(0));
        productLunBo.setlImage2(listImagePath.get(1));
        productLunBo.setlImage3(listImagePath.get(2));
        productLunBo.setlImage4(listImagePath.get(3));
        productLunBo.setlImage5(listImagePath.get(4));
        productLunBoBiz.add(productLunBo);
        return "redirect:list";
    }


    //跳转修改页面  使用params属性，强制要求 必须传入 gGno 图片套餐编号
    @RequestMapping(value = "/to_update",params = "lLno")
    public String toUpdate(int lLno,Map<String,Object> map){
        map.put("productLunBo",productLunBoBiz.get(lLno));
        return "/houtai/product_lunbo_update";
    }

//    //添加

//    @RequestMapping("/update")
//    public String update(ProductImg productImg){
//        productImgBiz.edit(productImg);
//        return "redirect:list";
//    }
    @RequestMapping("/update")
    public String update(HttpServletRequest request,MultipartFile[] header,ProductLunBo productLunBo) {

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
               System.out.println(url);
               System.out.println("第" + i + " 文件名：" + picName);
               listImagePath.add(picName);
           }

        }
        System.out.println("name:" +name);
        productLunBo.setlImage1(listImagePath.get(0));
        productLunBo.setlImage2(listImagePath.get(1));
        productLunBo.setlImage3(listImagePath.get(2));
        productLunBo.setlImage4(listImagePath.get(3));
        productLunBo.setlImage5(listImagePath.get(4));
        productLunBoBiz.edit(productLunBo);
        return "redirect:list";
    }
    //删除套餐图片
    @RequestMapping(value = "/remove",params = "lLno")
    public String remove(int lLno){
        try {
            productLunBoBiz.remove(lLno);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:list";
    }



}
