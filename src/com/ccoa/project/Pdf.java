package com.ccoa.project;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.Charset;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;  
  
public class Pdf {
  
     
	// 要写入wrod的html文件路径 及被写入的wrod路径
	//String filepath = PathKit.getWebRootPath()
	//					+ "E:/Workspaces/ccoa/WebRoot/project/projectList.html"; 
    public static final String HTML = "E:/Workspaces/ccoa/WebRoot/project/demo.html";
    public static final String DEST = "E:/pdf/project.pdf";
  
    /**
     * Creates a PDF with the words "Hello World"
     * @param file
     * @throws IOException
     * @throws DocumentException
     */
    public void createPdf(String file) throws IOException, DocumentException {
        // step 1
        Document document = new Document();
        // step 2
        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(file));
        // step 3
        document.open();
        // step 4
        XMLWorkerHelper.getInstance().parseXHtml(writer, document,
                new FileInputStream(HTML), Charset.forName("UTF-8"));
        // step 5
        document.close();
    }
  
    /**
     * Main method
     */
    public static void main(String[] args) throws IOException, DocumentException {
        File file = new File(DEST);
        file.getParentFile().mkdirs();
        new Pdf().createPdf(DEST);
        System.out.println("导出PDF成功");
    }
}
