package com.ccoa.common;

import java.io.FileOutputStream;
import java.io.IOException;
 


import com.ccoa.admin.set.Prize;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfGState;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.PdfWriter;
import com.jfinal.core.Controller;

public class PDFWaterPrint extends Controller {
	/*public static void main(String[] args) throws DocumentException,
			IOException {
		// 要输出的pdf文件
		BufferedOutputStream bos = new BufferedOutputStream(
				new FileOutputStream(new File("E:/abc.pdf")));
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		// 将pdf文件先加水印然后输出
		setWatermark(bos, "E:/pdf源文件.pdf", format.format(cal.getTime())
				+ "  下载使用人：" + "测试user", 16);
	}*/
	
	
	public  void addWatermark(PdfStamper pdfStamper) {
		PdfContentByte content = null;
		BaseFont base = null;
		Rectangle pageRect = null;
		PdfGState gs = new PdfGState();
		String waterMarkContentString="";
		Prize prize = Prize.me.findMaxPrize();
		if(prize!=null){
			 waterMarkContentString =  "";//Prize.me.findMaxPrize().getStr("Watermark");
		}

		try { // 设置字体
			//用itext-asian.jar中的字体，用的中文不支持
			//base = BaseFont.createFont("STSongStd-Light", "UniGB-UCS2-H",BaseFont.NOT_EMBEDDED);
			//获取系统的字体，支持中文
			base = BaseFont.createFont("C:/windows/fonts/simsun.ttc,1", BaseFont.IDENTITY_H,BaseFont.NOT_EMBEDDED);
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			if (base == null || pdfStamper == null) {
				return;
			}
			// 设置透明度为0.4
			gs.setFillOpacity(0.4f);
			gs.setStrokeOpacity(0.4f);
			int toPage = pdfStamper.getReader().getNumberOfPages();
			for (int i = 1; i <= toPage; i++) {
				pageRect = pdfStamper.getReader().getPageSizeWithRotation(i);
				// 计算水印X,Y坐标
				float x = pageRect.getWidth() / 2;
				float y = pageRect.getHeight() / 2;
				// 获得PDF最顶层
				content = pdfStamper.getOverContent(i);
				content.saveState();
				// set Transparency
				content.setGState(gs);
				content.beginText();
				content.setColorFill(BaseColor.GRAY);
				content.setFontAndSize(base, 50);
				// 水印文字成45度角倾斜
				content.showTextAligned(Element.ALIGN_CENTER, waterMarkContentString, x, y, 55);
				content.endText();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			content = null;
			base = null;
			pageRect = null;
		}
		try {
			pdfStamper.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

	/*public void setWatermark(BufferedOutputStream bos, String input,
			int permission) throws DocumentException,
			IOException {
		Rectangle pageRect = null;
		String waterMarkContentString = "公司内部文件，请注意保密";// Prize.me.findFirst().getStr("Watermark");
		PdfReader reader = new PdfReader(input);
		PdfStamper stamper = new PdfStamper(reader, bos);
		int total = reader.getNumberOfPages() + 1;
		PdfContentByte content;
		BaseFont base = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H",
				BaseFont.EMBEDDED);
		PdfGState gs = new PdfGState();
		for (int i = 1; i < total; i++) {
			pageRect = stamper.getReader(). getPageSizeWithRotation(i);
			// 计算水印X,Y坐标
			float x = pageRect.getWidth() / 2;
			float y = pageRect.getHeight() / 2;
			content = stamper.getOverContent(i);// 在内容上方加水印
			// content = stamper.getUnderContent(i);//在内容下方加水印
			//gs.setFillOpacity(0.2f);
			content.setGState(gs);
			content.beginText();
			content.setColorFill(Color.LIGHT_GRAY);
			content.setFontAndSize(base, 50);
			content.setTextMatrix(70, 200);
			content.showTextAligned(Element.ALIGN_CENTER, "www.360sdn.com", x,
					y, 55);
			content.endText();

		}
		stamper.close();
	}*/
}

