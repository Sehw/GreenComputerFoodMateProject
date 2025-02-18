package com.spring.FoodMate.support.DTO;

import java.util.Date;
import org.springframework.stereotype.Component;

public class InquiryDTO 
{
	//문의 관련 필드
	private Long inquiryId;       // 문의 ID (PRO_INQUIRIES의 PRO_INQ_ID, GEN_INQUIRIES의 GEN_INQ_ID)
    private String buyerId;       // 구매자 ID (BYR_ID)
    private Integer inquiryType;  // 문의 유형 (INQ_TYPE)
    private String content;       // 문의 내용 (CONTENT)
    private String status;        // 문의 상태 (STATUS)
    private Date createdDate;     // 작성일시 (CRE_DATE)
    private Long productId;       // 상품 ID (PRO_INQUIRIES만 존재) (PDT_ID)
    private String isSecret;      // 비밀글 여부 (IS_SECRET) (PRO_INQUIRIES만 존재)
	
    //답변 관련 필드
    private Long responseId;      // 답변 ID (PRO_RESPONSES, GEN_RESPONSES의 ID)
	private String responseContent;  // 답변 내용
    private Date responseDate;      // 답변 작성일시
    private String sellerId;       // 판매자 ID (PRO_RESPONSES에 해당)
    private String adminId;        // 관리자 ID (GEN_RESPONSES에 해당)
    
    private String category;
    
    public String getCategory() 
    {
        if (productId != null) 
        { // 상품 문의일 경우 (상품 ID가 존재하면)
            switch (inquiryType) 
            {
                case 1: return "상품";
                case 2: return "배송";
                case 3: return "반품";
                case 4: return "환불";
                case 5: return "교환";
                case 6: return "기타";
                default: return "추후 추가 예정";
            }
        }
        else 
        { // 기타 문의일 경우 (상품 ID가 없으면)
            switch (inquiryType) 
            {
                case 1: return "사이트 관련";
                case 2: return "정책 관련";
                case 3: return "기타";
                default: return "추후 추가 예정";
            }
        }
    }
    
    public String getCategoryValue() {
        if (category == null) {
            category = getCategory();  // 계산된 값 저장
        }
        return category;
    }
    
    
    // generate getters and setters 를 통해 자동 생성
    public Long getResponseId() {
		return responseId;
	}
	public void setResponseId(Long responseId) {
		this.responseId = responseId;
	}
	public String getResponseContent() {
		return responseContent;
	}
	public void setResponseContent(String responseContent) {
		this.responseContent = responseContent;
	}
	public Date getResponseDate() {
		return responseDate;
	}
	public void setResponseDate(Date responseDate) {
		this.responseDate = responseDate;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

    public Long getInquiryId() {
		return inquiryId;
	}
	public void setInquiryId(Long inquiryId) {
		this.inquiryId = inquiryId;
	}
	public String getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	public Integer getInquiryType() {
		return inquiryType;
	}
	public void setInquiryType(Integer inquiryType) {
		this.inquiryType = inquiryType;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	public String getIsSecret() {
		return isSecret;
	}
	public void setIsSecret(String isSecret) {
		this.isSecret = isSecret;
	}	
}
