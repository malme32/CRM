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
<!--  {{result1}} -->
<!--{{selectedProgram.entries.days}} -->
	<div class='div_edit_team padding_theme'>
		<select ng-model="selectedContact" ng-change="getPrograms(selectedContact)" ng-options="contact.name for contact in contacts | orderBy:'name' |  filter:mysearch">
		<option value="">---Πελάτης---</option>
		</select>
	</div>






	<div class='div_edit_team padding_theme table_stylish1' ng-show="selectedContact" >
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



<h1 ng-show='selectedProgram' style='text-align:center'>ΠΡΟΓΡΑΜΜΑ: {{selectedProgram.title}}</h1>

<div class=' div_edit_team padding_theme box_shadow_medium_gray' ng-show='selectedProgram'>


<h2>Εισαγωγή νέας άσκησης</h2>
<div class='table_stylish1'>
		<table>
			<tr>
				<th>ΗΜΕΡΑ</th>
				<th>ΑΣΚΗΣΗ</th>
				<th>ΣΕΤ</th>
				<th>ΕΠΑΝ.</th>
				<th></th>
			</tr>
			
			<tr style='background-color:#E8E8E8; '>
			
			<td style="max-width:25%;">
					<select  ng-model="newEntry.day">
						<option value="">---Ημέρα---</option>
						<option value="Ημέρα 1η">Ημέρα 1η</option>
						<option value="Ημέρα 2η">Ημέρα 2η</option>
						<option value="Ημέρα 3η">Ημέρα 3η</option>
						<option value="Ημέρα 4η">Ημέρα 4η</option>
						<option value="Ημέρα 5η">Ημέρα 5η</option>
						<option value="Ημέρα 6η">Ημέρα 6η</option>
						<option value="Ημέρα 7η">Ημέρα 7η</option>
					</select>
				</td>
			
			
				<td style="max-width:25%;" >
					<select  ng-model="selectedCategory" ng-change="getExercises(selectedCategory)" ng-options="category.title for category in categories | orderBy:'title'">
						<option value="">---Κατηγορία---</option>
					</select>
					<select ng-model="selectedExercise" ng-options="exercise.title for exercise in exercises | orderBy:'title'">
						<option value="">---Άσκηση---</option>
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
		
			
		</table>
		
		</div>
		
		</div>
		
	</div>
		<div class='table_stylish1 div_edit_team padding_theme ' ng-show='programDays.length'>
<h2>Πρόγραμμα:</h2>
		<div ng-repeat='day in programDays | orderBy:"name"'>
		<h2 class='text_underline' style='text-align:center'>{{day.name}}</h2>
			<div ng-repeat='category in day.categories| orderBy:"title"'>
			<h3 class='font_italic'>{{category.title}}</h3>
	

		
		
		<table>
			<tr>
				<th>ΑΣΚΗΣΗ</th>
				<th>ΣΕΤ</th>
				<th>ΕΠΑΝ.</th>
				<th></th>
			</tr>
			
			<tr ng-repeat='entry in category.entries| orderBy:"exercise.title"'>
			
				<td style="max-width:25%;">
					{{entry.exercise.title}}
				</td>
			
			
				<td>
				<input type="number" ng-model="entry.sets" ></td>
	
				<td>
					<input type="number" ng-model="entry.repeats" >
				</td>
			<td>
				<button  title='Διαγραφή' class='button_flat background_red float_right'  ng-click="deleteEntry(entry,selectedProgram)">&#10006;</button>
				<button title='Αποθήκευση' class='button_flat background_dark_yellow float_right' ng-click="editEntry(entry)">&#10004;</button> 
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
		
		</div>
		
		</div>
		<br>
			<br>
			
			<div class='div_edit_team box_shadow_medium_gray' ng-show="selectedProgram" >
			
			<!-- <hr> -->
					<h2>Γενικές Ρυθμίσεις</h2>
			<table class="edit_data_table">
		<!-- 	<tr>
					<th></th> 
				</tr> -->
				
				<tr>
					<td>Τίτλος:<input type="text" ng-model="selectedProgram.title" placeholder="Το ονομα εδω.."></td>
				</tr>
				<tr>
					<td>Παρατηρήσεις:<textarea ng-model="selectedProgram.comment" placeholder="Τα σχολια εδω..">{{selectedProgram.comment}}</textarea></td>
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
				<button  title='Αντιγραφή προγράμματος' class='button_flat background_black float_right' ng-click="openCopyProgramModal()">Αντιγραφή</button> 
				
				
				<button  title='Δημιουργία PDF file' class='button_flat background_green float_right' ng-click="createPdf(selectedContact,selectedProgram)">PDF</button> 
				
					<button title='Αποθήκευση' class='button_flat background_dark_yellow float_right' ng-click="editProgram(selectedProgram)">Αποθήκευση</button> 
				</td>
				</tr>
				
				
				
			</table>
	</div>

	<br>
			<br>
			
			
			<div id="copyProgramModal" class="modal">

			  <!-- Modal content -->
			  <div class="modal-content">
			    <span  ng-click='closeCopyProgramModal()' class="close">&times;</span>
			  
				<div class='div_edit_team'> 
				Επιλέξτε πελάτη για την αντιγραφή προγράμματος "{{selectedProgram.title}}" από "{{selectedContact.name}}":
				 <div class='search-field'>
				 <input ng-model='mysearch1' type="text" class="form-control" placeholder="Αναζητηστε εδώ...">
				<i class="fa fa-search"></i></div>
				</div>
			<!--  {{result1}} -->
			<!--{{selectedProgram.entries.days}} -->
				<div class='div_edit_team'>
					<select ng-model="selectedContact1" ng-options="contact.name for contact in contacts | orderBy:'name' |  filter:mysearch1">
					<option value="">---Πελάτης---</option>
					</select>
				<button  title='Αντιγραφή' class='button_flat background_black float_right' ng-click="copyProgram(selectedContact1,selectedProgram)">Αντιγραφή</button> 
					
				</div>
<br/>
<br/>

				
				</div>
 

 			 </div>

{{result1}}
			
</section>
