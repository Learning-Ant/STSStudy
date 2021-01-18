<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />

	<a class="btn btn-primary" href="contactInsertPage.do">새 연락처 등록하기</a>
	<table class="table table-striped" >
		<thead>
			<tr>
				<th>#</th>
				<th>이름</th>
				<th>연락처</th>
				<th>주소</th>
				<th>이메일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<td>등록된 연락처가 없습니다</td>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="contactDto" items="${list}" varStatus="k" >
					<tr>
						<td>${k.index}</td>
						<td>${list.name}</td>
						<td>${list.phone}</td>
						<td>${list.address}</td>
						<td>${list.email}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>

<%@ include file="../template/footer.jsp" %>