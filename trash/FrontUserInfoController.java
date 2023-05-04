//package com.shoppingmall.controller;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.HashMap;
//import java.util.Map;
//
//@WebServlet(urlPatterns = "/userInfo/*")
//public class FrontUserInfoController extends HttpServlet {
//    private Map<String, MyController> controllerMap = new HashMap<>();
//
//    public FrontUserInfoController() {
////        controllerMap.put("/userInfo", new UserInfoFormController());
//    }
//
//    @Override
//    protected void service(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//        String requestURI = request.getRequestURI();
//        System.out.println("requestURI = " + requestURI);
//        MyController controller = controllerMap.get(requestURI);
//
//        if (controller == null) {
//            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
//            return;
//        }
//
//        controller.process(request, response);
//    }
//
//}
