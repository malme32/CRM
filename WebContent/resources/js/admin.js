var appAdmin = angular.module("appAdmin", ["ngRoute",'ngMaterial', 'ngMessages', 'material.svgAssetsCache']);

appAdmin.config(function($routeProvider) {
    $routeProvider

    .when("/admincategories", {
        templateUrl : "admincategories",
        controller: "categoriesController"

    })
    .when("/adminexercises", {
        templateUrl : "adminexercises",
        controller: "exercisesController"

    })
    .when("/adminprograms", {
        templateUrl : "adminprograms",
        controller: "programsController"

    })
    .when("/adminusers", {
        templateUrl : "adminusers",
        controller: "usersController"

    })
});

/*

appMain.run(function($rootScope, $window, $http, $timeout) {
	
	

	
    $rootScope.$on("$locationChangeStart", function(event, next, current) {   	
    });
    
    

});

*/

appAdmin.controller("adminController",function($scope, $http, $location, $window){
	
	$scope.setCurrentMenu = function (row) {

			$scope.currentmenu = row;

		};


		$scope.cssLiMenuClass = function (row) {
			if(row==$scope.currentmenu){

				return "css_li_menu_active";
			}
			else
			{
				return "css_li_menu";
			}
		};

		$scope.currentmenu = "categories";
		$location.path('admincategories'); 

});

appAdmin.controller("categoriesController",function($scope, $http, $location, $window,$route){
	
	 $http({
	       method : "GET",
	       url : "categories"
	   }).then(function mySuccess(response) {

	       $scope.categories = response.data;

		
	   }, function myError(response) {
	 
	       //$scope.result = response.statusText;

	   });
	 
	 
	 
		$scope.addCategory = function (row) {
			 if(!row.title)
				 return;
			 $http({
			       method : "POST",
			       url : "categories",
			       params:{title:row.title}
			   }).then(function mySuccess(response) {

			       $route.reload();
				
			   }, function myError(response) {
			 
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.")

			   });
			 
		};
		 
		$scope.deleteCategory = function (row) {
			 if(!confirm("Είστε σίγουρος;"))
				 return;
			 $http({
			       method : "DELETE",
			       url : "categories/"+row.id
			   }).then(function mySuccess(response) {

			       $route.reload();
				
			   }, function myError(response) {
			 
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.")

			   });
			 
		};
		
		
		
		
		$scope.editCategory = function (row) {

			 $http({
			       method : "PUT",
			       url : "categories",
			        data: row,
			        headers: {'Content-Type': 'application/json; charset=utf-8'} 
			   }).then(function mySuccess(response) {

			       alert("Έγινε!")
				
			   }, function myError(response) {
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");
			   });
			 
		};
});

appAdmin.controller("exercisesController",function($scope, $http, $location, $window){
	
	 $http({
	       method : "GET",
	       url : "categories"
	   }).then(function mySuccess(response) {
	       $scope.categories = response.data;
	   }, function myError(response) {
	   });
	 
		$scope.getExercises = function (row) {
			if(row.exercises&&row.exercises.length>0)
			{
					row.exercises=[];
					return;
			}
			 $http({
			       method : "GET",
			       url : "categories/"+row.id+"/exercises"
			   }).then(function mySuccess(response) {
				   row.exercises = response.data;
			       if(row.exercises.length==0)
			    	 {
				       alert("Αυτή η κατηγορία δεν περιέχει ασκήσεις.");
			    	 }
			   }, function myError(response) {
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");
			   });
		}
		
		$scope.addExercise = function (category) {
			 if(!category.newexercise.title)
				 return;
			 $http({
			       method : "POST",
			       url : "categories/"+category.id+"/exercises",
			       params:{title:category.newexercise.title}
			   }).then(function mySuccess(response) {
				   category.exercises=[];
				   $scope.getExercises(category);
				   category.newexercise.title = "";
			   }, function myError(response) {
			 
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.")

			   });
			 
		};
		
		$scope.editExercise = function (exercise) {

			 $http({
			       method : "PUT",
			       url : "exercises",
			        data: exercise,
			        headers: {'Content-Type': 'application/json; charset=utf-8'} 
			   }).then(function mySuccess(response) {

			       alert("Έγινε!")
				
			   }, function myError(response) {
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");
			   });
			 
		};
		
		
		$scope.deleteExercise = function (exercise, category) {
			 if(!confirm("Είστε σίγουρος;"))
				 return;
			 $http({
			       method : "DELETE",
			       url : "exercises/"+exercise.id
			   }).then(function mySuccess(response) {

				   category.exercises=[];
				   $scope.getExercises(category);
				
			   }, function myError(response) {
			 
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.")

			   });
			 
		};
		

});

appAdmin.controller("programsController",function($scope, $http, $location, $window, $route){
	
	
	 $http({
	       method : "GET",
	       url : "categories"
	   }).then(function mySuccess(response) {
	       $scope.categories = response.data;
	   }, function myError(response) {
	   });
	 
	 
	 $http({
	       method : "GET",
	       url : "contacts"
	   }).then(function mySuccess(response) {

	       $scope.contacts = response.data;

		
	   }, function myError(response) {
	 
	       //$scope.result = response.statusText;

	   });
	 
		$scope.getPrograms = function (contact) {
			 $scope.selectedProgram =null;
			 $scope.programDays = null;
			 $http({
			       method : "GET",
			       url : "contacts/"+contact.id+"/programs"
			   }).then(function mySuccess(response) {
				   $scope.programs = response.data;
			    	for(k=0;k<$scope.programs.length;k++)
		    		{
				    	 if($scope.programs[k].datestart)
				    		 $scope.programs[k].tmpdatestart=new Date($scope.programs[k].datestart);
				    	 if($scope.programs[k].dateend)
				    		 $scope.programs[k].tmpdateend=new Date($scope.programs[k].dateend);
		    		}
			   }, function myError(response) {
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");
			   });
		}
		
		$scope.addProgram = function (program, contact) {
			 $http({
			       method : "POST",
			       url : "contacts/"+contact.id+"/programs",
			       params:{title:program.title}
			   }).then(function mySuccess(response) {
				   $scope.getPrograms(contact);
			   }, function myError(response) {
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");
			   });
		}
		
		$scope.showProgram = function (program) {

				   $scope.selectedProgram = program;
				   $scope.getEntries(program);
		}
		
		$scope.editProgram = function (program) {
			
			if(program.tmpdatestart)
				program.datestart=program.tmpdatestart;
			if(program.tmpdateend)
				program.dateend=program.tmpdateend;
			 $http({
			       method : "PUT",
			       url : "programs",
			        data: program,
			        headers: {'Content-Type': 'application/json; charset=utf-8'} 
			   }).then(function mySuccess(response) {

			       alert("Έγινε!")
				
			   }, function myError(response) {
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");
			   });
			 
		};
		
		$scope.getExercises = function (category) {
/*			if(row.exercises&&row.exercises.length>0)
			{
					row.exercises=[];
					return;
			}*/
			 $http({
			       method : "GET",
			       url : "categories/"+category.id+"/exercises"
			   }).then(function mySuccess(response) {
				   $scope.exercises = response.data;
			/*       if(row.exercises.length==0)
			    	 {
				       alert("Αυτή η κατηγορία δεν περιέχει ασκήσεις.");
			    	 }*/
			   }, function myError(response) {
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");
			   });
		}
		
		
		$scope.addEntry = function (entry, program, exercise) {

		      
			 $http({
			       method : "POST",
			       url : "programs/"+program.id+"/entries",
			       params:{exerciseid:exercise.id, day:entry.day, sets:entry.sets, repeats:entry.repeats}
			   }).then(function mySuccess(response) {

				   $scope.showProgram(program);
			/*	   $scope.newEntry.day = "";
*//*
				   $scope.selectedCategory = "";*/
				   $scope.selectedExercise = "";/*
				   $scope.newEntry.sets = "";
				   $scope.newEntry.repeats = "";*/
			   }, function myError(response) {
			 
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");

			   });
			 
		};
		$scope.deleteProgram = function (program) {
			 if(!confirm("Είστε σίγουρος;"))
				 return;
			 $http({
			       method : "DELETE",
			       url : "programs/"+program.id
			   }).then(function mySuccess(response) {

			       $scope.getPrograms($scope.selectedContact);
				
			   }, function myError(response) {
			 
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");

			   });
			 
		};
		
		$scope.getEntries = function (program) {

			 $http({
			       method : "GET",
			       url : "programs/"+program.id+"/entries"
			   }).then(function mySuccess(response) {
				 //  $scope.selectedProgram.entries=response.data;
				
				   $scope.programDays= $scope.getDays(response.data);
			   }, function myError(response) {
			 
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");

			   });
			 
		};
		
		$scope.editEntry = function (entry) {
	/*		$scope.result1=entry.exercise;
			alert(entry.exercise.id);*/
			 $http({
			       method : "PUT",
			       url : "entries",
			        params:{repeats:entry.repeats, sets:entry.sets,day:entry.day,id:entry.id}
			   }).then(function mySuccess(response) {

			       alert("Έγινε!")
				
			   }, function myError(response) {
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");
			   });
			 
		};
		
		
		$scope.deleteEntry = function (entry,program) {
			 if(!confirm("Είστε σίγουρος;"))
				 return;
			 $http({
			       method : "DELETE",
			       url : "entries/"+entry.id
			   }).then(function mySuccess(response) {

				   
				   $scope.showProgram(program);
				
			   }, function myError(response) {
			 
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.")

			   });
			 
		};
		

		$scope.getDays = function (entries) {
			var days = [];
			for(i=0;i<entries.length;i++)
			{
				var found=false;
				var obj = {
						   name: entries[i].day, categories:[], entries:[]};
				
				for(k=0;k<days.length;k++)
				{
					if(days[k].name==obj.name)
					{

						found=true;
						break;
					}
				}
				if(!found)
				{
					obj.categories = $scope.getDayCategories(entries,obj);
					//$scope.result = obj;
					
					days.push(obj);
				}
			}
			return days;
			
		}
		
		$scope.getDayCategories  =function(entries, day){
			var categories = [];
		
			for(p=0;p<entries.length;p++)
			{
				if(entries[p].day==day.name)
				{
					var found=false;
				/*	var obj = {
							   category: entries[i].category};*/
					
					for(t=0;t<categories.length;t++)
					{
						if(categories[t].id==entries[p].exercise.category.id)
						{
							found=true;
							break;
						}
					}
					if(!found)
						{	
							entries[p].exercise.category.entries=$scope.getDayCategoryEntries(entries, day, entries[p].exercise.category);
							
							categories.push(entries[p].exercise.category);
						
							
						}
					
				}

			}
			return categories;
		}
		
		$scope.getDayCategoryEntries  =function(entries, day,category){
			var tmpentries = [];
			for(s=0;s<entries.length;s++)
			{
				if(entries[s].day==day.name&&entries[s].exercise.category.id==category.id)
				{
					var found=false;
				/*	var obj = {
							   category: entries[i].category};*/
/*					
					for(l=0;l<tmpentries.length;l++)
					{alert(4);
						if(tmpentries[l].id==entries[s].id)
						{alert(5);
							found=true;
							break;
						}
					}alert(6);
					if(!found)*/
					//entries[s].exercise.category=null;
						tmpentries.push(entries[s]);
					
				}

			}
			return tmpentries;
		}	
		$scope.createPdf  =function(contact, program){
			 $http({
			       method : "POST",
			       url : "contacts/"+contact.id+"/actions",
			       params:{action:"create_program",programid:program.id}
			   }).then(function mySuccess(response) {

				   var getUrl = window.location;
				   var baseUrl = getUrl .protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];
				   //$window.open(baseUrl+'/resources/pdf/program.pdf', '_blank');
				   window.location.href=baseUrl+'/files/pdf/program.pdf';
			      // alert(baseUrl);
				  // http://localhost:8084/CRM/resources/pdf/PDF-XhtmlRendered1.pdf
			   }, function myError(response) {

				   
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");

			   });
		}
		
		$scope.copyProgram  =function(contact, program){
			/*$scope.openCopyProgramModal();*/
			 $http({
			       method : "POST",
			       url : "contacts/"+contact.id+"/actions",
			       params:{action:"copy_program",programid:program.id}
			   }).then(function mySuccess(response) {

				   $scope.closeCopyProgramModal();
			       alert("Έγινε!");
			   }, function myError(response) {
			 
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");

			   });
		}
		
		
		
		  
		  $scope.openCopyProgramModal = function (){

		
			  var modal = document.getElementById('copyProgramModal');

		      modal.style.display = "block";
			  
			  
		  }  
		  $scope.closeCopyProgramModal = function (){
			  
			  var modal = document.getElementById('copyProgramModal');
			  modal.style.display = "none";
			  
		  }  
		
		/*$scope.dayShown = function (index,entry,entries) {
			for(i=0;i<entries.length;i++)
			{
				if(entry.day==entries[i].day)
				{
					if(index!=i)
						return false;
					else return true;
				}
			}
			return false;
		}
		

		$scope.categoryShown = function (index,entry,entries) {
			var dayindex=0;
			for(i=0;i<entries.length;i++)
			{
				if(entry.day==entries[i].day)
				{
					dayindex=index;
					break;
				}
			}
		
			
			
			for(i=0;i<entries.length;i++)
			{
				if(entry.category==entries[i].category&&index>=index)
				{
					if(index!=i)
						return false;
					else return true;
				}
			}
			return false;
		}
		*/
		
});

appAdmin.controller("usersController",function($scope, $http, $location, $window,$route){
	
	 $http({
	       method : "GET",
	       url : "contacts"
	   }).then(function mySuccess(response) {

	       $scope.contacts = response.data;
	    	for(k=0;k<$scope.contacts.length;k++)
    		{
		    	 if($scope.contacts[k].birthdate)
		    		 $scope.contacts[k].tmpbirthdate=new Date($scope.contacts[k].birthdate);
		    	
    		}
		
	   }, function myError(response) {
	 
	       //$scope.result = response.statusText;

	   });

		$scope.addContact = function (contact) {
			 if(!contact.name)
				 return;
			 $http({
			       method : "POST",
			       url : "contacts",
			        data: contact,
			        headers: {'Content-Type': 'application/json; charset=utf-8'} 
			   }).then(function mySuccess(response) {

			       $route.reload();
				
			   }, function myError(response) {
			 
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.")

			   });
			 
		};
	
		$scope.deleteContact = function (contact) {
			 if(!confirm("Είστε σίγουρος;"))
				 return;
			 $http({
			       method : "DELETE",
			       url : "contacts/"+contact.id
			   }).then(function mySuccess(response) {

			       $route.reload();
				
			   }, function myError(response) {
			 
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");

			   });
			 
		};
		
		$scope.editContact = function (contact) {
		
			if(contact.tmpbirthdate)
				contact.birthdate=contact.tmpbirthdate;
			 $http({
			       method : "PUT",
			       url : "contacts",
			        data: contact,
			        headers: {'Content-Type': 'application/json; charset=utf-8'} 
			   }).then(function mySuccess(response) {

			       alert("Έγινε!")
				
			   }, function myError(response) {
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");
			   });
			 
		};

		$scope.showContact = function (contact) {
			$scope.selectedContact=contact;
			$scope.addingcontact=false;
			
		};
		
		
});
