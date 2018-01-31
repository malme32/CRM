 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />

<section class='font_size_small'>
	<div class='div_edit_team padding_theme'> 
	 <div class='search-field'>
	 <input ng-model='mysearch' type="text" class="form-control" placeholder="Αναζητηστε εδώ...">
	<i class="fa fa-search"></i></div>
	</div>


	<div class='div_edit_team padding_theme'>
		<select ng-model="selectedContact" ng-change="getPrograms(selectedContact)" ng-options="contact.name for contact in contacts | orderBy:'name' |  filter:mysearch">
		<option value="">---Επιλέξτε---</option>
		</select>
	</div>






	<div class='div_edit_team padding_theme table_stylish1' ng-show="selectedContact">
			<table>
				<tr>
					<th>ΠΡΟΓΡΑΜΜΑΤΑ</th>
					<th></th>
				</tr>
				
				<tr >
					<td><input type="text" ng-model="newprogram.title" placeholder="Το νέο πρόγραμμα εδω.."></td>
					
				
				<td><button  title='Προσθήκη' class='button_flat background_green float_right' ng-click="addProgram(newprogram,selectedContact)">&#10010;</button> 
				</td>
				</tr>
				<tr class='cursor_pointer' ng-repeat="program in programs  | filter:mysearch" >
					<td ng-click='showProgram(program)'>{{program.title}}</td>
					<td>
					<button  title='Διαγραφή' class='button_flat background_red float_right'  ng-click="deleteProgram(program)">&#10006;</button>
					<button title='Αποθήκευση' class='button_flat background_black float_right' ng-click="showProgram(program)">&#9881;</button> 
				
				</td>
				</tr>
				
				
				
			</table>
	</div>


	<div class='div_edit_team padding_theme ' ng-show="selectedProgram">
			<table class="edit_data_table">
			<tr>
					<th>ΕΠΕΞΕΡΓΑΣΙΑ ΠΡΟΓΡΑΜΜΑΤΟΣ: {{selectedProgram.title}}</th>
				<!-- 	<th></th> -->
				</tr>
				
				<tr>
					<td>Τίτλος:<input type="text" ng-model="selectedProgram.title" placeholder="Το ονομα εδω.."></td>
				</tr>
				<tr>
					<td>Σχόλια:<textarea ng-model="selectedProgram.comment" placeholder="Τα σχολια εδω..">{{selectedProgram.comment}}</textarea></td>
				</tr>
				<tr>
					<td >
					Ημερομηνία αρχής:<br/><md-datepicker style="width:100%;" ng-model="selectedProgram.tmpdatestart" md-placeholder="Αρχη.."></md-datepicker>
					</td>
				</tr>
				<tr>
					<td >
					Ημερομηνία τέλους:<br/><md-datepicker ng-model="selectedProgram.tmpdateend" md-placeholder="Τελος.."></md-datepicker>
					</td>
				</tr>
				<tr>
				<td>
					<button title='Αποθήκευση' class='button_flat background_dark_yellow float_right' ng-click="editProgram(selectedProgram)">Αποθήκευση</button> 
				</td>
				</tr>
				
				
				
			</table>
	</div>


<div class='table_stylish1 div_edit_team padding_theme '>
		<table>
			<tr>
				<th>ΑΣΚΗΣΗ</th>
				<th>ΗΜΕΡΑ</th>
				<th>ΣΕΤ</th>
				<th>ΕΠΑΝ.</th>
				<th></th>
			</tr>
			
			<tr>
				<td style="max-width:25%;">
					<select  ng-model="selectedCategory" ng-change="getExercises(selectedCategory)" ng-options="category.title for category in categories | orderBy:'title'">
						<option value="">---Επιλέξτε---</option>
					</select>
					<select ng-model="selectedExercise" ng-options="exercise.title for exercise in exercises | orderBy:'title'">
						<option value="">---Επιλέξτε---</option>
					</select>
					
					
					
				</td>
			
				<td style="max-width:25%;">
					<select  ng-model="newEntry.day">
						<option value="">---Επιλέξτε---</option>
						<option value="Ημέρα 1η">Ημέρα 1η</option>
						<option value="Ημέρα 2η">Ημέρα 2η</option>
						<option value="Ημέρα 3η">Ημέρα 3η</option>
						<option value="Ημέρα 4η">Ημέρα 4η</option>
						<option value="Ημέρα 5η">Ημέρα 5η</option>
						<option value="Ημέρα 6η">Ημέρα 6η</option>
						<option value="Ημέρα 7η">Ημέρα 7η</option>
					</select>
				</td>
				<td>
				<input type="number" ng-model="newEntry.sets" ></td>
	
				<td>
					<input type="number" ng-model="newEntry.repeats" >
				</td>
			<td><button  title='Προσθήκη' class='button_flat background_green float_right' ng-click="addEntry(newEntry,  selectedProgram, selectedExercise)">&#10010;</button> 
			</td>
			</tr>
			
			<tr ng-repeat="entry in selectedProgram.entries">
				<td style="max-width:25%;">
					{{entry.exercise.title}}
				</td>
			
				<td style="max-width:25%;">
					<select  ng-model="entry.day">
						<option value="">---Επιλέξτε---</option>
						<option value="Ημέρα 1η">Ημέρα 1η</option>
						<option value="Ημέρα 2η">Ημέρα 2η</option>
						<option value="Ημέρα 3η">Ημέρα 3η</option>
						<option value="Ημέρα 4η">Ημέρα 4η</option>
						<option value="Ημέρα 5η">Ημέρα 5η</option>
						<option value="Ημέρα 6η">Ημέρα 6η</option>
						<option value="Ημέρα 7η">Ημέρα 7η</option>
					</select>
				</td>
				<td>
				<input type="number" ng-model="entry.sets" ></td>
	
				<td>
					<input type="number" ng-model="entry.repeats" >
				</td>
			<td><button  title='Προσθήκη' class='button_flat background_green float_right' ng-click="addEntry(newEntry,  selectedProgram, selectedExercise)">&#10010;</button> 
			</td>
			</tr>
			
			
			
<!-- 			<tr ng-repeat="row in categoriesqq  | filter:mysearch" >
				<td><input type="text" ng-model="row.title"></td>
				<td>
				<button  title='Διαγραφή' class='button_flat background_red float_right'  ng-click="deleteCategory(row)">&#10006;</button>
				<button title='Αποθήκευση' class='button_flat background_dark_yellow float_right' ng-click="editCategory(row)">&#10004;</button> 
			
			</td>
			</tr> -->
			
			
			
		</table>
	</div>

</section>
