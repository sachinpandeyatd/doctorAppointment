<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Hospital Management System</title>
		<link rel="icon" type="image/png" href="hospital-management-system/images/favicon.ico"/>
		
		<link rel="stylesheet" href="css/style.css">
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>		
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="index.jsp"><img class="logo-image" src="images/hms-high-resolution-logo-white-on-transparent-background.png"></a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
		        </li>
		        
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Patient</a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		            <li><a class="dropdown-item" href="add-patient.jsp">Add Patient</a></li>
		            <li><a class="dropdown-item" href="show-patient.jsp">Show Patient</a></li>
		            <li><a class="dropdown-item" href="search-patient.jsp">Search Patient</a></li>
		          </ul>
		        </li>
		        
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Payment</a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
<!-- 		            <li><a class="dropdown-item" href="add-payment.jsp">Add Payment</a></li> -->
		            <li><a class="dropdown-item" href="show-payments.jsp">Show Payment</a></li>
		            <li><a class="dropdown-item" href="search-payment.jsp">Search Payment</a></li>
		          </ul>
		        </li>
		       
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Treatment</a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
<!-- 		            <li><a class="dropdown-item" href="add-treatment.jsp">Add Treatment</a></li> -->
		            <li><a class="dropdown-item" href="show-treatments.jsp">Show Treatment</a></li>
		            <li><a class="dropdown-item" href="search-treatment.jsp">Search Treatment</a></li>
		          </ul>
		        </li>
		       
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Doctor</a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		            <li><a class="dropdown-item" href="add-doctor.jsp">Add Doctor</a></li>
		            <li><a class="dropdown-item" href="show-doctors.jsp">Show Doctor</a></li>
		            <li><a class="dropdown-item" href="search-doctor.jsp">Search Doctor</a></li>
		          </ul>
		        </li>
		       
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Medical History</a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		            <li><a class="dropdown-item" href="add-medical-history.jsp">Add Medical History</a></li>
		            <li><a class="dropdown-item" href="show-medical-history.jsp">Show Medical History</a></li>
		            <li><a class="dropdown-item" href="search-medical-history.jsp">Search Medical History</a></li>
		          </ul>
		        </li>
		        
		      </ul>
		    </div>
		  </div>
		</nav>
