package com.ccoa.common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.ComThread;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;

/**
 * 工具类 公共类
 */
public class Tools {

	public static String GetTextForRegex(String target, String regex) {
		String temp = "";
		List result = null;
		String targetTemp = target;
		String[] _regxs = regex.split("==>");
		for (String reg : _regxs) {
			temp = "";
			Pattern pattern = Pattern.compile(reg);
			Matcher matcher = pattern.matcher(targetTemp);
			while (matcher.find()) {
				temp = temp + matcher.group();
			}
			targetTemp = temp;
		}
		return temp;
	}

	/**
	 * 复制单个文件
	 * 
	 * @param oldPath
	 *            String 原文件路径 如：c:/fqf.txt
	 * @param newPath
	 *            String 复制后路径 如：f:/fqf.txt
	 * @return boolean
	 */
	public static void copyFile(String oldPath, String newPath) {
		try {
			int bytesum = 0;
			int byteread = 0;
			File oldfile = new File(oldPath);
			if (oldfile.exists()) { // 文件存在时
				InputStream inStream = new FileInputStream(oldPath); // 读入原文件
				FileOutputStream fs = new FileOutputStream(newPath);
				byte[] buffer = new byte[50 * 1024 * 1024]; // 50M
				int length;
				while ((byteread = inStream.read(buffer)) != -1) {
					bytesum += byteread; // 字节数 文件大小
					System.out.println(bytesum);
					fs.write(buffer, 0, byteread);
				}
				inStream.close();
				fs.close();
			}
		} catch (Exception e) {
			System.out.println("复制单个文件操作出错");
			e.printStackTrace();

		}

	}

	/**
	 * 移动文件
	 * 
	 * @param srcFileName
	 *            源文件完整路径
	 * @param destDirName
	 *            目的目录完整路径
	 * @return 文件移动成功返回true，否则返回false
	 */
	public static boolean moveFile(String srcFileName, String destDirName) {
		File destDir = new File(destDirName);
		if (!destDir.exists()) {
			destDir.mkdirs();
		}
		File srcFile = new File(srcFileName);
		if (!srcFile.exists() || !srcFile.isFile())
			return false;
		return srcFile.renameTo(new File(destDirName + File.separator
				+ srcFile.getName()));
	}
	/**
	 * 删除文件
	 * 
	 * @param srcFileName
	 *            文件完整路径
	 * @return 文件删除成功返回true，否则返回false
	 */
	public static boolean delFile(String srcFileName) {
		File srcFile = new File(srcFileName);
		if (srcFile.exists()){
			srcFile.delete();	
		}
		return true;	
	}
	 /**
     * 递归删除目录下的所有文件及子目录下所有文件
     * @param dir 将要删除的文件目录
     * @return boolean Returns "true" if all deletions were successful.
     *                 If a deletion fails, the method stops attempting to
     *                 delete and returns "false".
     */
	public static boolean deleteDir(File dir) {
        if (dir.isDirectory()) {
            String[] children = dir.list();
            for (int i=0; i<children.length; i++) {
                boolean success = deleteDir(new File(dir, children[i]));
                if (!success) {
                    return false;
                }
            }
        }
        // 目录此时为空，可以删除
        return dir.delete();
    }
	 public static void wordToPDF(String sfileName,String toFileName){              
	        long start = System.currentTimeMillis();      
	        ActiveXComponent app = null;  
	        Dispatch doc = null;  
	        try {      
	            app = new ActiveXComponent("Word.Application");      
	            app.setProperty("Visible", new Variant(false));  
	            Dispatch docs = app.getProperty("Documents").toDispatch();    
	            doc = Dispatch.call(docs,  "Open" , sfileName).toDispatch();  
	           // System.out.println("打开文档..." + sfileName);  
	            //System.out.println("转换文档到PDF..." + toFileName);      
	            File tofile = new File(toFileName);      
	            if (tofile.exists()) {      
	                tofile.delete();      
	            }      
	            Dispatch.call(doc,      
	                          "SaveAs",      
	                          toFileName, // FileName      
	                          17);      
	            long end = System.currentTimeMillis();      
	           // System.out.println("转换完成..用时：" + (end - start) + "ms.");  
	             
	                
	        } catch (Exception e) {      
	           // System.out.println("========Error:文档转换失败：" + e.getMessage());      
	        } finally {  
	        	if(doc!=null){
	        		 Dispatch.call(doc,"Close",false); 
	        	}       	
	           // System.out.println("关闭文档");  
	            if (app != null)      
	                app.invoke("Quit", new Variant[] {});      
	            }  
	          //如果没有这句话,winword.exe进程将不会关闭  
	           ComThread.Release();     
	    }  
	 
	 
	 public static void wordToPDFNoRe(String sfileName,String toFileName){              
	        long start = System.currentTimeMillis();      
	        ActiveXComponent app = null;  
	        Dispatch doc = null;  
	        try {      
	            app = new ActiveXComponent("Word.Application");      
	            app.setProperty("Visible", new Variant(false));  
	            Dispatch docs = app.getProperty("Documents").toDispatch();    
	            doc = Dispatch.call(docs,  "Open" , sfileName).toDispatch();  
	           // System.out.println("打开文档..." + sfileName);  
	            //System.out.println("转换文档到PDF..." + toFileName);      
	            File tofile = new File(toFileName);      
	            if (tofile.exists()) {      
	                     
	            } else{     
	            	 Dispatch.call(doc,      
	                          "SaveAs",      
	                          toFileName, // FileName      
	                          17);      
	            long end = System.currentTimeMillis();     
	            }
	            
	           // System.out.println("转换完成..用时：" + (end - start) + "ms.");  
	             
	                
	        } catch (Exception e) {      
	           // System.out.println("========Error:文档转换失败：" + e.getMessage());      
	        } finally {  
	        	if(doc!=null){
	        		 Dispatch.call(doc,"Close",false); 
	        	}       	
	           // System.out.println("关闭文档");  
	            if (app != null)      
	                app.invoke("Quit", new Variant[] {});      
	            }  
	          //如果没有这句话,winword.exe进程将不会关闭  
	           ComThread.Release();     
	    }  
	 
	 
	 /** 
	     * 将PDF文档转换为swf格式的FLASH文件. 运行该函数需要用到SWFTools, 下载地址为 
	     * http://www.swftools.org/download.html 
	     *  
	     * <pre> 
	     * 示例: 
	     * String sourcePath = "F:\\PDF\\source.pdf"; 
	     * String destFile = "F:\\SWF\\dest.swf"; 
	     * try { 
	     *  Converter.pdf2SWF(sourcePath, destFile); 
	     * } catch (IOException e) { 
	     *  e.printStackTrace(); 
	     * } 
	     * </pre> 
	     *  
	     * @param sourceFile 
	     *            源文件(即PDF文档)路径, 包括源文件的文件名. 示例: D:\\PDF\\source.pdf 
	     * @param destFile 
	     *            目标文件路径, 即需要保存的文件路径(包括文件名). 示例: D:\\SWF\\dest.swf 
	     * @return 操作成功与否的提示信息. 如果返回 -1, 表示找不到源PDF文件, 或配置文件url.properties配置错误; 如果返回 
	     *         0, 则表示操作成功; 返回1或其他, 则表示转换失败 
	     */ 
	 //安装路径、文件路径都不能有空格
	    public static int pdf2SWF(String sourceFile, String destFile) {  
	  
	        // 目标路径不存在则建立目标路径  
	        File dest = new File(destFile);  
	        if (!dest.getParentFile().exists())  
	            dest.getParentFile().mkdirs();  
	  
	        // 源文件不存在则返回 -1  
	        File source = new File(sourceFile);  
	        if (!source.exists())  
	            return -1;  
	  
	        String SWFTools_HOME = "D:\\SWFTools";//SWFTools的安装路径。在我的项目中，我为了便于拓展接口，没有直接将SWFTools的安装路径写在这里，详见附件  
	        // 如果从文件中读取的URL地址最后一个字符不是 '\'，则添加'\'  
	        try {  
	            // 调用pdf2swf命令进行转换swfextract -i - sourceFilePath.pdf -o destFilePath.swf  
	           /* String command =  SWFTools_HOME + "\\pdf2swf.exe  " + sourceFile + " -o "  
	                    + destFile+ " -f -b -T 9 -s languagedir=F:\\xpdf-chinese-simplified"; */ 
	            String command =  SWFTools_HOME + "\\pdf2swf.exe  \"" + sourceFile + "\" -o \""  
	                    + destFile+ "\" -f -b -T 9 -s languagedir=D:\\xpdf-chinese-simplified";  
	            Process pro = Runtime.getRuntime().exec(command);  
	  
	            BufferedReader bufferedReader = new BufferedReader(  
	                    new InputStreamReader(pro.getInputStream()));  
	            /*while (bufferedReader.readLine() != null) {  
	  
	            }  */
	            pro.waitFor();  
	            return pro.exitValue();  
	        } catch (InterruptedException e) {  
	            e.printStackTrace();  
	        } catch (IOException e1) {  
	            e1.printStackTrace();  
	        }  
	  
	        return 1;  
	    }
	

}
