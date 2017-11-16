package com.great.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.Buffer;
import java.util.Random;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.swing.JFrame;

import org.bytedeco.javacpp.opencv_objdetect.CvHaarClassifierCascade;
import org.bytedeco.javacv.CanvasFrame;
import org.bytedeco.javacv.Frame;
import org.bytedeco.javacv.Java2DFrameConverter;
import org.bytedeco.javacv.OpenCVFrameConverter;
import org.bytedeco.javacv.FrameGrabber.Exception;
import org.bytedeco.javacv.OpenCVFrameConverter.ToIplImage;
import org.bytedeco.javacv.OpenCVFrameGrabber;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

public class CameraJavaCV implements Runnable{
	public static OpenCVFrameGrabber grabber = new OpenCVFrameGrabber(0);
	public static CameraJavaCV cameraJavaCV = new CameraJavaCV();
	public static String savePath;
	BufferedImage bufferedImage;
	public static CanvasFrame canvas;
	public static boolean flag = true;
	@Override
	public void run() {
		
        try {
			grabber.start();
		   //��ʼ��ȡ����ͷ���  
        canvas = new CanvasFrame("����ͷ");//�½�һ������  
        canvas.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);  
        canvas.setAlwaysOnTop(true);  
        Java2DFrameConverter java2dConverter = new Java2DFrameConverter();
        System.out.println(savePath+"\\"+UUID.randomUUID().toString()+".jpg");
//        bufferedImage = java2dConverter.convert(grabber.grab());
//        ImageIO.write(bufferedImage, "jpg", new File(savePath+"\\"+UUID.randomUUID().toString()+".jpg"));
       
        File file = new File(savePath);
        if(!file.exists()){
        	file.mkdir();
        }
        int photoCnt = 0;
        while(flag)  
        {  
        	
           if(!canvas.isDisplayable())  
            {//�����Ƿ�ر�  
        	  
                grabber.stop();//ֹͣץȡ  
//                System.exit(2);//�˳�  
            }else{
            	
            }
          
            canvas.showImage(grabber.grab());//��ȡ����ͷͼ�񲢷ŵ���������ʾ�� �����Frame frame=grabber.grab(); frame��һ֡��Ƶͼ��  
            
            Thread.sleep(50);//1����ˢ��һ��ͼ��  
            Random random = new Random();
            int r = random.nextInt(60);
            if(photoCnt < 3 && r == 5){
            	
            	String pPath = savePath+"\\"+UUID.randomUUID().toString()+".jpg";
            	bufferedImage = java2dConverter.convert(grabber.grab());
                ImageIO.write(bufferedImage, "jpg", new File(pPath));
                
                photoCnt++;
                
            }
            
            
        } 
        } catch (org.bytedeco.javacv.FrameGrabber.Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public String takePho(){
		Java2DFrameConverter java2dConverter = new Java2DFrameConverter();
        
		
        try {
        	
			ImageIO.write(bufferedImage, "jpg", new File("E:\\dir\\2.jpg"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return null;
		
	}
	
}
