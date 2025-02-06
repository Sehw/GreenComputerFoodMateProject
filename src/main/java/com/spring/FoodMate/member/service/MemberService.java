package com.spring.FoodMate.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.FoodMate.member.vo.BuyerVO;
import com.spring.FoodMate.member.dao.MemberDAO;

@Service("memberService")
@Transactional(propagation=Propagation.REQUIRED)
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	public BuyerVO login(Map  loginMap) throws Exception{
		return memberDAO.login(loginMap);
	}
	
	public String buyerIDoverlapped(String id) throws Exception{
		return memberDAO.selectOverlappedBuyerID(id);
	}
	
	public void addMember(BuyerVO memberVO) throws Exception{
		
		String ssn1 = memberVO.getSsn1();
		if (ssn1 != null && (ssn1.equals("1") || ssn1.equals("3"))) {
            memberVO.setSex("M");
        } else if (ssn1 != null && (ssn1.equals("2") || ssn1.equals("4"))) {
            memberVO.setSex("F");
        } else {
            memberVO.setSex("N");
        }
		
		String email = memberVO.getEmail_id() + "@" + memberVO.getEmail_domain();
		memberVO.setEmail(email);
		
		memberDAO.insertNewBuyer(memberVO);
	}
}
