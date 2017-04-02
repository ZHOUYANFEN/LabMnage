package com.bysj.cqjtu.student.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
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

import com.bysj.cqjtu.manager.domain.Sy04;
import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.student.domain.Sy07;
import com.bysj.cqjtu.student.domain.Sy08;
import com.bysj.cqjtu.student.domain.Sy09;
import com.bysj.cqjtu.student.service.StudentService;

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
    public List<Map> getSyllabus(HttpSession session) throws Exception{
        //取session的用户
        //UserMessage userMessage=(UserMessage) session.getAttribute("user");
        //获取班级
        
        UserMessage userMessage=new UserMessage();
        
        String csy043="计软二班";
        Sy04 sy04=new Sy04();
        sy04.setCsy043(csy043);
        userMessage.setSy04(sy04);
        
        
        List<Map> list=studentService.getSyllabus(userMessage);
        return list;
    }
    /**
     * 获取实验安排的科目
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryExpArrange")
    @ResponseBody
    public List<Map> queryExpArrange(HttpSession session) throws Exception{
        //取session的用户
        //UserMessage userMessage=(UserMessage) session.getAttribute("user");
        
       // UserMessage userMessage=new UserMessage();
        
        String csy040="123456";
        Sy04 sy04=new Sy04();
        sy04.setCsy040(csy040);

        
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
    public List<Sy08> queryExpArrangeList(HttpSession session,String csy060) throws Exception{
      //取session的用户
        //UserMessage userMessage=(UserMessage) session.getAttribute("user");
        
        //UserMessage userMessage=new UserMessage();
        
        String csy040="123456";
       /* Sy04 sy04=new Sy04();
        sy04.setCsy040(csy040);
        userMessage.setSy04(sy04);
        
        
        Sy06 sy06=new Sy06();
        sy06.setCsy060(csy060);
        userMessage.setSy04(sy04);*/
        Sy08 sy08=new Sy08();
        sy08.setCsy040(csy040);
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
    public List<Map> queryExpArrangeContent(HttpSession session,Integer csy080) throws Exception{
        //取session的用户
        //UserMessage userMessage=(UserMessage) session.getAttribute("user");
        
        //UserMessage userMessage=new UserMessage();
        
        String csy040="123456";
        Sy08 sy08=new Sy08();
        sy08.setCsy040(csy040);
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
    public Map saveExp(HttpSession session,@RequestBody Sy09 sy09) throws Exception{
        //取session的用户
        //UserMessage userMessage=(UserMessage) session.getAttribute("user");
        
        //UserMessage userMessage=new UserMessage();
        
        String csy040="123456";
        sy09.setCsy040(csy040);
        return studentService.saveExp(sy09);        
    }
    /**
     * 保存实验完成内容
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryGrade")
    @ResponseBody
    public List<Map> queryGrade() throws Exception{
      //取session的用户
        //UserMessage userMessage=(UserMessage) session.getAttribute("user");
        
        //UserMessage userMessage=new UserMessage();
        Sy07 sy07=new Sy07();
        String csy040="123456";
        sy07.setCsy040(csy040);
        return studentService.queryGrade(sy07);
    }
    /**
     * 查询具体实验安排
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryExpList")
    @ResponseBody
    public List<Map> queryExpList() throws Exception{
        //取session的用户
        //UserMessage userMessage=(UserMessage) session.getAttribute("user");
        
        //UserMessage userMessage=new UserMessage();
        String csy040="123456";
        Sy04 sy04=new Sy04();
        sy04.setCsy040(csy040);
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
     * 查询具体实验安排
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/uploadReport")
    @ResponseBody
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
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveReport")
    @ResponseBody
    public Map saveReport(String csy080) throws Exception{
        //取session的用户
        //UserMessage userMessage=(UserMessage) session.getAttribute("user");
        
        //UserMessage userMessage=new UserMessage();
        String csy040="123456";
        
        Sy09 sy09=new Sy09();
        sy09.setCsy080(csy080);
        sy09.setCsy093(filename);
        sy09.setCsy040(csy040);
        Map map=studentService.saveReport(sy09);       
        return map;
    }
    /**
     * 查询成绩详情
     * @param csy060
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryGradeDetai")
    @ResponseBody
    public List<Map> queryGradeDetai(String csy060) throws Exception{
      //取session的用户
        //UserMessage userMessage=(UserMessage) session.getAttribute("user");
        
        //UserMessage userMessage=new UserMessage();
        String csy040="123456";
        Sy07 sy07 =new Sy07();
        sy07.setCsy040(csy040);
        sy07.setCsy060(csy060);
        
        return studentService.queryGradeDetai(sy07);        
    }
    /**
     * 查看资源类型
     * @param csy060
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryResourceType")
    @ResponseBody
    public List<Map> queryResourceType() throws Exception{
        
        List<Map> list=studentService.queryResourceType();
        return list;
    }
}
