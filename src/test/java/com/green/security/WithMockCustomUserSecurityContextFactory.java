package com.green.security;

import com.green.security.config.security.model.MyUserDetails;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.test.context.support.WithSecurityContextFactory;
import java.util.ArrayList;
import java.util.List;

public class WithMockCustomUserSecurityContextFactory implements WithSecurityContextFactory<WithMockCustomUser> {

    @Override
    public SecurityContext createSecurityContext(WithMockCustomUser annotation) {
        final SecurityContext securityContext = SecurityContextHolder.createEmptyContext();
        List<String> roles = new ArrayList();
        roles.add(annotation.grade());

        UserDetails userDetails = MyUserDetails.builder()
                .iuser(Long.valueOf(annotation.username()))
                .roles(roles)
                .build();

        final UsernamePasswordAuthenticationToken authenticationToken
                = new UsernamePasswordAuthenticationToken(userDetails,"",
                userDetails.getAuthorities());

        securityContext.setAuthentication(authenticationToken);
        return securityContext;
    }
}
