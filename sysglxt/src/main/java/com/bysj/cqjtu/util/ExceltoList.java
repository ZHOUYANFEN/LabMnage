package com.bysj.cqjtu.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

/**
 * excel文件转为list存储
 * @author fuzhengjun
 *2017年3月23日下午1:53:46
 *
 */
public class ExceltoList {
   
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

}
