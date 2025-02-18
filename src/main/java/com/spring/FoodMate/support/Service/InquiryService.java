package com.spring.FoodMate.support.Service;

import com.spring.FoodMate.support.DAO.InquiryDAO;
import com.spring.FoodMate.support.DTO.InquiryDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class InquiryService {

    private final InquiryDAO inquiryDAO;

    @Autowired
    public InquiryService(InquiryDAO inquiryDAO) {
        this.inquiryDAO = inquiryDAO;
    }

    // 사용자 문의 내역 조회
    public List<InquiryDTO> getUserInquiriesWithResponses(String buyerId) {
        // buyerId가 서비스로 잘 전달되었는지 확인
        System.out.println("서비스 - buyerId: " + buyerId);  // 확인 포인트

        // DAO 호출
        List<InquiryDTO> inquiries = inquiryDAO.getUserInquiriesWithResponses(buyerId);

        // inquiries가 DAO로부터 잘 받아졌는지 확인
        System.out.println("서비스 - inquiries: " + inquiries);  // 확인 포인트

        return inquiries;
    }
}