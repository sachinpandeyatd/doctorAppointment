<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:useBean id="beanDao" class="com.infinite.hospital_management_system.HospitalDao"/>
	<div class="table-div">
		<table class="table table-dark table-striped table-hover table-bordered margin-top-10 ">
			<tr>
				<th>PaymentId</th>
				<th>Amount</th>
				<th>DueAmount</th>
				<th>PaymentDate</th>
				<th>PayMode</th>
				<th>PatientId</th>
			</tr>
			<c:forEach var="payment" items="${beanDao.showPayments()}">
				<tr>
					<td>${payment.paymentId}</td>
					<td>${payment.amount}</td>
					<td>${payment.dueAmount}</td>
					<td>${payment.paymentDate}</td>
					<td>${payment.payMode}</td>
					<td>${payment.patientId}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>