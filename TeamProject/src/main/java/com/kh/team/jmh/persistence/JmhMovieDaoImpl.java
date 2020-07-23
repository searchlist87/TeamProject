package com.kh.team.jmh.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.JmhMovieImageVo;
import com.kh.team.domain.JmhMovieVo;
import com.kh.team.domain.JmhPagingDto;

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
		sqlSession.update(NAMESPACE + "updateMovie", jmhMovieVo);
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
		sqlSession.insert(NAMESPACE + "movieSubImageRegister", map)	;
	}

	// 영화 서브이미지 삭제
	@Override
	public void deleteMovieImage(String movie_code) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteMovieImage", movie_code);
	}

	// 영화 총 갯수 가져오기
	@Override
	public int getCountMovie(JmhPagingDto jmhPagingDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getCountMovie",jmhPagingDto);
	}

	// 영화 페이징
	@Override
	public List<JmhMovieVo> moviePagingList(JmhPagingDto jmhPagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "movieListPaging", jmhPagingDto);
	}

}
