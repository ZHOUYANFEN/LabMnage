package com.bysj.cqjtu.teacher.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.student.domain.Sy13;
import com.bysj.cqjtu.teacher.service.DownLoadResourceService;



@Controller
@RequestMapping("/resourceDownload")
public class ResourceDownloadController {

	
	@Autowired
	private DownLoadResourceService downLoadResourceService;
	
	/**
	 * 展示所有资源
	 * @return
	 */
    @RequestMapping("/resourceShow")
    @ResponseBody
	public Map<String,List>  show(){
    	Map<String,List> map = new HashMap<>();
    	map = downLoadResourceService.queryResource();
        return map;
   
	}
    
    /**
     * 上传
     * @param multipartFile
     * @param session
     * @return
     */
    @RequestMapping(value="/resourceUp", produces="text/plain; charset=utf-8")
    @ResponseBody
    public String upload(@RequestParam("file") MultipartFile multipartFile,HttpSession session) {
        try {
        	//创建资源表对象
        	Sy13 record = new Sy13();
        	UserMessage userMassage = (UserMessage)session.getAttribute("user");
    		int userId =userMassage.getSy02().getCsy020();
    		String userName = userMassage.getSy02().getCsy021();
    		System.out.println("userid="+userId+"  userName="+userName);
            // ... 文件目录可做进一步处理,避免多个重名文件覆盖
            String dirPath = "D:/";
            // 1.获取上传的文件名称和内容
            String filename = multipartFile.getOriginalFilename();
            System.out.println("文件大小："+multipartFile.getSize());
            String size = "";
            if((multipartFile.getSize()/1024)>1000){
            	size = ((multipartFile.getSize()/1024)/1024)+"."+ ((multipartFile.getSize()/1024)%1024) + "M";
            }else{
            	size = (multipartFile.getSize()/1024)+"."+ (multipartFile.getSize()%1024) + "KB";
            }
            System.out.println(size);
            String address = dirPath+"/"+filename;
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String date = format.format(new Date());
            String file = filename.substring(0,filename.lastIndexOf("."));
            System.out.println("文件名:"+file);
            record.setCsy020(userId);
            record.setCsy131(file);
            record.setCsy133(filename);
            record.setCsy134(address);
            try {
				record.setCsy136(format.parse(date));
			} catch (ParseException e) {
				e.printStackTrace();
			}
            record.setCsy160(1);
            record.setCsy135((byte)0);
            record.setCsy137("1");
            record.setCsy138(size);
            byte[] data = multipartFile.getBytes();
            // 2.将文件写入到本地，根据文件名命名
            FileUtils.writeByteArrayToFile(new File(dirPath, filename), data);
            // Log,显示文件全路径
            System.out.println("成功上传文件: " + filename);
            downLoadResourceService.insert(record);
            return "文件上传成功";
        } catch (IOException e) {
        	System.out.println("上传文件失败,发生了错误: " + e.getMessage());
            return "文件上传失败";
        }
    }
    
    
	/**
	 * 搜索资源
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping("/searchResource")
	@ResponseBody
	public Map searchResource(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		Map<String,List> map = new HashMap<>();
	    //搜索的内容
		String items = request.getParameter("searchitems");
		System.out.println(items);
    	map = downLoadResourceService.searchResource(items);
		if(map.get("Sy13").size()!=0){
			return map;
		}else{
			List<String> errorList = new ArrayList<>();
			errorList.add("没有任何该资源");
			map.put("error", errorList);
			return map;
		}
		
	}
	
	/**
	 * 下载
	 * @param filepath
	 * @return
	 */
    @RequestMapping("/resourceDown")
    public ResponseEntity<byte[]> download(String filepath) {
        try {
        	String filepathName = filepath.substring((filepath.lastIndexOf("/")+1), filepath.length());
        	
        	System.out.println(filepathName);
        	byte[] file = filepath.getBytes("ISO-8859-1");
        	filepath = new String(file, "UTF-8");
        	System.out.println("文件名为："+filepath);
            if (null != filepath && !"".equals(filepath.trim())) {
                // ... 文件目录可做进一步处理,避免文件重名时获取不到正确的目标文件
                // 1.获取文件名,读取本地磁盘
                byte[] data = FileUtils.readFileToByteArray(new File(filepath));
                // 2.设置响应头,并返回响应数据
                HttpHeaders headers = new HttpHeaders();
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                headers.setContentDispositionFormData("attachment", filepathName);
                return new ResponseEntity<byte[]>(data, headers, HttpStatus.CREATED);
            }
        } catch (IOException e) {
            System.out.println("下载文件失败,发生了错误: " + e.getMessage());
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
    
}
