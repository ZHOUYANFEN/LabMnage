package com.bysj.cqjtu.util;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.util.CellRangeAddress;

/**
 * excel工具类
 * @author fuzhengjun
 *2017年3月23日下午1:53:46
 *
 */
public class ExcelUtil {
   
    /**
     * 获取excel表格数据
     * @param filename
     * @return
     * @throws Exception
     */
    public static List excel2List(String filename) throws Exception{
        File file=new File(filename);
        Workbook book = Workbook.getWorkbook(file); //读取excel文件        
        Sheet sheet = book.getSheet(0);     //这里是获取第一个工作表格
        int rows = sheet.getRows();//获取总的行数  
        int cols = sheet.getColumns();//获取总的列数  
        System.out.println("行："+rows+",列："+cols);                        
        List allList=new ArrayList();//定义一个存储全部信息的list
        Cell cell;//表格
        for(int i=0;i<rows;i++){//读取单元格内容并存放到二维数组中 默认从第一行第一列读取  
            List rowList=new ArrayList();//定义一个每行的list
            for(int j=0;j<cols;j++){  
                cell= sheet.getCell(j,i);  
                rowList.add(cell.getContents().replace(",", "").trim());
            }  
            allList.add(rowList);
        }
        return allList;
    }
    /**
     * 获取excel的列数和行数
     * @param filename
     * @return
     * @throws Exception
     */
    public static List<Integer> getExcelRowsAndCols(String filename) throws Exception{
        File file=new File(filename);
        Workbook book = Workbook.getWorkbook(file); //读取excel文件        
        Sheet sheet = book.getSheet(0);     //这里是获取第一个工作表格
        int rows = sheet.getRows();//获取总的行数  
        int cols = sheet.getColumns();//获取总的列数 
        List<Integer> list=new ArrayList();
        list.add(rows);
        list.add(cols);
        return list;
    }
    
    /**
     * 导出Excel文档
     * @param response 响应对象
     * @param sheetName 工作表名
     * @param title 标题
     * @param headers 表头数组
     * @param fieldNames 集合中对象的属性数组   该数组与表头一一对应
     * @param list 数据集合
     * @throws IOException
     * @throws NoSuchFieldException
     * @throws SecurityException
     * @throws IllegalArgumentException
     * @throws IllegalAccessException
     */
    public static void exportExcel(HttpServletResponse response, 
            String sheetName, String title, String[] headers, 
            String[] fieldNames, List<Object> list) 
                    throws IOException, NoSuchFieldException, 
                    SecurityException, IllegalArgumentException, 
                    IllegalAccessException {
        //创建工作簿
        HSSFWorkbook book = new HSSFWorkbook();
        //创建工作表
        HSSFSheet sheet = book.createSheet(sheetName);
        /* 标题 */
        //创建行
        HSSFRow row = sheet.createRow(0);
        //设置行高
        row.setHeight((short)(40*20)); //1磅=20缇   Excel中单位：磅，poi中单位：缇
        //设值列宽
        for(int i=0; i<headers.length; i++) {
            sheet.setColumnWidth(i, 30*256); //10个字符
        }
        //合并单元格
        sheet.addMergedRegion(new CellRangeAddress(
                0, 0, 0, headers.length-1));
        //创建单元格，行与列形成单元格
        HSSFCell cell = row.createCell(0);
        //创建单元格样式
        HSSFCellStyle style = book.createCellStyle();
        //设置水平居中、垂直居中
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        //设置字体
        HSSFFont font = book.createFont();
        font.setFontName("楷体");
        font.setFontHeightInPoints((short)16);
        font.setBold(true);
        font.setColor(HSSFColor.GREEN.index);
        style.setFont(font);
        //设置背景颜色
        //style.setFillBackgroundColor(HSSFColor.GREY_25_PERCENT.index);
        style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
        style.setFillPattern(HSSFCellStyle.THIN_BACKWARD_DIAG);
        //设置边框
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        //单元格应用样式
        cell.setCellStyle(style);
        for(int i=1; i<headers.length; i++) {
            row.createCell(i).setCellStyle(style);
        }
        //单元格设置内容
        cell.setCellValue(title);
        /* 表头 */
        //创建行
        row = sheet.createRow(1);
        //设置行高
        row.setHeightInPoints(25);
        //设置样式
        style = book.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        font = book.createFont();
        font.setFontName("楷体");
        font.setFontHeightInPoints((short)10);
        font.setBold(true);
        style.setFont(font);
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        //创建表头单元格
        for(int i=0; i<headers.length; i++) {
            cell = row.createCell(i);
            cell.setCellStyle(style);
            cell.setCellValue(headers[i]);
        }
        /* 表格的正文 */
        style = book.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        font = book.createFont();
        font.setFontName("楷体");
        font.setFontHeightInPoints((short)10);
        style.setFont(font);
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        //变量数据集合
        for(int i=0; i<list.size(); i++) {
            row = sheet.createRow(i+2);
            row.setHeightInPoints(20);
            Object obj = list.get(i);
            //使用反射机制，动态设置正文内容
            for(int j=0; j<fieldNames.length; j++) {
                cell = row.createCell(j);
                cell.setCellStyle(style);
                //单元格内容
                String fieldName = fieldNames[j];
                //判断是否是序号；序号，使用时该公共类时，必须指定序号字段为order
                if("orders".equals(fieldName)) { 
                    cell.setCellValue(i+1);
                } else {
                    //获得类的属性对象
                    Field field = obj.getClass().getDeclaredField(fieldName);
                    //取消访问权限检查, 原因：属性为私有
                    field.setAccessible(true);
                    //获得属性值
                    String value = field.get(obj).toString();
                    cell.setCellValue(value);
                }
            }
        }
        //输出Excel文档数据
        book.write(response.getOutputStream());
        //关闭流
        book.close();
    }

}
