package com.great.config;



import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016080800192105";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC6LzfuTy8yfpFccgpqyvQ6QUf/gF5xtMAAk3j83C9ZGJaJiousCjizJdgteV5rI4kIjspIjBynvz70KGuW3ZR4xfYfX/DKaXZI/Y/unUtkvrI7LULeORyOd4jnvr418Qn0tjGSEtpBxYYr7CNNq0oQvHBj8sPYavERGfkWF4evbC67ciFd6qjqR4ZcGObyrNOFOow32Ntot3Ek1bxfNqaJtva1c2BK/3L6XHKbCbAeu97TZfTkiFHURxcHedvLIlMRYjdw0B7iHFF09n5So0MCkMchGbR1dfgLz0m+lNdfAVe1U3hoduQrq5fNxuDzXI5rjKulHFvYEToeS1BdhwjzAgMBAAECggEBALZnODaC4Uxo72RQXaBOgYLpHe5VBzIC0PA/ipK/7KsvCZxqXXgI84+fjfDPLQ9t2vzFV6xHiHNXTAfL6cv9/U1tNDl8tty3Aal0sSQmegyTPu3248Hu1elFdp0EJDmYkhZqwJnJWoaBS3eQeu3G2GMZGkrxNam6673DYmKgXtAeTjutRxz34O4zR14w7XjRRNTtTZWJLF3UzIQ6fSgoQge/cD8hooSKvbXW/K3eWCB+WHuxoh0Fi6ie3llILLh+SFdpSd2WoHXCmkYcmcF/3t0Xib7RgTVRaIFWBMDvVFSGxbZsUi/u/ojrFLJTarslOBItJzEWoporERHYxisTdwECgYEA/J1vYibU32xr+8tKEovPFAwahuEuBOj0OZ7TPpaL/r4X98hWPqjesEB9EptGm98Ja0IUURhZ7/fFS7RlM5dKSorqyie4R1ikq0pdcTE8ViWaPG/wTW2RZOAbSgxEbp4YRuP0jdpO7GmJwFR8u20J/QEswXQJhEEBgPicijiTxkECgYEAvK3myzMaGgIWTkw6PMFErI6nvfDlWJB88hhHZmaJbPf+DMR0AVITnCbjCobZ4r2mV65mnPP3a6MhLGEpSWCHLZ+B5GDxQQMORq/WZfrnSWCkQFR4mG+/hNR0MBbGP7PHv3udWlKRNAVNMRNkpigKzVpfjvjrRlWcAr8kMixYCjMCgYBNXFFN96JdQbDYDWuDvnkOJJ7DC5ayPjz8oF0E38nDm6dvZFS1H7YCt90Vo6O9/FHAHR5nr1Nrn681/eq4H+7KYTyB6CQRBV54bm+rSG632xAezhEDRTivccoppRQX5CZ/HzQ3dNGSqMdctQL1yvCyIHf6TnTToay6OGiIE8d9gQKBgBOexdQ1kS5JL0afGKM+ucRz5S+UQFUwWT3Xln0ohnvlYe6z8xg8D7v6MzviAABbFlQh15vUptLzmLyDsgZmWkg9QQWdqxjGl5J0MIhUSf7QZOQnpI69eB349cgWZjEzob7gvOEqmtzc/ETxLlM08MKf9jXo3pZmyp1igQISqGkPAoGATsYsOaUgRD3aJa624zSZKuu6yu2r5483KuVhG7iCk+XzTCL+JeYdab9LA2qCJlCzyzw42pyGVi5WqT8f/KZxauYVKbHSR0OoxO4Oyl5onjRLnW+tNdWbqfvj49JLvjWBdva2lIl6GjKPqZANcAfDLf3YE34fSC1tV2uyf9t3CNk=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAui837k8vMn6RXHIKasr0OkFH/4BecbTAAJN4/NwvWRiWiYqLrAo4syXYLXleayOJCI7KSIwcp78+9Chrlt2UeMX2H1/wyml2SP2P7p1LZL6yOy1C3jkcjneI576+NfEJ9LYxkhLaQcWGK+wjTatKELxwY/LD2GrxERn5FheHr2wuu3IhXeqo6keGXBjm8qzThTqMN9jbaLdxJNW8Xzamibb2tXNgSv9y+lxymwmwHrve02X05IhR1EcXB3nbyyJTEWI3cNAe4hxRdPZ+UqNDApDHIRm0dXX4C89JvpTXXwFXtVN4aHbkK6uXzcbg81yOa4yrpRxb2BE6HktQXYcI8wIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/driver_trainer_sys/jsp/studentSystem/studentRegister.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/driver_trainer_sys/jsp/studentSystem/studentId.jsp";
     
	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "D:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

