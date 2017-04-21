package com.bysj.cqjtu.student.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bysj.cqjtu.log.annotation.SystemControllerLog;
import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.student.domain.Sy07;
import com.bysj.cqjtu.student.domain.Sy08;
import com.bysj.cqjtu.student.domain.Sy09;
import com.bysj.cqjtu.student.domain.Sy13;
import com.bysj.cqjtu.student.service.StudentService;
import com.bysj.cqjtu.util.PageEntity;

/**
 * 学生controller
 * @author fuzhengjun
 *2017年3月27日下午10:08:45
 *
 */
@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;
    
    /**
     * 获取课程表
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/syllabus")
    @ResponseBody
    @SystemControllerLog(description ="获取课程表")
    public  PageEntity<Map> getSyllabus(HttpSession session,Integer pageNum,Integer pageSize) throws Exception{
        //取session的用户
        UserMessage userMessage=(UserMessage) session.getAttribute("user");
        
        
        PageEntity<Map> pageBean=studentService.querySyllabus(userMessage,pageNum,pageSize);
        return pageBean;
    }
    /**
     * 获取实验安排的科目
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryExpArrange")
    @ResponseBody
    @SystemControllerLog(description ="获取实验安排的科目")
    public List<Map> queryExpArrange(HttpSession session) throws Exception{
        //取session的用户
        UserMessage userMessage=(UserMessage) session.getAttribute("user");
        Sy04 sy04=userMessage.getSy04();
        
        List<Map> list =studentService.queryExpArrange(sy04);
        return list;
    }
    /**
     * 获取具体实验安排
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryExpArrangeList")
    @ResponseBody
    @SystemControllerLog(description ="获取具体实验安排")
    public List<Sy08> queryExpArrangeList(HttpSession session,String csy060) throws Exception{
      //取session的用户
        UserMessage userMessage=(UserMessage) session.getAttribute("user");        
        Sy08 sy08=new Sy08();
        sy08.setCsy040(userMessage.getSy04().getCsy040());
        sy08.setCsy060(csy060);
        List<Sy08> list =studentService.queryExpArrangeList(sy08);
        return list;
        
    }
    /**
     * 获取实验内容
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryExpArrangeContent")
    @ResponseBody
    @SystemControllerLog(description =" 获取实验内容")
    public List<Map> queryExpArrangeContent(HttpSession session,Integer csy080) throws Exception{
        //取session的用户
        UserMessage userMessage=(UserMessage) session.getAttribute("user");
        Sy08 sy08=new Sy08();
        sy08.setCsy040(userMessage.getSy04().getCsy040());
        sy08.setCsy080(csy080);
        List<Map> list =studentService.queryExpArrangeContent(sy08);
        return list;
        
    }
    /**
     * 保存实验完成内容
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveExp")
    @ResponseBody
    @SystemControllerLog(description =" 保存实验完成内容")
    public Map saveExp(HttpSession session,@RequestBody Sy09 sy09){
        //取session的用户
        UserMessage userMessage=(UserMessage) session.getAttribute("user");
        sy09.setCsy040(userMessage.getSy04().getCsy040());
        try {
            return studentService.saveExp(sy09);
        } catch (Exception e) {
            Map map= new HashMap();
            map.put("statu", e.getMessage());
            return map;
        }        
    }
    /**
     * 保存实验完成内容
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryGrade")
    @ResponseBody
    public  PageEntity<Map> queryGrade(HttpSession session,Integer pageNum,Integer pageSize) throws Exception{
      //取session的用户
        UserMessage userMessage=(UserMessage) session.getAttribute("user");
        Sy07 sy07=new Sy07();
        sy07.setCsy040(userMessage.getSy04().getCsy040());
        return studentService.queryGrade(sy07,pageNum,pageSize);
    }
    /**
     * 查询具体实验安排
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryExpList")
    @ResponseBody
    public List<Map> queryExpList(HttpSession session) throws Exception{
        //取session的用户
        UserMessage userMessage=(UserMessage) session.getAttribute("user");
        Sy04 sy04=userMessage.getSy04();
        List<Map> list=studentService.queryExpList(sy04);
        return list;
    }
    
    private String filename;
    
    public String getFilename() {
        return filename;
    }
    public void setFilename(String filename) {
        this.filename = filename;
    }
    /**
     * 上传实验报告
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/uploadReport")
    @ResponseBody
    @SystemControllerLog(description =" 上传实验报告")
    public Map uploadReport(@RequestParam MultipartFile btnFile, HttpServletRequest request, HttpServletResponse response) throws Exception{
        InputStream is = btnFile.getInputStream();//多文件也适用,我这里就一个文件  
        byte[] b = new byte[(int)btnFile.getSize()];  
        int read = 0;  
        int i = 0;  
        while((read=is.read())!=-1){  
            b[i] = (byte) read;  
            i++;  
        }  
        is.close(); 
        filename="D://"+btnFile.getOriginalFilename();
        OutputStream os = new FileOutputStream(new File(filename));
        os.write(b);  
        os.flush();  
        os.close();
        Map map=new HashMap();
        map.put("address", filename);
        return map;
    }
    /**
     * 保存实验报告
     * @param csy080
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveReport")
    @ResponseBody
    @SystemControllerLog(description =" 保存实验报告")
    public Map saveReport(HttpSession session,String csy080){
        //取session的用户
        UserMessage userMessage=(UserMessage) session.getAttribute("user");        
        Sy09 sy09=new Sy09();
        sy09.setCsy080(csy080);
        sy09.setCsy093(filename);
        sy09.setCsy040(userMessage.getSy04().getCsy040());
        try {
            return studentService.saveReport(sy09);
        } catch (Exception e) {
            Map map= new HashMap();
            map.put("statu", e.getMessage());
            return map;
        } 
    }
    /**
     * 查询成绩详情
     * @param csy060
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryGradeDetai")
    @ResponseBody
    public List<Map> queryGradeDetai(HttpSession session,String csy060) throws Exception{
      //取session的用户
        UserMessage userMessage=(UserMessage) session.getAttribute("user");
        Sy07 sy07 =new Sy07();
        sy07.setCsy040(userMessage.getSy04().getCsy040());
        sy07.setCsy060(csy060);
        
        return studentService.queryGradeDetai(sy07);        
    }
    /**
     * 查看资源类型
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryResourceType")
    @ResponseBody
    public List<Map> queryResourceType() throws Exception{
        
        List<Map> list=studentService.queryResourceType();
        return list;
    }
    /**
     * 查看资源列表
     * @param csy160
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryResourceList")
    @ResponseBody
    @SystemControllerLog(description =" 查看资源列表")
    public List<Map>  queryResourceList(String csy160) throws Exception{
        List<Map> list=studentService.queryResourceList(csy160);
        return list;
    }
    /**
     * 查看资源详细信息
     * @param csy130
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryResourceDetail")
    @ResponseBody
    @SystemControllerLog(description =" 查看资源详细信息")
    public Sy13 queryResourceDetail(Integer csy130) throws Exception{
        Sy13 sy13=new Sy13();
        sy13.setCsy130(csy130);
        return studentService.queryResourceDetail(sy13);
    }
    /**
     * 下载资源
     * @param csy130
     * @throws Exception
     */
    @RequestMapping("/download")
    @SystemControllerLog(description =" 下载资源")
    public void  download(HttpServletResponse response,HttpServletRequest request,Integer csy130) throws Exception{
       /* Sy13 sy13=new Sy13();
        sy13.setCsy130(csy130);
        Sy13 resultSy13=studentService.queryResourceDetail(sy13);
        //springmvc的方法
        String file=resultSy13.getCsy134();
        String fileName=file.substring(file.lastIndexOf("/"));
        String dfileName = new String(fileName.getBytes("utf-8"), "utf-8"); 
        HttpHeaders headers = new HttpHeaders(); 
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM); 
        headers.setContentDispositionFormData("attachment", fileName); 
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(new File(file)), headers, HttpStatus.CREATED); */
        
        Sy13 sy13=new Sy13();
        sy13.setCsy130(csy130);
        Sy13 resultSy13=studentService.queryResourceDetail(sy13);
        String file=resultSy13.getCsy134();
        String fileName=file.substring(file.lastIndexOf("/"));
        //设置content-disposition响应头控制浏览器以下载的形式打开文件，中文文件名要使用URLEncoder.encode方法进行编码，否则会出现文件名乱码  
        response.setContentType("application/octet-stream; charset=utf-8");
        response.setHeader("content-disposition", "attachment;filename="+URLEncoder.encode("模板.xls", "UTF-8"));  
        InputStream in = new FileInputStream(file);//获取文件输入流  
        int len = 0;  
        byte[] buffer = new byte[1024];  
        OutputStream out = response.getOutputStream();  
        while ((len = in.read(buffer)) > 0) {  
            out.write(buffer,0,len);//将缓冲区的数据输出到客户端浏览器  
        }  
        in.close();  
    }
    /**
     * 查询成绩的数量
     * @return
     * @throws Exception
     */
    @RequestMapping("/getCount")
    @ResponseBody
    @SystemControllerLog(description =" 查询成绩的数量")
    public Map getCount(HttpSession session) throws Exception{
       //取session的用户
        UserMessage userMessage=(UserMessage) session.getAttribute("user");
        Sy07 sy07=new Sy07();
        sy07.setCsy040(userMessage.getSy04().getCsy040());
        int i=studentService.getCount(sy07);
        Map map= new HashMap();
        map.put("count",i);
        return map;
    }
    /**
     * 查询课程表的数量
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/querySyllabusCount")
    @ResponseBody
    @SystemControllerLog(description =" 查询课程表的数量")
    public Map querySyllabusCount(HttpSession session) throws Exception{
      //取session的用户
        UserMessage userMessage=(UserMessage) session.getAttribute("user");              
        int i=studentService.querySyllabusCount(userMessage);
        Map map= new HashMap();
        map.put("count",i);
        return map;
    }
}
