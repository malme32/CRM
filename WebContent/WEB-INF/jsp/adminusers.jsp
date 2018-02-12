 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />


<div class="main_nav">

<h2>Επιλογές Πελατών</h2>
<p></p>
<button class="accordion">Πελάτες</button>
<div class="panel">
  <p ng-class='selectedPanel("AddNewCustomer")' ng-click="initMenuCustomers('AddNewCustomer'); ">Νέος</p>
  <p ng-class='selectedPanel("ShowAllCustomers")' ng-click="initMenuCustomers('ShowAllCustomers'); ">Λίστα πελατών & επεξεργασία</p>
</div>


</div>

<section class='font_size_small side_nav margin_botton_large' >
<!-- 	<div class='div_edit_team padding_theme'> 
	 <div class='search-field'>
	 <input style='padding: 12px 20px 12px 40px;' ng-model='mysearch' type="text" class="search_input" placeholder="Αναζητηστε εδώ...">
	<i class="fa fa-search"></i></div>
	</div>

	<div class='div_edit_team padding_theme'>
		<select ng-change="addingcontact=false" ng-model="selectedContact" ng-change="getContact(selectedContact)" ng-options="contact.name for contact in contacts | orderBy:'name' |  filter:mysearch">
		<option value="">---Πελάτης---</option>
		</select>
	</div>
 -->


<div ng-show="selState.includes('ShowAllCustomers')&&!selectedContact">

	<div class='div_edit_team padding_theme'> 
		<h1>Επιλέξτε πελάτη</h1>
	 <div class='search-field'>
	 <input style='padding: 12px 20px 12px 40px;' ng-model='mysearch' type="text" class="search_input" placeholder="Αναζητηστε πελάτη εδώ...">
	<i class="fa fa-search"></i></div>
	<!-- <button ng-hide='showAllContacts' title='' class='button_flat background_black float_right' ng-click='mysearch=""; showAllContacts=true'>Εμφάνιση ολων των πελατών</button> 
		<button ng-show='showAllContacts' title='' class='button_flat background_black float_right' ng-click='showAllContacts=false'>Απόκρυψη ολων των πελατών</button>  -->
	
	</div>
	
</div>

<br/>




			<div class='div_edit_team box_shadow_medium_gray' ng-show="selectedContact" >
			
			<!-- <hr> -->
					<h2>Ρυθμίσεις Πελάτη</h2>
			<table class="edit_data_table">
		<!-- 	<tr>
					<th></th> 
				</tr> -->
				
				<tr>
					<td>'Ονομα:<input type="text" ng-model="selectedContact.name" placeholder="Το ονομα εδω.."></td>
				</tr>
							
				<tr>
					<td>E-mail:<input type="email" ng-model="selectedContact.email" placeholder="Το E-mail εδω.."></td>
				</tr>
				
				<tr>
					<td>Τηλέφωνο<input type="text" ng-model="selectedContact.phonenumber" placeholder="Το τηλέφωνο εδω.."></td>
				</tr>
				<tr>
					<td>Διεύθυνση<input type="text" ng-model="selectedContact.address" placeholder="Η διεύθυνση εδω.."></td>
				</tr>
				<tr>
					<td >
					Ημερομηνία γένησης:<br/><md-datepicker ng-model="selectedContact.tmpbirthdate" md-placeholder="Ημερομηνία γένησης.."></md-datepicker>
					</td>
				</tr>
				<tr>
				<td>
					<button title='Διαγραφή' class='button_flat background_red float_right' ng-click="deleteContact(selectedContact)">Διαγραφή</button> 
					<button title='Αποθήκευση' class='button_flat background_dark_yellow float_right' ng-click="editContact(selectedContact)">Αποθήκευση</button> 
				</td>
				</tr>
				
				
				
			</table>
	</div>
	
	
			<div class='div_edit_team box_shadow_medium_gray' ng-show="selState.includes('AddNewCustomer')" >
			
			<!-- <hr> -->
					<h2>Εισαγωγή νέου πελάτη</h2>
			<table class="edit_data_table">
		<!-- 	<tr>
					<th></th> 
				</tr> -->
				
				<tr>
					<td>'Ονομα:<input type="text" ng-model="newContact.name" placeholder="Το ονομα εδω.."></td>
				</tr>
							
				<tr>
					<td>E-mail:<input type="email" ng-model="newContact.email" placeholder="Το E-mail εδω.."></td>
				</tr>
				
				<tr>
					<td>Τηλέφωνο<input type="text" ng-model="newContact.phonenumber" placeholder="Το τηλέφωνο εδω.."></td>
				</tr>
				<tr>
					<td>Διεύθυνση<input type="text" ng-model="newContact.address" placeholder="Η διεύθυνση εδω.."></td>
				</tr>
				<tr>
					<td >
					Ημερομηνία γένησης:<br/><md-datepicker ng-model="newContact.birthdate" md-placeholder="Ημερομηνία γένησης.."></md-datepicker>
					</td>
				</tr>
				<tr>
				<td>
					<button title='Εισαγωγή' class='button_flat background_green float_right' ng-click="addContact(newContact)">Εισαγωγή</button> 
				</td>
				</tr>
				
				
				
			</table>
	</div>
	
	
<!-- <div class='div_edit_team padding_theme' >			
<button ng-hide="addingcontact" title='Προσθήκη πελάτη' class='button_flat background_green' ng-click="addingcontact=true; selectedContact=false">Εισαγωγή νέου πελάτη</button>
<button ng-hide='showallcontacts' title='Εμφάνιση όλων των πελατών' class='button_flat background_black' ng-click="showallcontacts=true">Εμφάνιση όλων</button>
<button ng-show='showallcontacts' title='Απόκρυψη όλων των πελατών' class='button_flat background_black' ng-click="showallcontacts=false">Απόκρυψη όλων</button>

 </div>
 -->

 

 
<div class='div_edit_team padding_theme' ng-show='selState.includes("ShowAllCustomers")'>
<div class='table_stylish1'>
		<table>
			<tr>
				<th>ΟΝΟΜΑ</th>
				<th>E-MAIL</th>
				<th>ΤΗΛ</th>
				<th>ΗΜ. ΓΕΝΝΗΣΗΣ</th>
				<th>ΔΙΕΥΘΥΝΣΗ</th>
				<th></th>
			</tr>
			
		
			<tr ng-repeat="contact in contacts  |orderBy:'name' | filter:mysearch" >
				<td>{{contact.name}}</td>
				<td>{{contact.email}}</td>
				<td>{{contact.phonenumber}}</td>
				<td>{{contact.birthdate}}</td>
				<td>{{contact.address}}</td>
				<td>
			
					<button title='Επεξεργασία' class='button_flat background_dark_yellow float_right' ng-click="showContact(contact)">Επεξ.</button> 
			
			</td>
			</tr>
			
			
			
		</table>
	</div>
</div>

</section>
