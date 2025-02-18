package com.spring.FoodMate.support.DAO;

import com.spring.FoodMate.support.DTO.InquiryDTO;
import java.util.List;

public interface InquiryDAO 
{ 
 List<InquiryDTO> getUserInquiriesWithResponses(String buyerId);
}
