package com.spring.FoodMate.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.FoodMate.member.vo.BuyerVO;
import com.spring.FoodMate.member.vo.SellerVO;
import com.spring.FoodMate.member.dao.MemberDAO;

@Service("memberService")
@Transactional(propagation=Propagation.REQUIRED)
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	public BuyerVO login(Map  loginMap) throws Exception{
		return memberDAO.login(loginMap);
	}
	
	public SellerVO loginslr(Map  loginMap) throws Exception{
		return memberDAO.loginslr(loginMap);
	}
	
	public String buyerIDoverlapped(String id) throws Exception{
		return memberDAO.selectOverlappedBuyerID(id);
	}
	
	public String sellerIDoverlapped(String id) throws Exception{
		return memberDAO.selectOverlappedSellerID(id);
	}
	
	public void addBuyer(BuyerVO buyerVO) throws Exception{
		
		String ssn1 = buyerVO.getSsn1();
		if (ssn1 != null && (ssn1.equals("1") || ssn1.equals("3"))) {
			buyerVO.setSex("M");
        } else if (ssn1 != null && (ssn1.equals("2") || ssn1.equals("4"))) {
        	buyerVO.setSex("F");
        } else {
        	buyerVO.setSex("N");
        }
		
		String email = buyerVO.getEmail_id() + "@" + buyerVO.getEmail_domain();
		buyerVO.setEmail(email);
		
		memberDAO.insertNewBuyer(buyerVO);
	}
	
	public void addSeller(SellerVO sellerVO) throws Exception{
		
		sellerVO.setBusiness_no(sellerVO.getBsnum1() + sellerVO.getBsnum2() + sellerVO.getBsnum3());
		
		String email = sellerVO.getEmail_id() + "@" + sellerVO.getEmail_domain();
		sellerVO.setEmail(email);
		
		memberDAO.insertNewSeller(sellerVO);
	}
}
