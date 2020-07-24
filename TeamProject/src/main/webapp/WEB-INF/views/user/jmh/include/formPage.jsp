<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="frmPage" action="/admin/admin_movie_list" method="get">
	<input type="hidden" name="page" value="${jmhPagingDto.page}"/>
	<input type="hidden" name="perPage" value="10"/>
	<input type="hidden" name="searchType" value="${jmhPagingDto.searchType}"/>
	<input type="hidden" name="keyword" value="${jmhPagingDto.keyword}"/>
	<input type="hidden" name="event_end_date" value="${jmhPagingDto.event_end_date}"/>
</form>