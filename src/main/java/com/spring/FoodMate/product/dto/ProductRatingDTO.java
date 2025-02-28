package com.spring.FoodMate.product.dto;

import java.util.Date;

public class ProductRatingDTO {
    private int cmt_pdt_rating_id;  // 평점 ID
    private int pdt_id;  // 상품 ID
    private String byr_id;  // 작성자 ID
    private int rating;  // 평점
    private String comments;  // 댓글 내용
    private Date create_date;  // 작성 일시

    // Getters and Setters
    public int getCmt_pdt_rating_id() { return cmt_pdt_rating_id; }
    public void setCmt_pdt_rating_id(int cmt_pdt_rating_id) { this.cmt_pdt_rating_id = cmt_pdt_rating_id; }

    public int getPdt_id() { return pdt_id; }
    public void setPdt_id(int pdt_id) { this.pdt_id = pdt_id; }

    public String getByr_id() { return byr_id; }
    public void setByr_id(String byr_id) { this.byr_id = byr_id; }

    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }

    public String getComments() { return comments; }
    public void setComments(String comments) { this.comments = comments; }

    public Date getCreate_date() { return create_date; }
    public void setCreate_date(Date create_date) { this.create_date = create_date; }
    
    // toLogString() 메서드 추가
    public String toLogString() {
        return "ProductRatingDTO{" +
               "cmt_pdt_rating_id=" + cmt_pdt_rating_id +
               ", pdt_id=" + pdt_id +
               ", byr_id='" + byr_id + '\'' +
               ", rating=" + rating +
               ", comments='" + comments + '\'' +
               ", create_date=" + create_date +
               '}';
    }
}
