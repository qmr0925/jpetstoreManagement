package com.wbg.swager.controller;

import com.wbg.swager.dao.CategoryMapper;
import com.wbg.swager.dao.PetMapper;
import com.wbg.swager.dao.TagMapper;
import com.wbg.swager.entity.Category;
import com.wbg.swager.entity.Pet;
import com.wbg.swager.entity.R;
import com.wbg.swager.entity.Tag;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/pet")
public class PetController {
    @Autowired
    private PetMapper petMapper;
    @Autowired
    private TagMapper tagMapper;
    @Autowired
    private CategoryMapper categoryMapper;
    /**
     * 调转页面
     * @param model
     * @return
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("pet",petMapper.selectAll());
        model.addAttribute("tag",tagMapper.selectAll());
        return "pet";
    }
    /**
     * 调转页面
     * @param model
     * @return
     */
    @RequestMapping(value = "/petadd",method = RequestMethod.GET)
    public String useradd(Model model) {
        model.addAttribute("tag",tagMapper.selectAll());
        model.addAttribute("category",categoryMapper.selectAll());
        return "petadd";
    }//添加操作
//    @RequestMapping(value = "/add",method = RequestMethod.POST)
//    public String petPost(Pet pet,@RequestPart("tp") MultipartFile multipartFile, Model model,HttpServletRequest request) {
//        if(!multipartFile.isEmpty()){
//            if (!multipartFile.getContentType().contains("image/")) {
//                model.addAttribute("err", "只能是图片文件！");
//                return "/inputfile";
//            }
//            if (multipartFile.getSize() > 1024 * 1024 * 5) {
//                model.addAttribute("err", "只能是5M以下！");
//                return "/inputfile";
//            }
//            //取得相对路径
//            String basePath = request.getServletContext().getRealPath("/img");
//            String rekativePath;
//            File files = new File(basePath);
//            if(!files.exists()){
//                files.mkdir();
//            }
//            try {
//                rekativePath = makeImagePath(multipartFile.getOriginalFilename());
//                File file = new File(basePath+rekativePath);
//                file.getParentFile().mkdir();
//                multipartFile.transferTo(file);
//            } catch (IOException e) {
//                model.addAttribute("err", "上传失败，请重试");
//                return "/petadd";
//            }
//            pet.setStatus(File.separator+"img"+rekativePath);
//        }
//        if (petMapper.insert(pet) > 0) {
//           model.addAttribute("msg", "添加成功");
//            model.addAttribute("", "");
//        } else {
//            model.addAttribute("msg", "添加失败");
//            model.addAttribute("name", pet.getAttr1());
//        }
//        return "petadd";
//    }

    //add操作
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public String add(Pet pet) {
        R r=new R();
        System.out.println(pet.getId());
        try {
            if(petMapper.insert(pet)>0){
                r.setCode(200);
            }
        }catch (Exception e){

            return r.toJson();
        }

        return r.toJson();
    }

    //根据状态查询操作
    @RequestMapping(value = "/CHAXUN", method = RequestMethod.GET)
    public String findByStatus(Model model,  String select) {
        List<Pet> list = petMapper.findByStatus(select);
        model.addAttribute("pet",list);
        return "pet";
    }



    //根据主键查询操作
    @RequestMapping(value = "/{petId}", method = RequestMethod.GET)
    public String getpetId(Model model, @PathVariable("petId") String petId) {
        List<Pet> list = new ArrayList<>();
        Pet p = petMapper.selectByPrimaryKey(petId);
        list.add(p);
        model.addAttribute("petAll", list);
        return "petindex";
    }

    /**
     * 根据主键修改操作
     * petId Updated is a name and status
     */
    @RequestMapping(value = "/change", method = RequestMethod.POST)
    @ResponseBody
    public String change(Pet pet) {
        R r=new R();
        try {
            if(petMapper.updateByPrimaryKey(pet)>0){
                r.setCode(200);
            }
        }catch (Exception e){

            return r.toJson();
        }

        return r.toJson();
    }
//    public String petId(Pet pet, Model model, @PathVariable("petId") int petId) {
//        List<Pet> list = new ArrayList<>();
//        if (petMapper.updateNameStatus(pet) > 0) {
//            model.addAttribute("msg", "修改成功");
//        } else {
//            model.addAttribute("msg", "修改失败");
//        }
//        return "petindex";
//    }

    /**
     * 根据主键删除操作
     * petId
     */
    @RequestMapping(value = "/del",method = RequestMethod.GET)
    @ResponseBody
    public String del(String id) {
        R r=new R();
        try {
            if(petMapper.deleteByPrimaryKey(id)>0){
                r.setCode(200);
            }
        }catch (Exception e){

            return r.toJson();
        }
        return r.toJson();
    }

    @RequestMapping(value = "/pet/{petId}/uploadImage", method = RequestMethod.POST)
    public String uploadImage(Model model, @PathVariable("petId") int petId, MultipartFile multipartFile, HttpServletRequest request) {
        if (!multipartFile.getContentType().contains("image/")) {
            model.addAttribute("err", "只能是图片文件！");
            return "/inputfile";
        }
        if (multipartFile.getSize() > 1024 * 1024 * 5) {
            model.addAttribute("err", "只能是5M以下！");
            return "/inputfile";
        }
        //取得相对路径
        String basePath = request.getServletContext().getRealPath("/img");
        String rekativePath;
        try {
            rekativePath = makeImagePath(multipartFile.getOriginalFilename());
            System.out.println(basePath + rekativePath);
            File file = new File(basePath+rekativePath);
            file.getParentFile().mkdir();
            multipartFile.transferTo(file);
        } catch (IOException e) {
            model.addAttribute("err", "上传失败，请重试");
            return "/inputfile";
        }
        return "/index";
    }

    public String makeImagePath(String fileName) {
        Date date = new Date();
        String[] filename = simpleFile(fileName);
        return String.format("%s%s%supload_%s_%s.%s",
                File.separator,
                new SimpleDateFormat("yyyyMMdd").format(date),
                File.separator,
                filename[0],
                new SimpleDateFormat("hhmmss").format(date),
                filename[1]
        );

    }

    public String[] simpleFile(String file) {
        int sum = file.lastIndexOf(".");
        return new String[]{
                file.substring(0, sum),
                file.substring(sum + 1)
        };
    }
}
