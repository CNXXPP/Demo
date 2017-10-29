package com.great.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.bytedeco.javacv.FrameGrabber.Exception;
import org.bytedeco.javacv.Java2DFrameConverter;
import org.bytedeco.javacv.OpenCVFrameGrabber;

public class GetExamPhoto {

	public static String takePho(OpenCVFrameGrabber grabber){
		Java2DFrameConverter java2dConverter = new Java2DFrameConverter();
        
		
        try {
        	BufferedImage bufferedImage = java2dConverter.convert(grabber.grab());
			ImageIO.write(bufferedImage, "jpg", new File("E:\\dir\\2.jpg"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
		
	}
	
}
