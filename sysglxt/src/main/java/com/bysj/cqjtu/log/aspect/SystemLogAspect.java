package com.bysj.cqjtu.log.aspect;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.bysj.cqjtu.log.annotation.SystemControllerLog;
import com.bysj.cqjtu.log.annotation.SystemServiceLog;
import com.bysj.cqjtu.log.dao.Sy17Mapper;
import com.bysj.cqjtu.log.dao.Sy18Mapper;
import com.bysj.cqjtu.log.domain.Sy17;
import com.bysj.cqjtu.log.domain.Sy18;
import com.bysj.cqjtu.manager.pojo.UserMessage;
import com.bysj.cqjtu.util.DateFormatUtil;
import com.bysj.cqjtu.util.GetSystemUtil;
    
/**
 * 切点类    
 * @author fuzhengjun
 *2017年4月9日下午3:27:52
 *
 */
@Aspect   
@Component    
public  class SystemLogAspect {    
    
    @Autowired
    private Sy17Mapper sy17Mapper;
    @Autowired
    private Sy18Mapper sy18Mapper;
    //本地异常日志记录对象    
    private static final Logger logger = LogManager.getLogger(SystemLogAspect. class);   
    //Service层切点    
    @Pointcut("@annotation(com.bysj.cqjtu.log.annotation.SystemServiceLog)")    
    public  void serviceAspect() {    
    }    
    
    //Controller层切点    
    @Pointcut("@annotation(com.bysj.cqjtu.log.annotation.SystemControllerLog)")    
    public  void controllerAspect() {    
    }    
    
    /**  
     * 前置通知 用于拦截Controller层记录用户的操作  
     *  
     * @param joinPoint 切点  
     */
    @After("controllerAspect()") 
    public  void doBefore(JoinPoint joinPoint) throws Exception {    
        Map map=getControllerMethodDescription(joinPoint);
        String description = (String) map.get("description");
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest(); 
        HttpSession session = request.getSession();
        UserMessage userMessage=(UserMessage) session.getAttribute("user");
        Sy17 sy17 = new Sy17();
        if(userMessage!=null){
            sy17.setCsy171(userMessage.getSy02().getCsy021());
        }
        sy17.setCsy172(description);
        sy17.setCsy173(GetSystemUtil.getIpAddr(request));
        sy17.setCsy174(DateFormatUtil.getNewTime(1));
        sy17.setCsy175(GetSystemUtil.getRequestBrowserInfo(request));
        sy17.setCsy176(request.getHeader("user-agent"));
        sy17.setCsy177(GetSystemUtil.getHostName(GetSystemUtil.getIpAddr(request)));
        sy17.setCsy178(GetSystemUtil.getMacAddress(GetSystemUtil.getIpAddr(request)));
        sy17Mapper.addSy17(sy17);
        logger.info(sy17.toString());
    }    
    
    /**  
     * 异常通知 用于拦截service层记录异常日志  
     *  
     * @param joinPoint  
     * @param e  
     */    
    @AfterThrowing(pointcut = "serviceAspect()", throwing = "e")    
    public  void doAfterThrowing(JoinPoint joinPoint, Throwable e) throws Exception{
        Map map=getServiceMthodDescription(joinPoint);
        String description = (String) map.get("description");
        String methodName = (String) map.get("methodName");
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest(); 
        HttpSession session = request.getSession();
        UserMessage userMessage=(UserMessage) session.getAttribute("user");      
        Sy18 sy18 = new Sy18();
        sy18.setCsy181(e.getMessage());
        sy18.setCsy185(methodName);
        StringWriter sw = new StringWriter(); 
        PrintWriter pw = new PrintWriter(sw); 
        e.printStackTrace(pw); 
        sy18.setCsy182(sw.toString());
        sy18.setCsy183(new Date());
        sy18.setCsy184(userMessage.getSy02().getCsy021());
        sy18Mapper.insert(sy18);
        logger.info(sy18.toString()+"\n异常信息："+e);
    }    
    
    
    /**  
     * 获取注解中对方法的描述信息 用于service层注解  
     *  
     * @param joinPoint 切点  
     * @return 方法描述  
     * @throws Exception  
     */    
     public  static Map getServiceMthodDescription(JoinPoint joinPoint)    
             throws Exception {    
        String targetName = joinPoint.getTarget().getClass().getName();    
        String methodName = joinPoint.getSignature().getName();    
        Object[] arguments = joinPoint.getArgs();    
        Class targetClass = Class.forName(targetName);    
        Method[] methods = targetClass.getMethods();    
        String description = "";    
         for (Method method : methods) {    
             if (method.getName().equals(methodName)) {    
                Class[] clazzs = method.getParameterTypes();    
                 if (clazzs.length == arguments.length) {    
                    description = method.getAnnotation(SystemServiceLog. class).description();    
                     break;    
                }    
            }    
        }   
         Map map= new HashMap();
         map.put("methodName", methodName);
         map.put("description", description);
         return map;   
    }    
    
    /**  
     * 获取注解中对方法的描述信息 用于Controller层注解  
     *  
     * @param joinPoint 切点  
     * @return 方法描述  
     * @throws Exception  
     */    
     public  static Map getControllerMethodDescription(JoinPoint joinPoint)  throws Exception {    
        String targetName = joinPoint.getTarget().getClass().getName();    
        String methodName = joinPoint.getSignature().getName();    
        Object[] arguments = joinPoint.getArgs();    
        Class targetClass = Class.forName(targetName);    
        Method[] methods = targetClass.getMethods();    
        String description = "";    
         for (Method method : methods) {    
             if (method.getName().equals(methodName)) {    
                Class[] clazzs = method.getParameterTypes();    
                 if (clazzs.length == arguments.length) {    
                    description = method.getAnnotation(SystemControllerLog. class).description();    
                     break;    
                }    
            }    
        } 
         Map map= new HashMap();
         map.put("methodName", methodName);
         map.put("description", description);
         return map;    
    }    
}    