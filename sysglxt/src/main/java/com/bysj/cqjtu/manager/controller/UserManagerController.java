

package com.bysj.cqjtu.manager.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bysj.cqjtu.manager.domain.Sy02;
import com.bysj.cqjtu.manager.service.UserManagerService;
import com.bysj.cqjtu.util.ExceltoList;

/**
 * 管理员用户管理
 * @author fuzhengjun
 *2017年3月22日下午5:00:43
 *
 */
@RequestMapping("/userManager")
@Controller
public class UserManagerController {
    @Autowired
    private UserManagerService userManagerService;
    
    /**
     * 获取所有用户信息
     * @return
     * @throws Exception
     */
    @RequestMapping("/getAllUser")
    @ResponseBody
    public List<Sy02> getAllUser()throws Exception{
        return userManagerService.getAllUser();
    }
    /**
     * 删除用户信息
     * @param csy020
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteUser")
    @ResponseBody
    public Map deleteUser(int csy020)throws Exception{
       boolean deleteFlag=userManagerService.deleteUser(csy020);
       Map map=new HashMap();
       if(deleteFlag==true){
           map.put("statu", "1");
       }else{
           map.put("statu", "2");
       }
       return map;
    }
    /**
     * 批量删除用户信息
     * @param ids
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteUserBatch")
    @ResponseBody
    public Map deleteUserBatch(String ids) throws Exception{
        String []arr=ids.split(",");
        boolean deleteFlag;
        int j=0;
        for(int i=0;i<arr.length;i++){
            deleteFlag=userManagerService.deleteUser(Integer.parseInt(arr[i]));
            if(deleteFlag==true){
                j++;
            }
        }
        Map map=new HashMap();
        if(j==arr.length){           
            map.put("statu", 1);
        }else {
            map.put("statu", 2);
        }
        return map;
    }
    /**
     * 按条件查询用户
     * @param sy02
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryMenuByCondition")
    @ResponseBody
    public List<Sy02> queryMenuByCondition(@RequestBody Sy02 sy02) throws Exception{
        List<Sy02> list=userManagerService.queryMenuByCondition(sy02);
        return list;
    }
    /**
     * 添加用户
     * @param sy02
     * @return
     * @throws Exception
     */
    @RequestMapping("/addUser")
    @ResponseBody
    public Map addUser(@RequestBody Sy02 sy02) throws Exception{
        Map map=new HashMap();
        List<Sy02> list=userManagerService.isExistUser(sy02);
        if(list.size()>=1){
            map.put("statu", 0);
        }else{
            boolean addFlage=userManagerService.addUser(sy02);            
            if(addFlage==true){
                map.put("statu", 1);
            }else{
                map.put("statu",2);
            }
        }
        return map;
    }
    /**
     * 上传文件
     * @param filename
     * @return
     * @throws Exception
     */
    @RequestMapping("/uploadFile")
    @ResponseBody
    public List uploadFile(String filename)throws Exception{
        System.out.println(filename);
        List list=ExceltoList.excel2List(filename);
        return list;
    }
    /**
     * 读取文件
     * @param filename
     * @return
     * @throws Exception
     */
    @RequestMapping("/readExcel")
    @ResponseBody
    public List readExcel(@RequestParam MultipartFile[] btnFile, HttpServletRequest request, HttpServletResponse response)throws Exception{
        //文件类型:btnFile[0].getContentType()  
        //文件名称:btnFile[0].getName()  
        if(btnFile[0].getSize()>Integer.MAX_VALUE){//文件长度  
            //OutputUtil.jsonArrOutPut(response, JSONArray.fromObject("上传文件过大!"));  
        }  
        InputStream is = btnFile[0].getInputStream();//多文件也适用,我这里就一个文件  
        byte[] b = new byte[(int)btnFile[0].getSize()];  
        int read = 0;  
        int i = 0;  
        while((read=is.read())!=-1){  
            b[i] = (byte) read;  
            i++;  
        }  
        is.close(); 
        String newfilename="D://"+btnFile[0].getOriginalFilename();
        OutputStream os = new FileOutputStream(new File(newfilename));
        os.write(b);  
        os.flush();  
        os.close();
        //上传完毕
        //数据处理
        //读取到list
        List<List> list=ExceltoList.excel2List(newfilename);
        List sy02List=new ArrayList();
        for (List rowList : list) {
            Sy02 sy02=new Sy02();
            sy02.setCsy010(Byte.parseByte(""+rowList.get(0)));
            sy02.setCsy021((String)rowList.get(1));
            sy02.setCsy022((String)rowList.get(2));
            sy02List.add(sy02);
        }      
        return sy02List;
    }
}
