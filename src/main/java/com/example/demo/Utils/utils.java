package com.example.demo.Utils;

import com.auth0.jwt.JWT;
import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class utils {

    public static String EncoderByMd5(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        //确定加密算法
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        BASE64Encoder base64en = new BASE64Encoder();
        //加密后的字符串
        String newstr = base64en.encode(md5.digest(str.getBytes()));
        return newstr;
    }

    /*
    * 通过token获取到用户的id
    *
    * */
    public static String GetTokenid(HttpServletRequest httpServletRequest){
        String token = httpServletRequest.getHeader("token");
       String userId = JWT.decode(token).getAudience().get(0);
        return userId;
    }

}
