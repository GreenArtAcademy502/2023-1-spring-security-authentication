package com.green.security.todo;

import com.green.security.config.RedisService;
import com.green.security.config.security.JwtTokenProvider;
import com.green.security.config.security.SecurityConfiguration;
import com.green.security.config.security.model.MyUserDetails;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Import;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.test.web.servlet.MockMvc;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.verify;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(controllers = TodoController.class)
@Import({SecurityConfiguration.class, JwtTokenProvider.class})
class TodoControllerTest {

    @Autowired
    private MockMvc mvc;


    @MockBean
    private TodoService service;

    @MockBean
    private RedisService redisService;



    @BeforeEach
    void beforeEach() {
        UserDetails user = createUserDetails();

        SecurityContext context = SecurityContextHolder.getContext();
        context.setAuthentication(new UsernamePasswordAuthenticationToken(user, user.getPassword(), user.getAuthorities()));

    }

    private UserDetails createUserDetails() {
        List<String> roles = new ArrayList<>();
        roles.add("ROLE_USER");

        UserDetails userDetails = MyUserDetails.builder()
                .iuser(3L)
                .name("홍길동")
                .roles(roles)
                .build();
        return userDetails;
    }


    @Test
    void insTodo() throws Exception {
        String param = "TEST";

        mvc.perform(post("/todo-api").param("ctnt", param))
                .andExpect(status().isOk())
                .andDo(print());

        verify(service).test();
    }
}