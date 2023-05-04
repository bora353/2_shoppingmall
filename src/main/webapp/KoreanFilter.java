package com.myproject4.filter;


import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(urlPatterns = "/*")
public class KoreanFilter implements Filter {
    private static final String ENCODING = "UTF-8";
    //private static final String CONTENTS_TYPE = "text/html; charset=UTF-8";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding(ENCODING);
        //response.setCharacterEncoding(ENCODING);
        //response.setContentType(CONTENTS_TYPE);

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}
