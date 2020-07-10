package com.kh.team.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SghMovieNameVo;

@Repository
public class SghMovieScheduleDaoImpl implements SghMovieScheduleDao {

	private final String NAMESPACE = "mappers.sgh-schedule-mapper.";
	@Inject
	private SqlSession sqlSession;
	@Override
	public List<SghMovieNameVo> getMovieName(String theater_code) throws Exception {
		System.out.println("dao Impl theater_code :" + theater_code);
		List<SghMovieNameVo> list = sqlSession.selectList(NAMESPACE + "getMovieName", theater_code);
		System.out.println("dao Impl list :" + list);
		return list;
	}

}
