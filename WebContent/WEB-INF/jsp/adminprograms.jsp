 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources" var="resources" />


<div class="main_nav">

<h2>Επιλογές Προγραμμάτων</h2>
<p></p>
<button class="accordion">Προγράμματα</button>
<div class="panel">
  <p ng-class='selectedPanel("ShowPerCustomer")' ng-click=" programs=null; initMenuPrograms('ShowPerCustomer'); getPrograms(selectedContact); ">Προγράμματα ανά πελάτη</p>
  <p ng-class='selectedPanel("ListAllPrograms")' ng-click="progfilter='all';initMenuPrograms('ListAllPrograms'); checkToGetAllPrograms()">'Ολα τα προγράμματα</p>
  <p ng-class='selectedPanel("ListExpiringPrograms")' ng-click="progfilter='expiringsoon'; initMenuPrograms('ListExpiringPrograms');  checkToGetAllPrograms()">Προγράμματα που λήγουν σύντομα</p>
</div>


<button class="accordion">Δημιουργία προγράμματος</button>
<div class="panel">
  <p ng-class='selectedPanel("AddNewProgram")' ng-click="initMenuPrograms('AddNewProgram'); ">Νέο</p>
  <p ng-class='selectedPanel("NewFromStandard")' ng-click="initMenuPrograms('NewFromStandard'); getStandardPrograms();">Αντιγραφή απο πρότυπο</p>
  <p ng-class='selectedPanel("NewFromHistory")' ng-click="initMenuPrograms('NewFromHistory'); getPrograms(selectedContact);">Αντιγραφή από ιστορικό</p>
  <p ng-class='selectedPanel("NewFromOtherCustomer")' ng-click="initMenuPrograms('NewFromOtherCustomer'); ">Αντιγραφή απο άλλο πελάτη</p>
</div>

<button class="accordion">Πρότυπα</button>
<div class="panel">
 <!--  <p ng-class='selectedPanel("AddNewStandard")' ng-click="selState='AddNewStandard';selectedProgram=null;selectedContact=null; programDays=null;selectedContact1=null">Νέο</p>
  <p ng-class='selectedPanel("ShowStandardPrograms")' ng-click="selState='ShowStandardPrograms';selectedProgram=null;selectedContact=null; programDays=null;selectedContact1=null">Επεξεργασία προτύπων</p> -->
 <p ng-class='selectedPanel("AddNewProgramST")' ng-click="initMenuStandardPrograms('AddNewProgramST');  ">Νέο</p>
  <p ng-class='selectedPanel("NewFromHistoryST")' ng-click="initMenuStandardPrograms('NewFromHistoryST'); getStandardPrograms();">Αντιγραφή από άλλο πρότυπο</p>
  <p ng-class='selectedPanel("NewFromOtherCustomerST")' ng-click="initMenuStandardPrograms('NewFromOtherCustomerST');  ">Αντιγραφή απο πελάτη</p>
  <p ng-class='selectedPanel("ShowPerCustomerST")' ng-click="programs=null;  initMenuStandardPrograms('ShowPerCustomerST'); getPrograms(adminContact); ">'Ολα τα πρότυπα</p>
<!--   <p ng-class='selectedPanel("ShowActionsST")' ng-click="initMenuStandardPrograms('ShowActionsST');  ">Ενέργειες</p>
 -->  

</div>
<br/>
<br/>
<br/>
<br/>
</div>

<section class='font_size_small side_nav'>
	
	 

<div class='selectedContact' ng-show="selectedContact&&(selectedContact.id!=adminContact.id)&&!(selState.indexOf('List')>=0)" style=''><b >Πελάτης:</b> {{selectedContact.name}}
<br/><span ng-click=' programDays=null; selectedProgram=null; selectedContact=null;selectedContactBack=null;selectedContact1=null; programDays=null; mysearch="";showAllContacts=false'>Αλλαγή πελάτη </span>
</div><!-- &#10006; -->
<div ng-show="(selState)&&!selectedContact&&!(selState.indexOf('List')>=0)">

	<div class='div_edit_team padding_theme'> 
		<h1>Επιλέξτε πελάτη</h1>
	 <div class='search-field'>
	 <input style='padding: 12px 20px 12px 40px;' ng-model='mysearch' type="text" class="search_input" placeholder="Αναζητηστε πελάτη εδώ...">
	<i class="fa fa-search"></i></div>
	<button ng-hide='showAllContacts' title='' class='button_flat background_black float_right' ng-click='mysearch=""; showAllContacts=true'>Εμφάνιση ολων των πελατών</button> 
		<button ng-show='showAllContacts' title='' class='button_flat background_black float_right' ng-click='showAllContacts=false'>Απόκρυψη ολων των πελατών</button> 
	
	</div>
<!--  {{result1}} -->
	<!--   <div class='div_edit_team padding_theme'>
		<select ng-model="selectedContact" ng-change="getPrograms(selectedContact)" ng-options="contact.name for contact in contacts | orderBy:'name' |  filter:mysearch">
		<option value="">---Πελάτης---</option>
		</select>
	</div>-->
	
	
</div>
				
<div class='div_edit_team padding_theme' ng-show='(selState)&&!selectedContact&&(mysearch||showAllContacts)'>
<div class='table_stylish1'>
		<table>
			<tr>
				<th>ΟΝΟΜΑ</th>
				<th>E-MAIL</th>
				<th>ΤΗΛ</th>
				<th></th>
			</tr>
			
		
			<tr ng-repeat="contact in contacts  | filter:mysearch" ng-hide='adminContact.id==contact.id'>
				<td>{{contact.name}}</td>
				<td>{{contact.email}}</td>
				<td>{{contact.phonenumber}} </td>
				<td>
			
					<button title='Επιλογή' class='button_flat background_black float_right' ng-click='contactSelected(contact)'>Επιλογή</button> 
			
			</td>
			</tr>
			
			
			
		</table>
	</div>
</div>


	<div class='div_edit_team padding_theme table_stylish1' ng-show="(selState.indexOf('NewFromStandard')>=0)&&selectedContact" >
	<h1>Επιλέξτε πρότυπο πρόγραμμα για αντιγραφή</h1>
			<table>
				<tr><!-- 
					<th ng-hide="selState.indexOf('ST')">Ιστ.</th> -->
					<th>Τίτλος</th>
					<th>Ημερ. Αρχής</th>
					<th>Ημερ. Τέλους</th>
					<th></th>
				</tr> 
				
<!-- 				<tr >
					<td><input type="text" ng-model="newprogram.title" placeholder="Το όνομα του νέου προγράμματος εδω.."></td>
					
				
				<td><button  title='Προσθήκη' class='button_flat background_green float_right' ng-click="addProgram(newprogram,selectedContact)">&#10010;</button> 
				</td>
				</tr> -->
				<tr class='' ng-repeat="program in standardPrograms " >
<%-- 					<td ng-hide="selState.indexOf('ST')"> <img style='width:30px; heigth:30px' ng-src='${resources}/images/{{program.history?"ok.png":"edit.png"}}'/></td>
 --%>					<td >{{program.title}}</td>
					<td >{{program.datestart | date}}</td>
					<td >{{program.dateend | date}}</td>
					<td>
									<button  title='Αντιγραφή προγράμματος' class='button_flat background_black float_right' ng-click="copyProgram(selectedContact,program)">Αντιγραφή</button> 
										<button  title='Προεπισκόπηση προγράμματος' class='button_flat background_blue float_right' ng-click="createPdf(selectedContact,program,'preview')"><img ng-src="${resources}/images/eye.png"/></button> 
					
					<!-- <button  title='Διαγραφή' class='button_flat background_red float_right'  ng-click="deleteProgram(program)">&#10006;</button>
					<button title='Αποθήκευση' class='button_flat background_black float_right' ng-click="showProgram(program)">&#9881;</button>  -->
				
				</td>
				</tr>
				
				
				
			</table>
	</div>
	<div class='div_edit_team padding_theme table_stylish1' ng-show="(selState.indexOf('NewFromOtherCustomer')>=0)&&selectedContact&&!selectedContact1" >
	<h1>Επιλέξτε άλλο πελάτη για να αντιγράψετε κάποιο πρόγραμμα</h1>
		<button  title='Επιλογή πελάτη' class='button_flat background_black ' ng-click="openCopyProgramModal()">Επιλογή άλλου Πελάτη</button> 
			
	</div>


	<div class='div_edit_team padding_theme table_stylish1' ng-show="(selState.indexOf('NewFromOtherCustomer')>=0)&&selectedContact&&selectedContact1" >
	<h1>Επιλέξτε πρόγραμμα απο τον πελάτη "{{selectedContact1.name}}" για αντιγραφή</h1>
			<table>
				<tr>
						<th>Ιστ.</th>
					<th>Τίτλος</th>
					<th>Ημερ. Αρχής</th>
					<th>Ημερ. Τέλους</th>
					<th></th>
				</tr> 
				
<!-- 				<tr >
					<td><input type="text" ng-model="newprogram.title" placeholder="Το όνομα του νέου προγράμματος εδω.."></td>
					
				
				<td><button  title='Προσθήκη' class='button_flat background_green float_right' ng-click="addProgram(newprogram,selectedContact)">&#10010;</button> 
				</td>
				</tr> -->
				<tr class='' ng-repeat="program in otherPrograms " >
					<td> <img style='width:30px; heigth:30px' ng-src='${resources}/images/{{program.history?"ok.png":"edit.png"}}'/></td>
					<td >{{program.title}}</td>
					<td >{{program.datestart | date}}</td>
					<td >{{program.dateend | date}}</td>
					<td>
									<button  title='Αντιγραφή προγράμματος' class='button_flat background_black float_right' ng-click="copyProgram(selectedContact,program)">Αντιγραφή</button> 
										<button  title='Προεπισκόπηση προγράμματος' class='button_flat background_blue float_right' ng-click="createPdf(selectedContact,program,'preview')"><img ng-src="${resources}/images/eye.png"/></button> 
					
					<!-- <button  title='Διαγραφή' class='button_flat background_red float_right'  ng-click="deleteProgram(program)">&#10006;</button>
					<button title='Αποθήκευση' class='button_flat background_black float_right' ng-click="showProgram(program)">&#9881;</button>  -->
				
				</td>
				</tr>
				
				
				
			</table>
	</div>

	<div class='div_edit_team padding_theme table_stylish1' ng-show="(selState.indexOf('NewFromHistory')>=0)&&selectedContact" >
	<h1>Επιλέξτε πρόγραμμα απο το ιστορικό για αντιγραφή</h1>
			<table>
				<tr>
				<th ng-hide="selState.indexOf('ST')>=0">Ιστ.</th>
					<th>Τίτλος</th>
					<th>Ημερ. Αρχής</th>
					<th>Ημερ. Τέλους</th>
					<th></th>
				</tr> 
				
<!-- 				<tr >
					<td><input type="text" ng-model="newprogram.title" placeholder="Το όνομα του νέου προγράμματος εδω.."></td>
					
				
				<td><button  title='Προσθήκη' class='button_flat background_green float_right' ng-click="addProgram(newprogram,selectedContact)">&#10010;</button> 
				</td>
				</tr> -->
				<tr class='' ng-repeat="program in programs " >
					<td ng-hide="selState.indexOf('ST')>=0"> <img style='width:30px; heigth:30px' ng-src='${resources}/images/{{program.history?"ok.png":"edit.png"}}'/></td>
					<td >{{program.title}}</td>
					<td >{{program.datestart | date}}</td>
					<td >{{program.dateend | date}}</td>
					<td>
									<button  title='Αντιγραφή προγράμματος' class='button_flat background_black float_right' ng-click="copyProgram(selectedContact,program)">Αντιγραφή</button> 
					<!-- <button  title='Διαγραφή' class='button_flat background_red float_right'  ng-click="deleteProgram(program)">&#10006;</button>
					<button title='Αποθήκευση' class='button_flat background_black float_right' ng-click="showProgram(program)">&#9881;</button>  -->
									<button  title='Προεπισκόπηση προγράμματος' class='button_flat background_blue float_right' ng-click="createPdf(selectedContact,program,'preview')"><img ng-src="${resources}/images/eye.png"/></button> 
				
				</td>
				</tr>
				
				
				
			</table>
	</div>

	<div class='div_edit_team padding_theme table_stylish1' ng-show="(selState.indexOf('AddNewProgram')>=0)&&selectedContact&&!selectedProgram" >
		<h1>Εισάγετε το όνομα του νέου προγράμματος</h1>
			<table>
				<tr>
					<th>NEO ΠΡΟΓΡΑΜΜΑ</th>
					<th></th>
				</tr> 
				
	 		<tr >
					<td><input type="text" ng-model="newprogram.title" placeholder="Το όνομα του νέου προγράμματος εδω.."></td>
					
				
				<td><button  title='Προσθήκη' class='button_flat background_green float_right' ng-click="addProgram(newprogram,selectedContact)">Προσθήκη</button> <!-- &#10010; -->
				</td>
				</tr> 
<!-- 				<tr class='cursor_pointer' ng-repeat="program in programs  | filter:mysearch" >
					<td ng-click='showProgram(program)'>{{program.title}}</td>
					<td>
					<button  title='Διαγραφή' class='button_flat background_red float_right'  ng-click="deleteProgram(program)">&#10006;</button>
					<button title='Αποθήκευση' class='button_flat background_black float_right' ng-click="showProgram(program)">&#9881;</button> 
				
				</td>
				</tr> -->
				
				
				
			</table>
	</div>


	<div class='div_edit_team padding_theme table_stylish1' ng-show="selState.indexOf('ShowPerCustomer')>=0&&selectedContact&&!selectedProgram" >
		<h1>Προγράμματα</h1>
			<table>
				<tr>
				<th ng-hide="selState.indexOf('ST')>=0">Ιστ.</th>
					<th>Τίτλος</th>
					<th>Ημερ. Αρχής</th>
					<th>Ημερ. Τέλους</th>
					<th></th>
				</tr> 

				<tr class='' ng-repeat="program in programs  | orderBy: '-datestart'" >
					<td ng-hide="selState.indexOf('ST')>=0"> <img style='width:30px; heigth:30px' ng-src='${resources}/images/{{program.history?"ok.png":"edit.png"}}'/></td>
					<td >{{program.title}}</td>
					<td >{{program.datestart | date}}</td>
					<td >{{program.dateend | date}}</td>
					<td style='min-width:300px'>
					
					

										
										<button  title='Διαγραφή προγράμματος' class='button_flat background_red float_right'  ng-click="deleteProgram(program)">&#10006;</button>
										<button ng-hide="selState.indexOf('ST')>=0" title='Στείλε E-Mail στον πελάτη με αυτό το πρόγραμμα' class='button_flat background_black float_right' ng-click="sendEmail(selectedContact,program)">E-Mail</button> 
				
					<button  title='Δημιουργία PDF αρχείου με το πρόγραμμα' class='button_flat background_green float_right' ng-click="createPdf(selectedContact,program)">PDF</button> 
					<button  title='Προεπισκόπηση προγράμματος' class='button_flat background_blue float_right' ng-click="createPdf(selectedContact,program,'preview')"><img ng-src="${resources}/images/eye.png"/></button> 
					<button ng-hide='program.history' title='Επεξεργάσία προγραμματος' class='button_flat background_dark_yellow float_right' ng-click="showProgram(program)">Επεξ.</button> 

				
				</td>
				</tr>
				
				
				
			</table>
		<img ng-hide='programs' width=40 height=40 src="${resources}/images/loading.gif" alt="">
			
	</div>


	<div class='div_edit_team padding_theme table_stylish1' ng-show="(selState.indexOf('ListExpiringPrograms')>=0||selState.indexOf('ListAllPrograms')>=0)&&!selectedProgram" >
	
	<h1>Αναζητήστε πρόγραμμα</h1>
	 <div class='search-field'>
	 <input style='padding: 12px 20px 12px 40px;' ng-model='prsearch' type="text" class="search_input" placeholder="Αναζητηστε πρόγραμμα εδώ...">
	<i class="fa fa-search"></i></div>
	<table>
	<tr>
	<td>
		<h1>Όλα τα προγράμματα</h1></td>
	<td>
			<button  title='Ανανέωση' class='button_flat background_black float_right' ng-click="allPrograms=null;getAllPrograms()">Ανανέωση</button> 
	
	</td>
	</tr>
	</table>
		
		
		
			<table>
				<tr>
				<th>Ιστ.</th>
					<th>Τίτλος</th>
					<th>Πελάτης</th>
					<th>Ημερ. Αρχής</th>
					<th>Ημερ. Τέλους</th>
					<th></th>
				</tr> 

				<tr class='' ng-hide='adminContact.id==program.contact.id' ng-repeat="program in allPrograms  |programfilter:progfilter| orderBy: 'contact.name' | filter: prsearch" >
					<td> <img style='width:30px; heigth:30px' ng-src='${resources}/images/{{program.history?"ok.png":"edit.png"}}'/></td>
					<td >{{program.title}}</td>
					<td title='Κάντε κλικ για να δείτε όλα τα προγράμματα αυτού του πελάτη' class='cursor_pointer text_underline' ng-click="contactSelected(program.contact,true); ">{{program.contact.name}}</td>
					<td >{{program.datestart | date}}</td>
					<td >{{program.dateend | date}}</td>
					<td style='min-width:300px'>
					
					

						<div >			
					<button  title='Διαγραφή προγράμματος' class='button_flat background_red float_right'  ng-click="deleteProgram(program,selState)">&#10006;</button>
					<button  title='Στείλε E-Mail στον πελάτη με αυτό το πρόγραμμα' class='button_flat background_black float_right' ng-click="sendEmail(selectedContact,program)">E-Mail</button> 
				
					<button  title='Δημιουργία PDF αρχείου με το πρόγραμμα' class='button_flat background_green float_right' ng-click="createPdf(selectedContact,program)">PDF</button> 
					<button  title='Προεπισκόπηση προγράμματος' class='button_flat background_blue float_right' ng-click="createPdf(selectedContact,program,'preview')"><img ng-src="${resources}/images/eye.png"/></button> 
					
					<button ng-hide='program.history' title='Επεξεργάσία προγραμματος' class='button_flat background_dark_yellow float_right' ng-click="showProgram(program)">Επεξ.</button> 
					</div>	
				
				</td>
				</tr>
				
				
				
			</table>
				<img ng-hide='allPrograms' width=40 height=40 src="${resources}/images/loading.gif" alt="">
			
	</div>



<%-- 	<div class='div_edit_team padding_theme table_stylish1' ng-show="selState.indexOf('ShowActions')&&selectedContact&&!selectedProgram" >
		<h1>Ενέργειες</h1>
			<table>
				<tr>
					<th></th>
					<th>ΠΡΟΓΡΑΜΜΑΤΑ</th>
					<th></th>
				</tr> 
				

				<tr class='cursor_pointer' ng-repeat="program in programs " >
				<td> <img style='width:30px; heigth:30px' ng-src='${resources}/images/{{program.history?"ok.png":"edit.png"}}'/></td>
					<td >{{program.title}}</td>
					<td>
					
					
					<button  title='Στείλε E-Mail στον πελάτη με αυτό το πρόγραμμα' class='button_flat background_red float_right' ng-click="sendEmail(selectedContact,program)">Στείλε E-Mail</button> 
				
					<button  title='Δημιουργία PDF αρχείου με το πρόγραμμα' class='button_flat background_green float_right' ng-click="createPdf(selectedContact,program)">Download PDF</button> 

				</td>
				</tr>
				
				
				
			</table>
	</div> --%>
	

<br/><br/><br/>
<h1 ng-show='selectedProgram&&selState' style='text-align:center'>ΕΠΕΞΕΡΓΑΣΙΑ ΠΡΟΓΡΑΜΜΑΤΟΣ: {{selectedProgram.title}}</h1>

<div class=' div_edit_team padding_theme box_shadow_medium_gray' ng-show='selectedProgram&&selState'>


<h2>Προσθήκη άσκησης</h2>
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
		
	
		<div class='table_stylish1 div_edit_team padding_theme ' ng-show='programDays.length'>
					<button  title='Προεπισκόπηση προγράμματος' class='button_flat background_blue float_right' ng-click="createPdf(selectedContact,selectedProgram,'preview')">Προεπισκόπηση</button> 
<!-- <h2>Πρόγραμμα:</h2> -->
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
				
		
				
			<!-- 	
				<button  title='Αντιγραφή προγράμματος' class='button_flat background_black float_right' ng-click="openCopyProgramModal()">Αντιγραφή</button> 
				
								<button  title='Δημιουργία PDF file' class='button_flat background_red float_right' ng-click="sendEmail(selectedContact,selectedProgram)">E-Mail</button> 
				
				<button  title='Δημιουργία PDF file' class='button_flat background_green float_right' ng-click="createPdf(selectedContact,selectedProgram)">PDF</button> 
				 -->
				 	

				 
					<button title='Αποθήκευση' class='button_flat background_dark_yellow float_right' ng-click="editProgram(selectedProgram)">Αποθήκευση</button> 
									 	<button title='Τέλος' class='button_flat background_black float_right' ng-click="selectedProgram=null; programDays=null">Τέλος</button> 
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
				Επιλέξτε πελάτη για την αντιγραφή προγράμματος στον "{{selectedContact.name}}":
				 <div class='search-field'>
				 <input ng-model='mysearch1' type="text" class="form-control" placeholder="Αναζητηστε εδώ...">
				<i class="fa fa-search"></i></div>
				</div>
			<!--  {{result1}} -->
			<!--{{selectedProgram.entries.days}} -->
				<div class='div_edit_team'>
					<select ng-model="selectedContact5" ng-options="contact.name for contact in contacts | orderBy:'name' |  filter:mysearch1 | excludeadmin:adminContact">
					<option value="">---Πελάτης---</option>
					</select>
				<button  title='Αντιγραφή' class='button_flat background_green float_right' ng-click="selectedContact1=selectedContact5; getOtherPrograms(selectedContact1); closeCopyProgramModal()">OK</button> 
					
				</div>
<br/>
<br/>

				
				</div>
 

 			 </div>


			<div id="downloadPDFModal" class="modal">

			  <!-- Modal content -->
			  <div class="modal-content">
			    <span  ng-click='closeDownloadPdfModal()' class="close">&times;</span>
			  

		<a id ='pdf_download_button' ng-href="{{pdf_path}}" download>
  					<h2 style='text-align:center'>Download Pdf</h2>
			</a>
		
<br/>
<br/>

				
				</div>
 

 			 </div>
 			 
 			 
 			 
 		<div id="previewPDFModal" class="modal">

			  <!-- Modal content -->
			  <div class="modal-content">
			  <div class='div_edit_team'> 
			    <span  ng-click='closePreviewPdfModal()' class="close">&times;</span>
				<img style='width:100%; height:100%'src="{{pdf_img_path}}">
		</div>
<br/>
<br/>

				
				</div>
 

 			 </div>
								<!-- ΠΡΟΤΥΠΑ -->
								<!-- ////////
								//////// -->
<!-- 
<div class='div_edit_team padding_theme table_stylish1' ng-show="selState=='ShowStandardPrograms'" >
	<h1>Επεξεργασία πρότυπων προγραμματων</h1>
			<table>
				<tr>
					<th>ΠΡΟΤΥΠΑ ΠΡΟΓΡΑΜΜΑΤΑ</th>
					<th></th>
				</tr> 
				
				<tr >
					<td><input type="text" ng-model="newprogram.title" placeholder="Το όνομα του νέου προγράμματος εδω.."></td>
					
				
				<td><button  title='Προσθήκη' class='button_flat background_green float_right' ng-click="addProgram(newprogram,selectedContact)">&#10010;</button> 
				</td>
				</tr>
				<tr class='' ng-repeat="program in standardPrograms " >
					<td >{{program.title}}</td>
					<td>
					<button  title='Διαγραφή προγράμματος' class='button_flat background_red float_right'  ng-click="deleteProgram(program)">&#10006;</button>
					<button title='Επεξεργάσία προγραμματος' class='button_flat background_dark_yellow float_right' ng-click="showProgram(program)">Επεξεργάσία</button> 					
					<button  title='Δημιουργία PDF αρχείου με το πρόγραμμα' class='button_flat background_green float_right' ng-click="createPdf(19,program)">Download PDF</button> 
				</td>
				</tr>
				
				
				
			</table>
	</div>
	
	<div class='div_edit_team padding_theme table_stylish1' ng-show="selState=='AddNewStandard'&&!selectedProgram" >
		<h1>Εισάγετε το όνομα του νέου πρότυπου προγράμματος</h1>
			<table>
				<tr>
					<th>NEO ΠΡΟΤΥΠΟ ΠΡΟΓΡΑΜΜΑ</th>
					<th></th>
				</tr> 
	 			<tr >
					<td><input type="text" ng-model="newprogram.title" placeholder="Το όνομα του νέου πρότυπου προγράμματος εδω.."></td>
					
				
				<td><button  title='Προσθήκη' class='button_flat background_green float_right' ng-click="addProgram(newprogram,19)">&#10010;</button> 
				</td>
				</tr> 

				
			</table>
	</div>	 -->
	
<br/>
<br/>
<br/>
<br/>
</section>
