package com.ccoa.common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;

import org.apache.tools.ant.taskdefs.LoadFile;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;
import org.apache.tools.zip.ZipOutputStream;

public class ZipUtil_new {

	public static void zipFile(String sourcefilename, String zipfilename) {
		File sourceFile = new File(sourcefilename);
		if (sourceFile.exists()) {
			File zFile = new File(zipfilename);
			if (zFile.exists()) {
				zFile.delete();
			}
			String basePath = "";
			ZipOutputStream zos = null;
			try {
				zos = new ZipOutputStream(new File(zipfilename));
				zos.setEncoding("gbk");
				zip(sourceFile, basePath, zos);
				if (sourceFile.exists()) {
					sourceFile.delete();
				}
				System.out.println("压缩文件成功!");
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if (zos != null) {
					try {
						zos.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}

	}

	private static void compress(File sourceFile, String basePath,
			ZipOutputStream zos) {
		if (!sourceFile.exists()) {
			System.out.println("要压缩的文件不存在!");
			return;
		}
		if (sourceFile.isDirectory()) {
			compressDir(sourceFile, basePath, zos);
		} else {
			compressFile(sourceFile, basePath, zos);
		}
	}

	private static void compressDir(File dir, String basePath,
			ZipOutputStream zos) {
		try {
			zos.putNextEntry(new ZipEntry(basePath + dir.getName() + "/"));
			File[] files = dir.listFiles();
			for (int i = 0; i < files.length; i++) {
				/* 递归 */
				compress(files[i], basePath + dir.getName() + "/", zos);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private static void compressFile(File file, String basePath,
			ZipOutputStream zos) {
		InputStream is = null;
		try {
			is = new FileInputStream(file);
			BufferedInputStream bis = new BufferedInputStream(is);
			zos.putNextEntry(new ZipEntry(basePath + file.getName()));
			byte[] buf = new byte[1024];
			int length = -1;
			while ((length = bis.read(buf)) != -1) {
				zos.write(buf, 0, length);
				zos.flush();
			}
		} catch (Exception e) {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
		}
	}

	/**
	 * 解压一个文件
	 * 
	 * @param zipfilename
	 *            解压的文件
	 * @param destDir
	 *            解压的目录
	 */
/*	public static void unZip1(String zipfilename, String destDir) {
		File file = new File(zipfilename);
		OutputStream os = null;
		InputStream is = null;
		if (!file.isFile() || !file.getName().endsWith(".zip")) {
			System.out.println("该程序无法解压非zip文件");
		} else {
			destDir = destDir.endsWith("\\") ? destDir : destDir + "\\";
			byte b[] = new byte[1024];
			int length;
			ZipFile zipFile;
			try {
				zipFile = new ZipFile(file, "gbk");
				Enumeration enumeration = zipFile.getEntries();
				ZipEntry zipEntry = null;
				while (enumeration.hasMoreElements()) {
					zipEntry = (ZipEntry) enumeration.nextElement();
					File loadFile = new File(destDir + zipEntry.getName());
					// 判断压缩文件中的某个条目是文件夹还是文件
					if (zipEntry.isDirectory()) {// 如果是目录，那么判断该文件是否已存在并且不是一个文件夹,解决空文件夹解压后不存在的问题
						if (!loadFile.exists()) {
							loadFile.mkdirs();
						}
					} else {
						if (!loadFile.getParentFile().exists()) {
							loadFile.getParentFile().mkdirs();
						}
						os = new FileOutputStream(loadFile);
						is = zipFile.getInputStream(zipEntry);
						while ((length = is.read(b)) > 0) {
							os.write(b, 0, length);
							os.flush();
						}
					}

				}
				System.out.println("解压文件成功");
				is.close();
				os.close();				
				zipFile.close();					
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (is != null) {
						is.close();
					}
					if (os != null) {
						os.close();
					}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
	}*/

	/**
	 * 将一个文件写入到压缩流中，即完成压缩
	 * 
	 * @param sourceFile
	 *            要压缩的文件或文件夹
	 * @param basePath
	 *            相对路径
	 * @param zos
	 *            压缩流
	 * 
	 *            注意，压缩文件与压缩文件夹的方法 压缩文件 zos.putNextEntry(new
	 *            ZipEntry("a/b.txt")); 压缩文件夹 zos.putNextEntry(new
	 *            ZipEntry("a/b/"));
	 */
	public static void zip(File sourceFile, String basePath, ZipOutputStream zos) {
		InputStream is = null;
		try {

			// 首先判断压缩的是一个文件夹，还是文件
			if (sourceFile.isDirectory()) {// 如果是一个文件夹，那么先把该文件夹压缩进去，然后递归
				basePath = basePath + sourceFile.getName() + "/";
				zos.putNextEntry(new ZipEntry(basePath));
				File[] files = sourceFile.listFiles();
				for (int i = 0; i < files.length; i++) {
					File file = files[i];
					// 回调
					zip(file, basePath, zos);
				}
			} else {// 如果是一个文件就直接压缩进去，将内容写进去
				zos.putNextEntry(new ZipEntry(basePath + sourceFile.getName()));
				is = new FileInputStream(sourceFile);
				BufferedInputStream bis = new BufferedInputStream(is);
				byte[] buf = new byte[1024];
				int length = -1;
				while ((length = bis.read(buf)) != -1) {
					zos.write(buf, 0, length);
					zos.flush();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	
	/*
	  * 解压zip或者rar包的内容到指定的目录下，可以处理其文件夹下包含子文件夹的情况
	  *
	  * @param zipFilename
	  *            要解压的zip或者rar包文件
	  * @param outputDirectory
	  *            解压后存放的目录
	  */
	public static void unZip(String zipFilename, String outputDirectory)
			throws IOException {
		File outFile = new File(outputDirectory);
		if (!outFile.exists()) {
			outFile.mkdirs();
		}
		ZipFile zipFile = new ZipFile(zipFilename, "gbk");
		Enumeration en = zipFile.getEntries();
		ZipEntry zipEntry = null;
		while (en.hasMoreElements()) {
			zipEntry = (ZipEntry) en.nextElement();
			if (zipEntry.isDirectory()) {
				// mkdir directory
				String dirName = zipEntry.getName();
				// System.out.println("=dirName is:=" + dirName + "=end=");
				dirName = dirName.substring(0, dirName.length() - 1);
				File f = new File(outFile.getPath() + File.separator + dirName);
				f.mkdirs();
			} else {
				// unzip file
				String strFilePath = outFile.getPath() + File.separator
						+ zipEntry.getName();
				File f = new File(strFilePath);
				// the codes remedified by can_do on 2010-07-02 =begin=
				// /////begin/////
				// 判断文件不存在的话，就创建该文件所在文件夹的目录
				if (!f.exists()) {
					String[] arrFolderName = zipEntry.getName().split("/");
					String strRealFolder = "";
					for (int i = 0; i < (arrFolderName.length - 1); i++) {
						strRealFolder += arrFolderName[i] + File.separator;
					}
					strRealFolder = outFile.getPath() + File.separator
							+ strRealFolder;
					File tempDir = new File(strRealFolder);
					// 此处使用.mkdirs()方法，而不能用.mkdir()
					tempDir.mkdirs();
				}
				// ////end///
				// the codes remedified by can_do on 2010-07-02 =end=
				f.createNewFile();
				InputStream in = zipFile.getInputStream(zipEntry);
				FileOutputStream out = new FileOutputStream(f);
				try {
					int c;
					byte[] by = new byte[1024];
					while ((c = in.read(by)) != -1) {
						out.write(by, 0, c);
					}
					// out.flush();
				} catch (IOException e) {
					throw e;
				} finally {
					out.close();
					in.close();
					
				}
			}
		}
		zipFile.close();
	}

}