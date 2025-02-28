package com.spring.FoodMate.support.DAO;

import com.spring.FoodMate.support.DTO.InquiryDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class InquiryDAOImpl implements InquiryDAO {

    private final SqlSession sqlSession;

    @Autowired
    public InquiryDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    /**
     * 사용자의 모든 문의 내역과 답변을 조회
     * 
     * @param buyerId 구매자 ID
     * @return 해당 구매자의 모든 문의 내역과 답변을 포함한 목록
     */
    @Override
    public List<InquiryDTO> getUserInquiriesWithResponses(String buyerId) {
        // MyBatis 쿼리 실행 (조회)
        return sqlSession.selectList("mapper.support.getUserInquiriesWithResponses", buyerId);
    }

    /**
     * 특정 문의 ID에 대한 상세 내용을 조회
     * 
     * @param inquiryId 조회할 문의 ID
     * @return 해당 문의 ID에 대한 문의 내용
     */
    @Override
    public InquiryDTO getInquiryById(Long inquiryId) {
        // MyBatis 쿼리 실행 (단일 결과 조회)
        return sqlSession.selectOne("mapper.support.getInquiryById", inquiryId);
    }

    /**
     * 상품 문의를 DB에 저장 (이미지 경로 포함)
     * 
     * @param inquiryDTO 상품 문의 내용 (이미지 경로 포함)
     */
    @Override
    public void insertProductInquiry(InquiryDTO inquiryDTO) {
        // MyBatis 쿼리 실행 (상품 문의 삽입)
        sqlSession.insert("mapper.support.insertProductInquiry", inquiryDTO);
    }

    /**
     * 기타 문의를 DB에 저장 (이미지 경로 포함)
     * 
     * @param inquiryDTO 기타 문의 내용 (이미지 경로 포함)
     */
    @Override
    public void insertGeneralInquiry(InquiryDTO inquiryDTO) {
        // MyBatis 쿼리 실행 (기타 문의 삽입)
        sqlSession.insert("mapper.support.insertGeneralInquiry", inquiryDTO);
    }

    /**
     * 상품 문의 목록을 조회
     * 
     * @return 모든 상품 문의 목록
     */
    @Override
    public List<InquiryDTO> selectProductInquiries() {
        // MyBatis 쿼리 실행 (상품 문의 조회)
        return sqlSession.selectList("mapper.support.selectProductInquiries");
    }

    /**
     * 기타 문의 목록을 조회
     * 
     * @return 모든 기타 문의 목록
     */
    @Override
    public List<InquiryDTO> selectGeneralInquiries() {
        // MyBatis 쿼리 실행 (기타 문의 조회)
        return sqlSession.selectList("mapper.support.selectGeneralInquiries");
    }
}
