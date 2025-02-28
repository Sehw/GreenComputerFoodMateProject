package com.spring.FoodMate.product.dto;

import java.util.Date;

public class ProductQnaDTO {
    private int cmt_pdt_qna_id;  // 댓글 ID
    private int pdt_id;  // 상품 ID
    private String user_id;  // 작성자 ID
    private String comments;  // 댓글 내용
    private Integer parent_id;  // 부모 댓글 ID
    private Date create_date;  // 작성 일시

    // Getters and Setters
    public int getCmt_pdt_qna_id() { return cmt_pdt_qna_id; }
    public void setCmt_pdt_qna_id(int cmt_pdt_qna_id) { this.cmt_pdt_qna_id = cmt_pdt_qna_id; }

    public int getPdt_id() { return pdt_id; }
    public void setPdt_id(int pdt_id) { this.pdt_id = pdt_id; }

    public String getUser_id() { return user_id; }
    public void setUser_id(String user_id) { this.user_id = user_id; }

    public String getComments() { return comments; }
    public void setComments(String comments) { this.comments = comments; }

    public Integer getParent_id() { return parent_id; }
    public void setParent_id(Integer parent_id) { this.parent_id = parent_id; }

    public Date getCreate_date() { return create_date; }
    public void setCreate_date(Date create_date) { this.create_date = create_date; }
    
 // toLogString() 메서드 추가
    public String toLogString() {
        return "ProductQnaDTO{" +
               "cmt_pdt_qna_id=" + cmt_pdt_qna_id +
               ", pdt_id=" + pdt_id +
               ", user_id='" + user_id + '\'' +
               ", comments='" + comments + '\'' +
               ", parent_id=" + parent_id +
               ", create_date=" + create_date +
               '}';
    }
}
