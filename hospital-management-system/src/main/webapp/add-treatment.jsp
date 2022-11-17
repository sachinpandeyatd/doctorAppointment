<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Add Treatment</title>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<jsp:useBean id="dao" class="com.infinite.hospital_management_system.HospitalDao" />
	
		<c:if test="${param.issue != null}">
		     <jsp:useBean id="treatment" class="com.infinite.hospital_management_system.Treatment" />
		     <jsp:setProperty property="patientid" name="treatment"/>
		     <jsp:setProperty property="doctorid" name="treatment"/>
		     <jsp:setProperty property="visitingOrAdmitting" name="treatment"/>
		     
		     <fmt:parseDate value="${param.treatmentDate}" pattern="yyyy-MM-dd" var="cdate1"/>
		     <c:set var="sqlDate1" value="${dao.convertDate(cdate1)}"/>
		        
		     <jsp:setProperty property="treatmentdate" name="treatment" value="${sqlDate1}"/>
		     <jsp:setProperty property="issue" name="treatment"/>
		     <jsp:setProperty property="roomId" name="treatment"/>
		     
		     ${dao.addTreatment(treatment)}
		     <jsp:forward page="show-treatments.jsp"/>
		</c:if>
		
		<div class="container">
			<div class="card bg-dark custom-card">
				<article class="card-body mx-auto" style="max-width: 600px;">
					<p class="divider-text"><span class="bg-dark">ADD Treatment</span></p>
					<form>
						<div class="form-group input-group">
							<div class="input-group-prepend">
							    <span class="input-group-text"> <i class="fa-solid fa-bed-pulse"></i> </span>
							 </div>
					        <input name="patientid" class="form-control" value="${param.patientid }" type="text" readonly>
					    </div>
					    
							<div class="form-group input-group">
								<div class="input-group-prepend">
								    <span class="input-group-text"><i class="fa-solid fa-user-doctor"></i></span>
								 </div>
								 <select class="form-control" name="doctorid">
								 <option selected disabled>Select DOCTOR</option>
					    			<c:forEach var="doctor" items="${dao.showAllAvailableDoctors() }">
										<option value="${doctor.doctorId }">${doctor.doctorName }</option>
					   				</c:forEach>
								 </select>
						    </div>
					    
					    <div class="form-group input-group">
					    	<div class="input-group-prepend">
							    <span class="input-group-text"><i class="fa-solid fa-bed-pulse"></i></span>
							</div>
							<select class="form-control" name="visitingOrAdmitting">
								<option selected disabled>Patient Type</option>
								<option value="0">Visiting</option>
								<option value="1">Admitting</option>
							</select>
						</div> 
					    
					    <div class="form-group input-group">
					    	<div class="input-group-prepend">
							    <span class="input-group-text"><i class="fa-solid fa-calendar-days"></i></span>
							 </div>
					        <input name="treatmentDate" class="form-control" placeholder="Treatment Date" type="date">
					    </div>
					    
					    <div class="form-group input-group">
					    	<div class="input-group-prepend">
							    <span class="input-group-text"><i class="fa-solid fa-hospital"></i></span>
							</div>
							<select class="form-control" name="roomId">
								<option selected disabled>Room (only if admitting)</option>
								<c:forEach var="roomId" items="${dao.showAvailableRooms() }">
						     		<option value="${roomId }">${roomId }</option>
						     	</c:forEach>
							</select>
						</div> 
					    
					    <div class="form-group input-group">
					    	<div class="input-group-prepend">
							    <span class="input-group-text"><i class="fa-solid fa-hospital"></i></span>
							</div>
							<select class="form-control" name="issue">
								<option selected disabled>SELECT Issue</option>
								<c:forEach var="issue" items="${dao.showAllIssues() }">
						     		<option value="${issue }">${issue }</option>
						     	</c:forEach>
							</select>
						</div> 
					                                         
					    <div class="form-group">
					        <button type="submit" class="btn btn-primary btn-block">SUBMIT</button>
					    </div>                                                                 
					</form>
				</article>
			</div>
		</div>
	</body>
</html>