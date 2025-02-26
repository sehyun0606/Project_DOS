package com.itwillbs.project_dos.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;
/*
 * review_idx int PK 
review_title varchar(100) 
review_content varchar(2000) 
review_date date 
update_date date 
review_file varchar(200) 
review_file1 varchar(200) 
review_file2 varchar(200) 
review_file3 varchar(200) 
member_id varchar(50) 
review_like int 
review_rating int 
answer_status varchar(1)
answer_content varchar(2000) 
answer_date datetime
 */
@Data
@AllArgsConstructor
@NoArgsConstructor

public class ReviewVO {
	 private int review_idx;
	    private String review_title;
	    private String review_content;
	    private Date review_date;
	    private Date update_date;
	    private String member_id;
	    private int review_like;
	    private int review_rating;
	    private String answer_status;
	    private String answer_content;
	    private Date answer_date;
	    
	    
	    
	    
	    
}

