package com.kh.team.sgh.persistence;

public interface SghPointDao {
	// 포인트 조회
	public int getUserPoint(String user_id) throws Exception;
	
	// 포인트 사용하기
	public void updatePoint(String user_id, int use_point) throws Exception;
	
	// 포인트 사용 내역에 추가하기
	public void insertUsedPoint(String user_id, int use_point) throws Exception;
}
