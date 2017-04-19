package com.bysj.cqjtu.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 日期格式化工具类
 * @author fuzhengjun
 *2017年4月18日下午1:58:15
 *
 */
public class DateFormatUtil {
	static final String COMMON_TIME_PATTERN = "HH:mm";
	static final String COMMON_DATE_PATTERN = "yyyy-MM-dd";
	static final String COMMON_DATETIME_PATTERN = "yyyy-MM-dd HH:mm";
	
	private static ThreadLocal<SimpleDateFormat> simpleDateFormatThreadLocal = new ThreadLocal<>();
	public static SimpleDateFormat getSimpleDateFormat(String datePattern) {
	    SimpleDateFormat sdf;
	    sdf = simpleDateFormatThreadLocal.get();
	    if (sdf == null) {
	        sdf = new SimpleDateFormat(datePattern);
	        simpleDateFormatThreadLocal.set(sdf);
	    }
	    return sdf;
	}
	
	
	
	
	
	
	
	public static String formatDate(Date paramDate) {
		return format(paramDate, "yyyy-MM-dd");
	}
	
	public static String formatDateSimple(Date paramDate) {
		return format(paramDate, "yyyyMMdd");
	}

	public static String formatDateTime(Date paramDate) {
		return format(paramDate, "yyyy-MM-dd HH:mm");
	}

	public static String format(Date paramDate, String paramString) {
		SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat(
				paramString);
		return localSimpleDateFormat.format(paramDate);
	}

	public static final Date parse(String paramString1, String paramString2)
			throws ParseException {
		SimpleDateFormat localSimpleDateFormat = null;
		Date localDate = null;
		localSimpleDateFormat = new SimpleDateFormat(paramString2);
		try {
			localDate = localSimpleDateFormat.parse(paramString1);
		} catch (ParseException localParseException) {
			throw new ParseException(localParseException.getMessage(),
					localParseException.getErrorOffset());
		}
		return localDate;
	}

	public static Date parseDate(String paramString) throws ParseException {
		return parse(paramString, "yyyy-MM-dd");
	}

	public static Date parseDateTime(String paramString) throws ParseException {
		return parse(paramString, "yyyy-MM-dd HH:mm");
	}

	public static String getNewTime(int type) {
		String t = null;
		SimpleDateFormat format = null;
		Calendar cal = Calendar.getInstance();
		switch (type) {
		case 0:
			format = new SimpleDateFormat("yyyyMMddHHmmss");
			break;
		case 1:
			format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			break;
		case 2:
			format = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
			break;
		case 3:
			format = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
			break;
		case 4:
			format = new SimpleDateFormat("yyyy-MM-dd");
			break;
		case 5:
			format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			break;
		case 6:
			format = new SimpleDateFormat("yyyyMMdd");
			break;
		case 7:
			format = new SimpleDateFormat("yyyy-MM");
			break;
		case 8:
			format = new SimpleDateFormat("HH:mm:ss");
			break;
		case 9:
			format = new SimpleDateFormat("yyyy");
			break;
		case 10:
			format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			break;
		case 11:
			format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			break;			
		default:
			format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			break;
		}
		t = format.format(cal.getTime());
		return t;
	}
	
	/* 
	 * 毫秒转化时分秒毫秒 
	 */  
	public static String formatTime(Long ms) {  
	    Integer ss = 1000;  
	    Integer mi = ss * 60;  
	    Integer hh = mi * 60;  
	    Integer dd = hh * 24;  
	  
	    Long day = ms / dd;  
	    Long hour = (ms - day * dd) / hh;  
	    Long minute = (ms - day * dd - hour * hh) / mi;  
	    Long second = (ms - day * dd - hour * hh - minute * mi) / ss;  
	    Long milliSecond = ms - day * dd - hour * hh - minute * mi - second * ss;  
	      
	    StringBuffer sb = new StringBuffer();  
	    if(day > 0) {  
	        sb.append(day+"天");  
	    }  
	    if(hour > 0) {  
	        sb.append(hour+"小时");  
	    }  
	    if(minute > 0) {  
	        sb.append(minute+"分");  
	    }  
	    if(second > 0) {  
	        sb.append(second+"秒");  
	    }  
	    if(milliSecond > 0) {  
	        sb.append(milliSecond+"毫秒");  
	    }  
	    return sb.toString();  
	}  
	
	/**
	 * 传入 格式:"00:00:10.68"
	 * @return 毫秒 
	 * */
    public static int getTimelen(String timelen){  
        int min=0;  
        String strs[] = timelen.split(":");  
        if (strs[0].compareTo("0") > 0) {  
            min+=Integer.valueOf(strs[0])*60*60;//秒  
        }  
        if(strs[1].compareTo("0")>0){  
            min+=Integer.valueOf(strs[1])*60;  
        }  
        if(strs[2].compareTo("0")>0){  
            min+=Math.round(Float.valueOf(strs[2]));  
        }  
        return min*1000;  
    }  
    
    public static void getSecond2(String time){
    	Date date=new Date();
    	int max = 0;
    	SimpleDateFormat format = new SimpleDateFormat("HH时mm分ss秒");
    	//String str = String.format(time,date);
    	try {
    		format.setLenient(false);
    		Date date1 = format.parse(time);
    		System.out.println(date1);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    }
    /*将时间转为秒 如  12小时30分钟30秒    11时15分6秒     12时15分 */
    public static long getSecond(String time){
    	long s = 0;
    	if(time.contains("小时")){
    		 s=Integer.parseInt(time.substring(0,time.indexOf("小时")))*3600;    //小时
    		 s+=Integer.parseInt(time.substring(time.indexOf("小时")+2,time.indexOf("分")))*60;    //分钟
    	}else{
    		if(time.contains("时")){
    			 s=Integer.parseInt(time.substring(0,time.indexOf("时")))*3600;    //小时
        		 s+=Integer.parseInt(time.substring(time.indexOf("时")+1,time.indexOf("分")))*60;    //分钟
    		}else{
    			if(time.contains("分钟")){
    				s+=Integer.parseInt(time.substring(0,time.indexOf("分")))*60;    //分钟
    				s+=Integer.parseInt(time.substring(time.indexOf("分钟")+2,time.indexOf("秒")));    //秒
    			}else{
    				if(time.contains("分")){
    					s+=Integer.parseInt(time.substring(0,time.indexOf("分")))*60;    //分钟
        				s+=Integer.parseInt(time.substring(time.indexOf("分")+1,time.indexOf("秒")));    //秒
    				}else{
    					if(time.contains("秒")){
    						s+=Integer.parseInt(time.substring(0,time.indexOf("秒")));    //秒
    					}
    				}
    			}
    		}
    	}
    	return s;
    }
    
  
}