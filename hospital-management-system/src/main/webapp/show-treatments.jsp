<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Treatment Table</title>
	</head>
	<body>
	<jsp:include page="header.jsp" />
		<div class="table-div">
			<table class="table table-dark table-striped table-hover table-bordered margin-top-10 ">
				<tr>
					<th>ID</th>
					<th>Patient ID</th>
					<th>Doctor ID</th>
					<th>Issue</th>
					<th>Type</th>
					<th>From</th>
					<th>To</th>
					<th>Room</th>
					<th><b>PAYMENT</b></th>
					<th><b>DISCHARGE</b></th>
				</tr>
				<jsp:useBean id="dao" class="com.infinite.hospital_management_system.HospitalDao" />
				<c:forEach var="treatment" items="${dao.showTreatment() }">
					<tr>
						<td>${treatment.treatmentId }</td>
						<td>${treatment.patientid }</td>
						<td>${treatment.doctorid }</td>
						<td>${treatment.issue }</td>
						<c:if test="${treatment.visitingOrAdmitting == 0 }"><td>Visiting</td></c:if>
						<c:if test="${treatment.visitingOrAdmitting == 1 }"><td>Admitting</td></c:if>
						<td>${treatment.treatmentdate }</td>
						<td>${treatment.dischargedate }</td>
						<td>${treatment.roomId }</td>
						<td><a href="add-payment.jsp?patientid=${treatment.patientid }"><button class="btn btn-outline-success">PAYMENT</button></a></td>
						<c:if test="${treatment.visitingOrAdmitting == 1 and treatment.dischargedate == null }">
							<td>
								<form method="post">
									<input type="hidden" name="treatmentId" value="${treatment.treatmentId }">
									<input class="btn btn-outline-danger" type="submit" value="DISCHARGE">
								</form>
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</div>
		<c:if test="${param.treatmentId != null }">
			${dao.discharge(param.treatmentId) }
		</c:if>
	</body>
</html>