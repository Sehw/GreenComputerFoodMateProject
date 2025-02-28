package com.spring.FoodMate.support.DAO;

import com.spring.FoodMate.support.DTO.InquiryDTO;
import java.util.List;

public interface InquiryDAO {
    
    /**
     * 사용자의 모든 문의 내역과 답변을 조회
     * 
     * @param buyerId 구매자 ID
     * @return 해당 구매자의 모든 문의 내역과 답변을 포함한 목록
     */
    List<InquiryDTO> getUserInquiriesWithResponses(String buyerId);

    /**
     * 특정 문의 ID에 대한 상세 내용을 조회
     * 
     * @param inquiryId 조회할 문의 ID
     * @return 해당 문의 ID에 대한 문의 내용
     */
    InquiryDTO getInquiryById(Long inquiryId);

    /**
     * 상품 문의를 DB에 저장 (이미지 경로 포함)
     * 
     * @param inquiryDTO 상품 문의 내용 (이미지 경로 포함)
     */
    void insertProductInquiry(InquiryDTO inquiryDTO);

    /**
     * 기타 문의를 DB에 저장 (이미지 경로 포함)
     * 
     * @param inquiryDTO 기타 문의 내용 (이미지 경로 포함)
     */
    void insertGeneralInquiry(InquiryDTO inquiryDTO);

    /**
     * 상품 문의 목록을 조회
     * 
     * @return 모든 상품 문의 목록
     */
    List<InquiryDTO> selectProductInquiries();

    /**
     * 기타 문의 목록을 조회
     * 
     * @return 모든 기타 문의 목록
     */
    List<InquiryDTO> selectGeneralInquiries();
}
