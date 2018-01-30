 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />

<div class='font_size_small'>
<div class='div_edit_team padding_theme'> 
 <div class='search-field'>
 <input ng-model='mysearch' type="text" class="form-control" placeholder="Αναζητηστε εδώ...">
<i class="fa fa-search"></i></div>
</div>


<div class='div_edit_team padding_theme'>
<div class='table_stylish1'>
		<table>
			<tr>
				<th>ΚΑΤΗΓΟΡΙΑ</th>
				<th></th>
			</tr>
			
			<tr >
				<td><input type="text" ng-model="newrow.title" placeholder="Η νέα κατηγορία εδω.."></td>
				
			
			<td><button  title='Προσθήκη' class='button_flat background_green float_right' ng-click="addCategory(newrow)">&#10010;</button> 
			</td>
			</tr>
			<tr ng-repeat="row in categories  | filter:mysearch" >
				<td><input type="text" ng-model="row.title"></td>
				<td>
				<button  title='Διαγραφή' class='button_flat background_red float_right'  ng-click="deleteCategory(row)">&#10006;</button>
				<button title='Αποθήκευση' class='button_flat background_dark_yellow float_right' ng-click="editCategory(row)">&#10004;</button> 
			
			</td>
			</tr>
			
			
			
		</table>
	</div>
</div>
</div>
