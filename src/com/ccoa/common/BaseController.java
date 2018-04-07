package com.ccoa.common;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.poi.poifs.filesystem.DirectoryEntry;
import org.apache.poi.poifs.filesystem.DocumentEntry;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import com.ccoa.utils.ToolString;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.ComFailException;
import com.jacob.com.ComThread;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;
import com.jfinal.core.Controller;
import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;



public class BaseController  extends Controller{
	
	private static Logger log = Logger.getLogger(BaseController.class);
	protected String WebRootPath = PathKit.getWebRootPath();//WebRoot目录，也是文件上传主目录
	/**
	 * 添加值到ParamMap
	 * @return
	 */
	protected void addToParamMap(String key, String value){
		Map<String, String> map = getAttr("paramMap");
		map.put(key, value);
	}
	
	/**
	 * 重写getPara，进行二次decode解码
	 */
	@Override
	public String getPara(String name) {
		String value = getRequest().getParameter(name);
		if(null != value && !value.isEmpty()){
			try {
				value = URLDecoder.decode(value.replaceAll("%", "%25"), ToolString.encoding);
			} catch (UnsupportedEncodingException e) {
				log.error("decode异常：" + value + e.getMessage());
				e.printStackTrace();
			}
		}
		return value;
	}
	
	/**
	 * 获取checkbox值，数组
	 * @param name
	 * @return
	 */
	protected String[] getParas(String name) {
		return getRequest().getParameterValues(name);
	}
	
	/**
	 * 获取查询参数
	 * 说明：主要是给查询导出的之类的功能使用
	 * @return
	 */
	protected Map<String, String> getQueryParam(){
		Map<String, String> queryParam = new HashMap<String, String>();
		Enumeration<String> paramNames = getParaNames();
		while (paramNames.hasMoreElements()) {
			String name = paramNames.nextElement();
			String value = getPara(name);
			if (name.startsWith("_query") && !value.isEmpty()) {// 查询参数分拣
				String key = name.substring(7);
				if(null != value && !value.trim().equals("")){
					queryParam.put(key, value.trim());
				}
			}
		}
		
		return queryParam;
	}
	
	/**
	 * 表单提交上传
     * 单个文件上传处理
     * 注意：前提是lib中引入cos-26Dec2008.jar包
     */
    public UploadFile upload() throws Exception{
//      UploadFile upFile = getFile();//单个上传文件一句搞定  默认路径是 upload
//        String filedir=PathKit.getWebRootPath()  + "\\upload";//指定用户文件上传路径
//    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//    	String ymd = sdf.format(new Date());
    	UploadFile upFile = getFile("template.file", generateFileDir(), Constants.FILE_MAXSize, "utf-8");//只用于表单提交方式， 单个上传文件
    	return upFile;
    }
    
    /**
     * 表单提交批量上传
     * 批量文件上传
     * 注意：前提是lib中引入cos-26Dec2008.jar包
     * 注意：暂未测试
     */
    public void uploads(){
        try {
            String filedir=PathKit.getWebRootPath()  + "\\upload\\";//指定用户文件上传路径
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        	String ymd = sdf.format(new Date());
            List<UploadFile> upFiles = getFiles(filedir, Constants.FILE_MAXSize, "utf-8");//批量上传文件
            for (UploadFile fileItem : upFiles) {
                 
                String fPath=filedir + "\\" + ymd + fileItem.getOriginalFileName();
                System.out.println("上传fPath"+fPath);
                String newPath=filedir + "\\" + ymd + fileItem.getOriginalFileName().replace(".", "1.");//例如：交叉接触动作1.3gp
                File oldFile=new File(fPath);
                File newFile=new File(newPath);
                if(newFile.exists()){
                    System.out.println("-------------删除"+fileItem.getOriginalFileName());
                    //删除旧的
                    oldFile.delete();
                    //新的重命名
                    boolean updateName=newFile.renameTo(oldFile);
                    System.out.println("-------------updateName:"+updateName);
                }
                 
            }
        } catch (Exception e) {
            e.printStackTrace();
            renderJson("status", "0");//失败
        }
    }
    
    public String generateFileDir (){
    	String filedir = WebRootPath  + "\\" + Constants.FILE_UPLOAD_DIR;//指定用户文件上传路径
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
    	String ymd = sdf.format(new Date());
    	return filedir + "\\" + ymd + "\\";
    }
    /**
     * 读取html文件到word
     * @param  html内容
     *        PDFfile  生成PDF路径
     * @return
     * @throws Exception
     */
    //html转换成pdf
/*    public void createPdf(String PDFfile,String html) throws IOException, DocumentException {
        // step 1
        Document document = new Document();
        // step 2
        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(PDFfile));
        // step 3
        document.open();
        InputStream stream = new ByteArrayInputStream(html.getBytes());
        // step 4
        XMLWorkerHelper.getInstance().parseXHtml(writer, document,
        		stream, Charset.forName("UTF-8"));
        // step 5
        document.close();
    }*/
    
    
     	   
   
    
    /**
     * 读取html文件到word
     * @param filepath html文件的路径
     *        fileWrodPath word 路径及文件名
     * @return
     * @throws Exception
     */
    
    //将读取到的html文件写入到word中 xdf 2015.05.25
    public boolean writeWordFile(String fileWrodPath,String contentAfter) throws Exception {
	  boolean flag = false;
	  ByteArrayInputStream bais = null;
	  FileOutputStream fos = null;
	  //PathKit.getWebRootPath()+"temp/project/doc/temp.doc";  //根据实际情况写路径
	  String path = fileWrodPath;
	  try {
         if (!"".equals(path)) {
         File fileDir = new File(path);
             if(fileDir.exists())  
             {              
               byte b[] = contentAfter.getBytes("utf-8");
               bais = new ByteArrayInputStream(b);
               POIFSFileSystem poifs = new POIFSFileSystem();
               DirectoryEntry directory = poifs.getRoot();
               DocumentEntry documentEntry = directory.createDocument("WordDocument", bais);
               fos = new FileOutputStream(path);
                                   poifs.writeFilesystem(fos);
                                   bais.close();
                                   fos.close();
                                   flag=true;
             }
          }
        } catch (IOException e) {
             e.printStackTrace();
        } finally {
             if(fos != null) fos.close();
             if(bais != null) bais.close();
        }
              return flag;

       }
    
/*    public void wordToPDF(String sfileName,String toFileName){              
        long start = System.currentTimeMillis();      
        ActiveXComponent app = null;  
        Dispatch doc = null;  
        try { 
        	ComThread.InitSTA();
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
           System.out.println("========Error:文档转换失败：" + e.getMessage());      
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
    } */ 
    public void wordToPDF(String srcFilePath, String pdfFilePath)  {  
        ActiveXComponent app = null;  
        Dispatch doc = null;  
        try {  
        	log.error(new Exception("wordToPDF:1"));
            ComThread.InitSTA();  
            log.error(new Exception("wordToPDF:2"));
            app = new ActiveXComponent("Word.Application");  
            log.error(new Exception("wordToPDF:3"));
            app.setProperty("Visible", false);  
            log.error(new Exception("wordToPDF:4"));
            Dispatch docs = app.getProperty("Documents").toDispatch(); 
            log.error(new Exception("wordToPDF:5"));
            doc = Dispatch.invoke(docs, "Open", Dispatch.Method,  
                    new Object[] { srcFilePath,   
                                                 new Variant(false),   
                                                 new Variant(true),//是否只读  
                                                 new Variant(false),   
                                                 new Variant("pwd") },  
                    new int[1]).toDispatch();  
            log.error(new Exception("wordToPDF:6"));
//          Dispatch.put(doc, "Compatibility", false);  //兼容性检查,为特定值false不正确  
            Dispatch.put(doc, "RemovePersonalInformation", false);  
            log.error(new Exception("wordToPDF:7"));
            Dispatch.call(doc, "ExportAsFixedFormat", pdfFilePath, 17); // word保存为pdf格式宏，值为17  
            log.error(new Exception("wordToPDF:8"));
  
           // return true; // set flag true;  
        } catch (ComFailException e) {
        	e.printStackTrace();
        	  log.error(new Exception("wordToPDF ComFailException:"+e.getMessage()));
           // return false;  
        } catch (Exception e) {  
        	e.printStackTrace();
        	log.error(new Exception("wordToPDF Exception:"+e.getMessage()));
        } finally {  
            if (doc != null) {  
                Dispatch.call(doc, "Close", false);  
            }  
            if (app != null) {  
                app.invoke("Quit", 0);  
            }             
            ComThread.Release();  
            System.gc();//系统进行资源强制回收
        }  
    }  
    
    
       // 读取html文件到字符串
       public String readFile(String filepath) throws Exception {
              StringBuffer buffer = new StringBuffer("");
              BufferedReader br = null;
              try {
                     InputStreamReader isr = new InputStreamReader(new FileInputStream(filepath), "UTF-8");
                     br = new BufferedReader(isr);
                     buffer = new StringBuffer();
                     while (br.ready())
                            buffer.append((char) br.read());
              } catch (Exception e) {
                     e.printStackTrace();
              } finally {
                     if(br!=null) br.close();
              }
              return buffer.toString();
       }
       
       public <T> List<T> getModels(Class<T> modelClass, String modelName) {
           List<String> nos = getModelsNoList(modelName);
           List<T> list =new ArrayList<T>();
           for (String no : nos) {
               T m = getModel(modelClass, modelName + "[" + no + "]");
               if (m != null) {
                   list.add(m);
               }
           }
           return list;
       }

       /**
        * 提取model对象数组的标�?
        *
        * @param modelName
        * @return
        */
       protected List<String> getModelsNoList(String modelName) {
           // 提取下标
           List<String> list = new ArrayList<String>();
           String modelNameAndLeft = modelName + "[";
           Map<String, String[]> parasMap = getRequest().getParameterMap();
           for (Map.Entry<String, String[]> e : parasMap.entrySet()) {
               String paraKey = e.getKey();
               if (paraKey.startsWith(modelNameAndLeft)) {
                   String no = paraKey.substring(paraKey.indexOf("[") + 1,
                           paraKey.indexOf("]"));
                   if (!list.contains(no)) {
                       list.add(no);
                   }
               }
           }
           Collections.sort(list);
           return list;
       }
       
       public void createFile(String nPpath, String nFile) {
   		// path表示你所创建文件的路径
   		String path = nPpath;
   		File f = new File(path);
   		if (!f.exists()) {
   			f.mkdirs();
   		}
   		// fileName表示你创建的文件名；为txt类型；
   		String fileName = nFile;
   		File file = new File(f, fileName);
   		if (!file.exists()) {
   			try {
   				file.createNewFile();
   			} catch (IOException e) {
   				// TODO Auto-generated catch block
   				e.printStackTrace();
   			}
   		}

   	}
   	
   	/** 
   	 * 删除单个文件 
   	 * @param   sPath    被删除文件的文件名 
   	 * @return 单个文件删除成功返回true，否则返回false 
   	 */  
	public boolean deleteFile(String sPath) {  
   		boolean flag = false;  
   		File file = new File(sPath);  
   	    // 路径为文件且不为空则进行删除  
   	    if (file.isFile() && file.exists()) {  
   	    	boolean result = file.delete();
   	        if(!result)
   	        {
   	        	System.out.println("========Error:删除文件失败,重新回收后再删除");
   	        	System.gc();//系统进行资源强制回收
   	        	file.delete();//删除
   	        	
   	        }
   	        flag = true;  
   	    }  
   	    return flag;  
   	}
}
