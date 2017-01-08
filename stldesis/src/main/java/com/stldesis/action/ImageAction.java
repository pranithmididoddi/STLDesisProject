package com.stldesis.action;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

public class ImageAction extends MasterAction implements ServletRequestAware {
	
	private static final long serialVersionUID = 1906349844844535968L;

	private final String DEFAULT_IMAGE = IMAGE_DIRECTORY + File.separator + "default.jpg";
	
	byte[] imageInByte = null;
	String imageurl;
	String contentType;

	@SuppressWarnings("unused")
	private HttpServletRequest servletRequest;

	public ImageAction() {
	}

	public String execute() {
		return SUCCESS;
	}

	public byte[] getCustomImageInBytes() {

		BufferedImage originalImage;
		try {
			File f = getImageFile(IMAGE_DIRECTORY + File.separator + this.imageurl);
			if(f.exists() && !f.isDirectory()) {
				originalImage = ImageIO.read(f);
				contentType = FilenameUtils.getExtension(imageurl);
			}else{
				originalImage = ImageIO.read(getImageFile(DEFAULT_IMAGE));
				contentType = FilenameUtils.getExtension(DEFAULT_IMAGE);
			}
			// convert BufferedImage to byte array
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(originalImage, contentType, baos);
			baos.flush();
			imageInByte = baos.toByteArray();
			baos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return imageInByte;
	}

	private File getImageFile(String imageurl) {
		File file = new File(imageurl);
		return file;
	}

	public String getCustomContentType() {
		return contentType;
	}

	public String getCustomContentDisposition() {
		return "anyname."+contentType;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.servletRequest = request;
	}

	public String getImageurl() {
		return imageurl;
	}

	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	
}
