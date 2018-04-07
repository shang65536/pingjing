package com.ccoa.mail;
import com.ccoa.mail.Mail;
/**
 * @author  
 * 邮箱发送测试
 * @Email 371907629@qq.com
 * 
 */
public class Test {
    public static void main(String[] args) {
        
        Mail mail = new Mail();
        mail.setTo(" 306198090@qq.com ");
        mail.setFrom(" 371907629@qq.com ");// 你的邮箱
        mail.setHost(" mail.qq.com "); //smtp.qq.com
        mail.setUsername(" 371907629 ");// 用户
        mail.setPassword(" HSgb92107318.. ");// 密码
        mail.setSubject("[测试]找回您的账户密码");
        mail.setContent("测试发邮件");
        if (mail.sendMail()) {
            System.out.println(" 发送成功");
        }
        
    }
}
