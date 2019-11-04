package com.ling.ssm.controller;

import com.ling.ssm.biz.EmployeeBiz;
import com.ling.ssm.biz.ProductBiz;
import com.ling.ssm.biz.ProductImgBiz;
import com.ling.ssm.biz.ProductLunBoBiz;
import com.ling.ssm.entity.Employee;
import com.ling.ssm.entity.Product;
import com.ling.ssm.entity.ProductImg;
import com.ling.ssm.entity.User;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller("productController")
@RequestMapping("/houtai/product")
public class ProductController {

    @Autowired
    private ProductBiz productBiz;

    @Autowired
    private ProductImgBiz productImgBiz;

    @Autowired
    private ProductLunBoBiz productLunBoBiz;
    //套餐列表
    @RequestMapping("/list")
    public String list(Map<String,Object> map){
        map.put("list",productBiz.getAll());
        return "/houtai/product_list";
    }

    //跳转套餐详细信息
    @RequestMapping(value = "/to_detailed",params = "pId")
    public String to_detailed(String pId,Map<String,Object> map){
        map.put("detailed",productBiz.get(pId));
        return "/houtai/product_detailed";
    }

    //跳转添加页面
    @RequestMapping("/to_add")
    public String toAdd(Map<String,Object> map){
        map.put("product_img_add",productImgBiz.getAll()) ;
        map.put("product_add",new Product());
        map.put("product_lunbo",productLunBoBiz.getAll());
        return "/houtai/product_add";
    }

    //验证套餐ID是否已存在
    @RequestMapping(value="/findPid", method= RequestMethod.POST)
    public @ResponseBody Integer ajaxDemo(@RequestBody Map map) {
        String pId = (String) map.get("account");
//        System.out.println(pId);
        Product product = productBiz.get(pId);//从数据库查找前端出来的用户
        if(product == null){//user为空，说明没有找到该用户，可以注册。反之。
            return 1;//然后返回给前端执行success方法。
        }else{
            return 0;
        }
    }


    //添加套餐
    @RequestMapping("/add")
    public String add( MultipartFile header,Product product){
        String name = "";
        String ImagePath;
        if(header.getOriginalFilename() == null || header.getOriginalFilename() == "" ){
            ImagePath = null;
        }else{
            //使用UUID给图片重命名，并去掉四个“-”
            name = UUID.randomUUID().toString().replaceAll("-", "");
            //获取文件的扩展名
            String ext = FilenameUtils.getExtension(header.getOriginalFilename());
            System.out.println("扩展名：" + ext);
            //设置图片上传路径
            String url = "C:\\java\\images\\";

            String picName = "/upload/" +name + "." + ext;
            try {
                header.transferTo(new File(url + name + "." + ext));
            } catch (Exception e) {
                e.printStackTrace();
            }
            System.out.println(url);
            ImagePath = picName;
        }
        System.out.println("name:" +name);
        System.out.println("ImagePath:" +ImagePath);
        product.setpImg(ImagePath);
        productBiz.add(product);
        return "redirect:list";
    }

    //跳转修改页面  使用params属性，强制要求 必须传入
    @RequestMapping(value = "/to_update",params = "pId")
    public String toUpdate(String pId,Map<String,Object> map){
        map.put("product",productBiz.get(pId));
        map.put("product_img",productImgBiz.getAll());
        map.put("product_lunbo",productLunBoBiz.getAll());
        return "/houtai/product_update";
    }

    //修改套餐
    @RequestMapping("/update")
    public String update( MultipartFile header, Product product) {

        String name = "";
        String ImagePath;
        if(header.getOriginalFilename() == null || header.getOriginalFilename() == "" ){
            ImagePath = null;
        }else{
            //使用UUID给图片重命名，并去掉四个“-”
            name = UUID.randomUUID().toString().replaceAll("-", "");
            //获取文件的扩展名
            String ext = FilenameUtils.getExtension(header.getOriginalFilename());
            System.out.println("扩展名：" + ext);
            //设置图片上传路径
            String url = "C:\\java\\images\\";

            String picName = "/upload/" +name + "." + ext;
            try {
                header.transferTo(new File(url + name + "." + ext));
            } catch (Exception e) {
                e.printStackTrace();
            }
            System.out.println(url);
            ImagePath = picName;
        }
        System.out.println("name:" +name);
        System.out.println("ImagePath:" +ImagePath);
        product.setpImg(ImagePath);
        productBiz.edit(product);
        return "redirect:list";
    }

    //删除套餐
    @RequestMapping(value = "/remove",params = "pId")
    public String remove(String pId){
        productBiz.remove(pId);
        return "redirect:list";
    }




}
