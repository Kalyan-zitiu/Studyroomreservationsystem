package com.yueheng.studentHall.controller;

import com.yueheng.studentHall.pojo.ResponseResult;
import com.yueheng.studentHall.service.impl.MailService;
import com.yueheng.studentHall.utils.ToEmail;
import com.yueheng.studentHall.utils.VerCodeGenerateUtil;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @version IntelliJ IDEA || java version 11.
 * @Author: Oliver
 * @Description: 邮箱验证码
 * @Date: 2023-07-02
 * @Time: 15:06
 */
@RestController
@RequestMapping("/email")
public class EmailController {

    @Resource
    private MailService mailService;

    @RequestMapping("/sendEmail")
    public ResponseResult sendEmail(ToEmail toEmail) {
        if(toEmail == null || toEmail.getTos() == null ) {
            return new ResponseResult(-1, "参数错误!");
        }
        toEmail.setSubject("你本次的验证码是");
        // 获取验证码
        String verCode = VerCodeGenerateUtil.generateVerCode();
        String content = "尊敬的xxx,您好:\n"
                + "\n本次请求的邮件验证码为:" + verCode + ",本验证码 5 分钟内效，请及时输入。（请勿泄露此验证码）\n"
                + "\n如非本人操作，请忽略该邮件。\n(这是一封通过自动发送的邮件，请不要直接回复）";
        toEmail.setContent(content);

        Boolean check = mailService.sendTextMail(toEmail.getTos(), toEmail.getSubject(), toEmail.getContent());
        if(check) {
            return new ResponseResult(200, "发送成功");
        } else {
            return new ResponseResult(-2, "发送失败");
        }

    }
}
