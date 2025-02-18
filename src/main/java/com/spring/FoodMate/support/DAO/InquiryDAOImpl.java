package com.spring.FoodMate.support.DAO;

import com.spring.FoodMate.support.DTO.InquiryDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class InquiryDAOImpl implements InquiryDAO 
{

    private final SqlSession sqlSession;

    @Autowired
    public InquiryDAOImpl(SqlSession sqlSession) 
    {
        this.sqlSession = sqlSession;
    }

    @Override
    public List<InquiryDTO> getUserInquiriesWithResponses(String buyerId) {
        System.out.println("DAO - buyerId: " + buyerId);  // 확인 포인트

        // SQL 쿼리 실행 전 로그
        System.out.println("DAO - SQL 쿼리 실행됨: getUserInquiries 호출됨");

        // SQL 실행 및 결과 반환
        List<InquiryDTO> inquiries = sqlSession.selectList("mapper.support.getUserInquiriesWithResponses", buyerId);

        // 쿼리 실행 후 결과 확인
        System.out.println("DAO - inquiries 반환됨: " + inquiries);  // 확인 포인트

        return inquiries;
    }

}
