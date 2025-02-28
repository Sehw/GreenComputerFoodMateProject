package com.spring.FoodMate.support.Service;

import com.spring.FoodMate.support.DAO.InquiryDAO;
import com.spring.FoodMate.support.DTO.InquiryDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import java.util.Arrays;

@Service
public class InquiryService {

    private final InquiryDAO inquiryDAO;
    private final ServletContext servletContext;

    @Autowired
    public InquiryService(InquiryDAO inquiryDAO, ServletContext servletContext) {
        this.inquiryDAO = inquiryDAO;
        this.servletContext = servletContext;
    }

    /**
     * 사용자 문의 내역 및 답변 조회
     * 
     * @param buyerId 구매자 ID
     * @return 해당 구매자의 모든 문의 내역과 답변을 포함한 목록
     */
    public List<InquiryDTO> getUserInquiriesWithResponses(String buyerId) {
        // 서비스 계층에서 buyerId가 잘 전달되었는지 확인하는 로깅
        System.out.println("서비스 - buyerId: " + buyerId);  // 확인 포인트 (디버깅용)

        // InquiryDAO에서 사용자 문의 내역 및 답변을 조회
        List<InquiryDTO> inquiries = inquiryDAO.getUserInquiriesWithResponses(buyerId);

        // DAO로부터 받아온 inquiries가 잘 조회되었는지 확인하는 로깅
        System.out.println("서비스 - inquiries: " + inquiries);  // 확인 포인트 (디버깅용)

        // inquiries 리스트 반환 (결과를 컨트롤러로 전달)
        return inquiries;
    }

    /**
     * 특정 문의 ID에 대한 세부 내용 조회
     * 
     * @param inquiryId 조회할 문의 ID
     * @return 문의 ID에 해당하는 문의 정보
     */
    public InquiryDTO getInquiryById(Long inquiryId) {
        // InquiryDAO에서 해당 inquiryId에 대한 상세 조회
        return inquiryDAO.getInquiryById(inquiryId);
    }

    /**
     * 상품 문의 작성 (서비스 계층에서 처리)
     * 
     * @param inquiryDTO 작성된 상품 문의 객체
     */
    public void submitProductInquiry(InquiryDTO inquiryDTO) {
        // 상품 문의를 DAO에 전달하여 저장
        inquiryDAO.insertProductInquiry(inquiryDTO);
    }

    /**
     * 기타 문의 작성 (서비스 계층에서 처리)
     * 
     * @param inquiryDTO 작성된 기타 문의 객체
     */
    public void submitGeneralInquiry(InquiryDTO inquiryDTO) {
        // 기타 문의를 DAO에 전달하여 저장
        inquiryDAO.insertGeneralInquiry(inquiryDTO);
    }

    /**
     * 모든 상품 문의 목록 조회
     * 
     * @return 모든 상품 문의 목록
     */
    public List<InquiryDTO> getAllProductInquiries() {
        // 상품 문의 목록을 DAO에서 조회
        return inquiryDAO.selectProductInquiries();
    }

    /**
     * 모든 기타 문의 목록 조회
     * 
     * @return 모든 기타 문의 목록
     */
    public List<InquiryDTO> getAllGeneralInquiries() {
        // 기타 문의 목록을 DAO에서 조회
        return inquiryDAO.selectGeneralInquiries();
    }

    /**
     * 이미지 파일 업로드 처리
     * 
     * @param inquiryId 문의 ID
     * @param image 업로드된 이미지 파일
     * @return 이미지 저장 경로
     * @throws IOException 파일 업로드 실패 시 발생하는 예외
     */
    public String uploadImageFile(Long inquiryId, MultipartFile image) throws IOException {
        // 이미지 확장자 체크 (이미지 형식만 업로드 가능하도록)
        String[] allowedExtensions = {"jpg", "jpeg", "png", "gif"};
        String originalFilename = image.getOriginalFilename();
        String extension = originalFilename.substring(originalFilename.lastIndexOf(".") + 1).toLowerCase();

        if (!Arrays.asList(allowedExtensions).contains(extension)) {
            throw new IOException("허용되지 않은 파일 형식입니다.");
        }

        // 저장 경로 설정 (application.properties나 환경 변수에서 경로를 가져오는 방식이 더 좋음)
        String uploadDir = servletContext.getRealPath("/resources/images/support/") + inquiryId + "/";

        File uploadPath = new File(uploadDir);
        if (!uploadPath.exists()) {
            uploadPath.mkdirs();  // 디렉토리 생성
        }

        // 고유한 파일명을 생성하여 파일 저장
        String imageName = UUID.randomUUID().toString() + "." + extension;  // 확장자도 포함
        File targetFile = new File(uploadPath, imageName);
        image.transferTo(targetFile);  // 파일 저장

        // 이미지 경로 반환
        return "/resources/images/support/" + inquiryId + "/" + imageName;
    }
}
