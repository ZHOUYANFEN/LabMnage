package com.bysj.cqjtu.cxf.impl;

import javax.jws.WebService;

import org.springframework.stereotype.Component;

import com.bysj.cqjtu.cxf.Helloword;

@Component("helloWorld")
@WebService
public class HellowordImpl implements Helloword {

    @Override
    public String say(String str) {
        return "Hello"+str;
    }

}
