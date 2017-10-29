package com.great.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.Buffer;
import java.util.Random;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.swing.JFrame;

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
		   //开始获取摄像头数据  
        canvas = new CanvasFrame("摄像头");//新建一个窗口  
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
            {//窗口是否关闭  
        	  
                grabber.stop();//停止抓取  
//                System.exit(2);//退出  
            }else{
            	
            }
          
            canvas.showImage(grabber.grab());//获取摄像头图像并放到窗口上显示， 这里的Frame frame=grabber.grab(); frame是一帧视频图像  
            
            Thread.sleep(50);//1毫秒刷新一次图像  
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
