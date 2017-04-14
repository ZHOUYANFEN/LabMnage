package com.bysj.cqjtu.cxf;

import javax.jws.WebService;

@WebService
public interface Helloword {
    public String say(String str);
}
