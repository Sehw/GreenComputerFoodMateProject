package postfind;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.spring.FoodMate.post.service.PostService;
import com.spring.FoodMate.post.vo.postVO;


public class postfindtest {
	
	@Inject
	private SqlSessionFactory sqlFactory;
	
	@Autowired
	private PostService postService;
	@Autowired
	public postVO postVO;
	
	@Test
	public void test() {
		try{
			postVO = postService.selectdong("");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	@Test
	public void test2() {
		try{
			postVO = postService.selectDoro("");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	@Test
	public void test3() {
		try{
			postVO = postService.selectdong("11");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	@Test
	public void test4() {
		try{
			postVO = postService.selectDoro("11");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	@Test
	public void test5() {
		try{
			postVO = postService.selectdong("법동");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	@Test
	public void test6() {
		try{
			postVO = postService.selectdong("동춘당로");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
