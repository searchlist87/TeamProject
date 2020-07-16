package com.kh.team.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.JmhMovieImageVo;
import com.kh.team.domain.JmhMovieVo;

@Repository
public class JmhMovieDaoImpl implements JmhMovieDao {

	private static final String NAMESPACE = "mappers.jmh-movie-mapper.";
	
	
	@Inject
	private SqlSession sqlSession;	
	
	// 영화 조회
	@Override
	public List<JmhMovieVo> getMovieList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "getMovieList");
	}

	// 영화 등록
	@Override
	public void movieRegister(JmhMovieVo jmhMovieVo) throws Exception {
		sqlSession.insert(NAMESPACE + "movieRegister", jmhMovieVo);
	}
	
	// 영화 상세정보 보기
	@Override
	public JmhMovieVo selectByMovie(String movie_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectByMovie", movie_code);
	}
	
	// 영화 상세_subImage 보기
	@Override
	public List<JmhMovieImageVo> selectByMovieSubImage(String movie_code) throws Exception {
		return sqlSession.selectList(NAMESPACE + "selectByMovieSubImage", movie_code);
	}

	// 영화 수정
	@Override
	public void movieModify(JmhMovieVo jmhMovieVo) throws Exception {
		// TODO Auto-generated method stub

	}

	// 영화코드 조회
	@Override
	public String selectMovieCode() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectMovieCode");
	}

	// 영화 서브 이미지파일 추가
	@Override
	public void movieSubImageRegister(String movie_code, String movie_sub_image) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("movie_code", movie_code);
		map.put("movie_sub_image", movie_sub_image);
		System.out.println("movie_code:" + movie_code);
		System.out.println("movie_sub_image:" + movie_sub_image);
		sqlSession.insert(NAMESPACE + "movieSubImageRegister", map)	;
	}

	

	

}
