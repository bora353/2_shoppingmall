//package com.shoppingmall.controller;
//
//import java.util.Random;
//import net.nurigo.sdk.NurigoApp;
//import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
//import net.nurigo.sdk.message.model.Balance;
//import net.nurigo.sdk.message.model.Message;
//import net.nurigo.sdk.message.model.StorageType;
//import net.nurigo.sdk.message.request.MessageListRequest;
//import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
//import net.nurigo.sdk.message.response.MessageListResponse;
//import net.nurigo.sdk.message.response.MultipleDetailMessageSentResponse;
//import net.nurigo.sdk.message.response.SingleMessageSentResponse;
//import net.nurigo.sdk.message.service.DefaultMessageService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.core.io.ClassPathResource;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//
//import java.io.File;
//import java.io.IOException;
//import java.time.Instant;
//import java.time.LocalDateTime;
//import java.time.ZoneId;
//import java.time.ZoneOffset;
//import java.time.format.DateTimeFormatter;
//import java.util.ArrayList;
//
//@Controller
//public class ExampleController {
//
//    final DefaultMessageService messageService;
//    private final SmsCertificationDAO smsCertificationDAO;
//    @Autowired
//    public ExampleController(SmsCertificationDAO smsCertificationDAO) {
//        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
//        this.messageService = NurigoApp.INSTANCE.initialize("NCSQLOHEUGEAH3BB", "DPIVENCN6CFZ0JMEOWAXUP7QWDYOMPCD", "https://api.coolsms.co.kr");
//        this.smsCertificationDAO = smsCertificationDAO;
//    }
//    /**
//     * 단일 메시지 발송 예제
//     */
//    @PostMapping("/check/sendSMS")
//    public SingleMessageSentResponse sendOne(String phoneNumber) {
//
//        Random random = new Random();
//        String cerNum = "";
//        for(int i = 0; i < 4; i++) {
//            String ran = Integer.toString(random.nextInt(10));
//            cerNum += ran;
//        }
//        System.out.println("phoneNumber = " + phoneNumber);
//        Message message = new Message();
//        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
//        message.setFrom("01067744387");
//        message.setTo(phoneNumber);
//        message.setText("아이티윌 쇼핑몰 휴대폰 인증 테스트 메시지 : 인증번호는 " + "[" + cerNum + "]" + "입니다.");
//        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
//        smsCertificationDAO.createSmsCertification(message.getTo(),cerNum);
//        System.out.println("smsCertificationDAO.getSmsCertification(phoneNumber) = "
//            + smsCertificationDAO.getSmsCertification(phoneNumber));
//        System.out.println(response);
//
//        return response;
//    }
//}
