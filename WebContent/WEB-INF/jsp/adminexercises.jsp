 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />

<div class="main_nav">

<h2>Επιλογές Ασκήσεων</h2>
<p></p>
<button class="accordion">Ασκήσεις</button>
<div class="panel">
  <p ng-class='selectedPanel("AddNewExercise")' ng-click="initMenuExercises('AddNewExercise'); ">Νέα</p>
  <p ng-class='selectedPanel("ShowAllExercises")' ng-click="initMenuExercises('ShowAllExercises'); ">Όλες οι ασκήσεις</p>
</div>
<button class="accordion">Κατηγορίες ασκήσεων</button>
<div class="panel">
  <p ng-class='selectedPanel("AddNewCategory")' ng-click="initMenuExercises('AddNewCategory'); ">Νέα</p>
  <p ng-class='selectedPanel("ShowAllCategories")' ng-click="initMenuExercises('ShowAllCategories'); ">Όλες οι κατηγορίες</p>
</div>


</div>


<section  class="margin_botton_large side_nav margin_botton_large">

<div class='font_size_small' >
	<div class='div_edit_team padding_theme' ng-show='(selectedCategory && selState.includes("ShowAllExercises"))|| selState.includes("ShowAllCategories")'> 
	<h1>Αναζητήστε άσκηση</h1>
	 <div class='search-field'>
	 <input style='padding: 12px 20px 12px 40px;' ng-model='mysearch' type="text" class="search_input" placeholder="Αναζητηστε εδώ...">
	<i class="fa fa-search"></i></div>
	</div>

<div ng-show = '(selState.includes("AddNewExercise")  || selState.includes("ShowAllExercises"))&&!selectedCategory ' class='div_edit_team padding_theme'>		
<div class='table_stylish1'>
<h1>Επιλέξτε κατηγορία</h1>
<table>
			<tr>
				<th>ΤΙΤΛΟΣ</th>
				<th></th>
			</tr>
	
			<tr ng-repeat="category in categories | orderBy: 'title'" >
				<td>{{category.title}}</td>
				<td>
				<button  title='Επιλογή' class='button_flat background_black float_right' ng-click="categorySelected(category)">Επιλογή</button> 
			</td>
			</tr>
			
			
			
		</table>
		</div>
</div>


<div class='div_edit_team' ng-show='selectedCategory && (selState.includes("AddNewExercise")) '>
<div  class='table_stylish1 padding_theme'>
<h1>Προσθήκη 'Ασκησης στην κατηγορία {{selectedCategory.title}}</h1>
		<table >
	<!-- 		<tr class = 'cursor_pointer' ng-click='getExercises(category)'>
				<th >{{category.title}}</th>
				<th style='text-align: right;' >{{category.exercises.length?"-":"+"}}</th>
			</tr> -->
			<tr>
				<td><input type="text" ng-model="newexercise.title" placeholder="Το όνομα της νέας άσκησης εδω.."></td>
				
			
			<td><button  title='Προσθήκη' class='button_flat background_green float_right' ng-click="addExercise(selectedCategory, newexercise)">Προσθήκη</button> 
			</td>
			</tr>

			
			
		</table>
	
	<h3>Ασκήσεις στην κατηγορία {{selectedCategory.title}} που υπάρχουν ήδη</h3>
			<table >
	<!-- 		<tr class = 'cursor_pointer' ng-click='getExercises(category)'>
				<th >{{category.title}}</th>
				<th style='text-align: right;' >{{category.exercises.length?"-":"+"}}</th>
			</tr> -->
<!-- 				<tr class = ''>
				<th>Τίτλος άσκησης</th>
				
			</tr> -->
			<tr>
				
			
			</tr>
			<tr ng-repeat="exercise in selectedCategoryExercises | orderBy: 'title'" >
				<td>{{exercise.title}}</td>
			</tr>
			
			
			
		</table>
	
	
	
</div>
</div>


<!-- <div class='div_edit_team '>
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
</div>  -->


<div class='div_edit_team padding_theme' ng-show='selectedCategory && selState.includes("ShowAllExercises") '>
<div class='table_stylish1 '>
<h1>Λίστα ασκήσεων στην κατηγορία {{selectedCategory.title}}</h1>
		<table >
			<tr class = ''>
				<th >{{selectedCategory.title}}</th>
				<th ></th>
			</tr>
			

			<tr ng-repeat="exercise in selectedCategoryExercises |filter: mysearch" >
				<td><input type="text" ng-model="exercise.title"></td>
				<td>
				<button  title='Διαγραφή' class='button_flat background_red float_right'  ng-click="deleteExercise(exercise,selectedCategory)">&#10006;</button>
				<button title='Αποθήκευση' class='button_flat background_dark_yellow float_right' ng-click="editExercise(exercise)">&#10004;</button> 
			
			</td>
			</tr>
			
			
			
		</table>
	</div>
</div> 


<div class='div_edit_team' ng-show='(selState.includes("AddNewCategory")) '>
<div  class='table_stylish1 padding_theme'>
<h1>Προσθήκη νέας κατηγορίας ασκήσεων</h1>
		<table >
	<!-- 		<tr class = 'cursor_pointer' ng-click='getExercises(category)'>
				<th >{{category.title}}</th>
				<th style='text-align: right;' >{{category.exercises.length?"-":"+"}}</th>
			</tr> -->
			<tr>
				<td><input type="text" ng-model="newcategory.title" placeholder="Το όνομα της νέας κατηγορίας ασκήσεων εδω.."></td>
				
			
			<td><button  title='Προσθήκη' class='button_flat background_green float_right' ng-click="addCategory(newcategory)">Προσθήκη</button> 
			</td>
			</tr>

			
			
		</table>
	
	<h3>Κατηγορίες ασκήσεων που υπάρχουν ήδη</h3>
			<table>

			<tr ng-repeat="category in categories | orderBy: 'title'" >
				<td>{{category.title}}</td>
			</tr>
	
		</table>
	
	
	
</div>
</div>

<div class='div_edit_team padding_theme' ng-show=' selState.includes("ShowAllCategories") '>
<div class='table_stylish1 '>
<h1>Λίστα κατηγοριών ασκήσεων</h1>
		<table >
			<tr class = ''>
				<th >Τίτλος</th>
				<th ></th>
			</tr>
			

			<tr ng-repeat="category in categories |filter: mysearch" >
				<td><input type="text" ng-model="category.title"></td>
				<td>
				<button  title='Διαγραφή' class='button_flat background_red float_right'  ng-click="deleteCategory(category)">&#10006;</button>
				<button title='Αποθήκευση' class='button_flat background_dark_yellow float_right' ng-click="editCategory(category)">&#10004;</button> 
			
			</td>
			</tr>
			
			
			
		</table>
	</div>
</div> 

</div>
</section>