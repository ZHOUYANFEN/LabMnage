package com.bysj.cqjtu.login.util;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.bysj.cqjtu.login.service.LoginService;
import com.bysj.cqjtu.manager.domain.Sy02;

public class MyRealm extends AuthorizingRealm {
    @Autowired private LoginService loginService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        /*String csy021 = principalCollection.getPrimaryPrincipal().toString() ;
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo() ;
        Set<String> roleName = loginService.findRoles(csy021) ;
        Set<String> permissions = loginService.findPermissions(csy021) ;
        info.setRoles(roleName);
        info.setStringPermissions(permissions);
        return info;*/
        return null;
    }
    /**
     * 首先执行这个登录验证
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken token ) throws AuthenticationException {
      //获取用户账号
        String csy021 = token.getPrincipal().toString();
        Sy02 sy02;
        AuthenticationInfo authenticationInfo;
        try {
            sy02 = loginService.findUserByUsername(csy021);
            if (sy02 != null){
                //将查询到的用户账号和密码存放到 authenticationInfo用于后面的权限判断。第三个参数传入realName。
                authenticationInfo = new SimpleAuthenticationInfo(sy02.getCsy021(),sy02.getCsy022(),"a") ;
                return authenticationInfo ;
            }else{
                return  null ;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
