 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <spring:url value="/resources/theme1" var="resources" />
  --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="" />

<title>Admin</title>
<spring:url value="/resources" var="resources" />


<!-- COMMON >>>>>>>>>>>>> -->

	<script src="${resources}/libs/angular.min.js"></script>
<script src="${resources}/libs/angular-route.js"></script>
	<script src="${resources}/libs/angular-animate.js"></script>
		<!-- ANGULAR MATERIAL >>>>> -->
 <script src="${resources}/libs/angular-aria.min.js"></script>
<script src="${resources}/libs/angular-messages.min.js"></script>
<script src="${resources}/libs/svg-assets-cache.js"></script>
<script src="${resources}/libs/angular-material.js"></script>
<link rel="stylesheet" href="${resources}/libs/css.css?family=Roboto:300,400,500,700,400italic">
<link rel='stylesheet' href='${resources}/libs/angular-material.css'>


<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular-route.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular-animate.js"></script>
	
 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular-aria.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular-messages.min.js"></script>
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/t-114/svg-assets-cache.js"></script>
<script src="https://cdn.gitcdn.link/cdn/angular/bower-material/v1.1.5/angular-material.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic">
<link rel='stylesheet' href='https://cdn.gitcdn.link/cdn/angular/bower-material/v1.1.5/angular-material.css'> -->
<!--<link rel='stylesheet' href='https://material.angularjs.org/1.1.5/docs.css'> -->
		<!-- <<<<< ANGULAR MATERIAL -->	
	
	<%-- 
	<spring:url value="/resources/admin.js" var="crunchifyJS" /> --%><%-- 
 	<spring:url value="/resources/main.css" var="maincss" /> --%>
 	<script src="${resources}/js/admin.js?ver=31"></script>
  	<link rel="stylesheet" type="text/css" href="${resources}/css/admin.css?ver=31">
 	<%-- <link rel="stylesheet" type="text/css" href="${resources}admin.css"> --%>      
<!-- <<<<<<<<<<<<< COMMON  -->


</head>
<body ng-app="appAdmin" ng-controller='adminController'>

<!-- 
<button ng-click="cssLiMenuClass('categories')">test</button> -->
<div class='adminmenu'>
	<ul>
	
		<li><a  ng-href='#!adminprograms' ng-click="setCurrentMenu('programs')" ng-class="cssLiMenuClass('programs')">ΠΡΟΓΡΑΜΜΑΤΑ</a></li>
		<li ng-show='loggedin.role=="ROLE_ADMIN"'><a  ng-href='#!adminexercises' ng-click="setCurrentMenu('exercises')" ng-class="cssLiMenuClass('exercises')">ΑΣΚΗΣΕΙΣ</a></li>
	
		<li><a  ng-href='#!adminusers' ng-click="setCurrentMenu('users')" ng-class="cssLiMenuClass('users')">ΠΕΛΑΤΟΛΟΓΙΟ</a></li>
	
	
<!-- 		<li><a ng-href='#!admincategories'   ng-click="setCurrentMenu('categories')" ng-class="cssLiMenuClass('categories')">ΚΑΤΗΓΟΡΙΕΣ</a></li>
 -->	

	
	
			
						
					<li >
					<c:url value="/logout" var="logoutUrl" /> <form id="logout" action="${logoutUrl}" method="post" >
					  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
					<c:if test="${pageContext.request.userPrincipal.name != null}">
						<a style='' href="javascript:document.getElementById('logout').submit()"> Logout</a>
					</c:if>
				</li>
					
				
					</ul>
						<span style='position:fixed;top:10px;right:10px;float:fight;color: #cf695a'>{{loggedin.name}}, {{loggedin.role}}</span>
</div>

<!-- <div style='top:200px; position:fixed; z-index:	; opacity:0.2;width:100%;font-size:200%; text-align:center; color:gray'>GO-GO Gym</div>
 -->
 <div ng-view ></div> 

</body>
</html>