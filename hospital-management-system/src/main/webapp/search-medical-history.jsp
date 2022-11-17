<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Medical History</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container">
		<div class="card bg-dark custom-card">
			<article class="card-body mx-auto" style="max-width: 600px;">
				<p class="divider-text"><span class="bg-dark">Search Medical History</span></p>
				<form>
					<div class="form-group input-group">
						<div class="input-group-prepend">
						    <span class="input-group-text"><i class="fa-solid fa-notes-medical"></i></span>
						</div>
				        <input name="medHisId" class="form-control" placeholder="Medical History ID" type="number">
				    </div>
				                                         
				    <div class="form-group">
				        <button type="submit" class="btn btn-primary btn-block">SUBMIT</button>
				    </div>                                                                 
				</form>
			</article>
		</div>
	</div>
	
	<c:set var="medHisId" value="${param.medHisId }"/>
	<c:if test="${medHisId != null }">
		<div class="table-div">
			<table class="table table-dark table-striped table-hover table-bordered margin-top-10 ">
				<tr>
					<th>ID</th>
					<th>Patient ID</th>
					<th>Treatment Day</th>
					<th>Treatment Description</th>
				</tr>
				<jsp:useBean id="dao" class="com.infinite.hospital_management_system.HospitalDao" />
				<c:set var="medicalHistory" value="${dao.searchMedicalHistory(medHisId) }" />
				<c:if test="${medicalHistory.size() > 0}">
		 			<tr>
		 				<td>${medicalHistory[0].medHisId }</td>
		 				<td>${medicalHistory[0].patientId }</td>
		 				<td>${medicalHistory[0].treatmentDay }</td>
		 				<td>${medicalHistory[0].treatmentDescription }</td>
		 			</tr>
				</c:if>
	 			<c:if test="${medicalHistory.size() == 0}">
					<caption>No Record found. Please check ID and try again.</caption>	
				</c:if>
			</table>
		</div>
	</c:if>
	
</body>
</html>