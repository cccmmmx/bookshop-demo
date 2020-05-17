package com.example.demo.service.impl;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.example.demo.dto.Customer;
import com.example.demo.dto.Seller;
import org.springframework.stereotype.Service;


/**
 * @author jinbin
 * @date 2018-07-08 21:04
 */
@Service("TokenService")
public class TokenService {
    public String getToken(Customer user) {
        String token="";
        token= JWT.create().withAudience(user.getId())// 将 user id 保存到 token 里面
                .sign(Algorithm.HMAC256(user.getPassword()));// 以 password 作为 token 的密钥
        return token;
    }
    public String getSellerToken(Seller seller) {
        String sellertoken="";
        sellertoken= JWT.create().withAudience(seller.getId())// 将 user id 保存到 token 里面
                .sign(Algorithm.HMAC256(seller.getPassword()));// 以 password 作为 token 的密钥
        return sellertoken;
    }
}
