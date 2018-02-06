 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />
<section  class="margin_botton_large">
<div class='font_size_small'>
	<div class='div_edit_team padding_theme'> 
	 <div class='search-field'>
	 <input style='padding: 12px 20px 12px 40px;' ng-model='mysearch' type="text" class="search_input" placeholder="Αναζητηστε εδώ...">
	<i class="fa fa-search"></i></div>
	</div>

<div class='div_edit_team '>
<div ng-repeat ="category in categories  | filter:mysearch" class='table_stylish1 padding_theme'>
		<table >
			<tr class = 'cursor_pointer' ng-click='getExercises(category)'>
				<th >{{category.title}}</th>
				<th style='text-align: right;' >{{category.exercises.length?"-":"+"}}</th>
			</tr>
			
			<tr>
				<td><input type="text" ng-model="category.newexercise.title" placeholder="Η νέα άσκηση εδω.."></td>
				
			
			<td><button  title='Προσθήκη' class='button_flat background_green float_right' ng-click="addExercise(category)">&#10010;</button> 
			</td>
			</tr>
			<tr ng-repeat="exercise in category.exercises  | filter:mysearch" >
				<td><input type="text" ng-model="exercise.title"></td>
				<td>
				<button  title='Διαγραφή' class='button_flat background_red float_right'  ng-click="deleteExercise(exercise,category)">&#10006;</button>
				<button title='Αποθήκευση' class='button_flat background_dark_yellow float_right' ng-click="editExercise(exercise)">&#10004;</button> 
			
			</td>
			</tr>
			
			
			
		</table>
	</div>
</div>
</div>
</section>