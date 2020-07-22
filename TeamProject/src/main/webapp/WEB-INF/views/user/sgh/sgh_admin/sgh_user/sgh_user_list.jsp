<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../../../include/bootstrap.jsp" %>
<%@ include file="../../../../include/tag_and_styleSheet.jsp" %>
<%@ include file="../../../../include/admin_header.jsp" %>

<style>
	td {
		text-align: center;
	}
	th {
		text-align: center;
	}
</style>
<script>
</script>

<section class="product-area shop-sidebar shop section" style="padding-top: 10px;">
	<div class="container" style="padding: 0px;">
		<div class="row">
			<!-- 사이드 바 메뉴 -->
			<%@ include file="/WEB-INF/views/include/admin_side_menu.jsp"%>
			<div class="col-lg-9 col-md-8 col-12">
				<div class="row">
					<div class="col-12">
						<!--  페이지별 내용 -->
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<div class="container-fluid">
										<div class="row" style="margin-top: 20px;">
											<div class="col-md-12">
												<table class="table">
													<thead>
														<tr>
															<th>아이디</th>
															<th>이름</th>
															<th>등급</th>
															<th>포인트</th>
															<th>가입여부</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../../../../include/footer.jsp" %>