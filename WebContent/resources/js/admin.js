var appAdmin = angular.module("appAdmin", ["ngRoute",'ngMaterial', 'ngMessages', 'material.svgAssetsCache']);

appAdmin.config(function($routeProvider) {
    $routeProvider

/*    .when("/admincategories", {
        templateUrl : "admincategories",
        controller: "categoriesController"

    })*/
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

appAdmin.filter('programfilter', function() {
    return function(items, filter) {
    	  var result = []; 
    	  if(filter=="expiringsoon")
    		  {
	        	  var now = new Date();  
	        	  var expdate = new Date();
	        	  expdate.setDate(expdate.getDate() + 5);
	        	  for (var i=0; i<items.length; i++){
	                  if (items[i].dateend<expdate&&items[i].dateend>now)  {
	                      result.push(items[i]);
	                  }
	              }  
    		  }
    	  else
    		  return items;
          
          return result;
    };
});
appAdmin.filter('excludeadmin', function() {
    return function(items,adminContact) {
    	  var result = []; 
   
 
    	  for (var i=0; i<items.length; i++){
              if (items[i].id!=adminContact.id)  {
                  result.push(items[i]);
              }
          }      		  
    
          
          return result;
    };
});
appAdmin.run(function($rootScope, $window, $http, $timeout) {

    /*$timeout($rootScope.checkOnline(), 5000);*/
    
	$rootScope.checkOnline = function () {
	
		 $http({
		       method : "GET",
		       url : "options?action=checkonline"
		   }).then(function mySuccess(response) {
			   if(response.data==0)
				   {
				   		$window.location.href ='loginPage';
				   }
			   $rootScope.promise = $timeout($rootScope.checkOnline, 60000);
			   //$timeout($rootScope.checkOnline, 5000);

			/*   $rootScope.chkonline = response.data;
		      alert( response.data);
*/		
			
		   }, function myError(response) {
/*
			   $rootScope.chkonline = response.data;
		       //$scope.result = response.statusText;

			      alert(false);*/

			    //$timeout($rootScope.checkOnline(), 5000);
		   });



	};

    
	$rootScope.adminContact={id:19,name:"Go-Go Gym"};
    $rootScope.$on("$locationChangeStart", function(event, next, current) {  
   $timeout.cancel($rootScope.promise);
    	$rootScope.checkOnline();
    });
    
    

});



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

		$scope.currentmenu = "programs";
		$location.path('adminprograms'); 

});
/*
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

			       alert("Έγινε!");
				
			   }, function myError(response) {
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");
			   });
			 
		};
});
*/
appAdmin.controller("exercisesController",function($scope, $http, $location, $window){

	$scope.getCategories = function () {
	 $http({
	       method : "GET",
	       url : "categories"
	   }).then(function mySuccess(response) {
	       $scope.categories = response.data;
	   }, function myError(response) {
	   });
	};
	
	$scope.getCategories();
	
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
				  //return response.data;
				   $scope.selectedCategoryExercises=  response.data;
			      /* if(row.exercises.length==0)
			    	 {
				       alert("Αυτή η κατηγορία δεν περιέχει ασκήσεις.");
			    	 }*/
			   }, function myError(response) {
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");
			   });
		}
		
		$scope.addExercise = function (category,exercise) {
			 if(!exercise.title)
				 return;
			 $http({
			       method : "POST",
			       url : "categories/"+category.id+"/exercises",
			       params:{title:exercise.title}
			   }).then(function mySuccess(response) {
				   //category.exercises=[];
				   $scope.getExercises(category);
				   $scope.newexercise.title = "";
				   alert("Έγινε!");
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

/*				   category.exercises=[];
*/				   $scope.getExercises(category);
				
			   }, function myError(response) {
			 
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.")

			   });
			 
		};

		$scope.categorySelected = function(category){
			
			$scope.selectedCategory=category;
			$scope.selectedCategoryExercises = $scope.getExercises(category);
			
		}
		
		
		
		$scope.initMenuExercises = function(state)
		{
			$scope.selState=state;
			$scope.selectedCategory=null;
			$scope.selectedCategoryExercises = null;
			$scope.mysearch="";
			//$scope.selectedContact=null;
		}
		$scope.selectedPanel = function(state){
			
			if($scope.selState==state)
				return "background_red";
			else
				return "";
			
		}
		
		
		///////ACCORDION////
		
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
		  acc[i].addEventListener("click", function() {
		    this.classList.toggle("active");
		    var panel = this.nextElementSibling;
		    if (panel.style.maxHeight){
		      panel.style.maxHeight = null;
		    } else {
		      panel.style.maxHeight = panel.scrollHeight + "px";
		    } 
		  });
		}

		////////
		
		
		
		 
		 
		$scope.addCategory = function (row) {
			 if(!row.title)
				 return;
			 $http({
			       method : "POST",
			       url : "categories",
			       params:{title:row.title}
			   }).then(function mySuccess(response) {

				   $scope.getCategories();
				   alert("Έγινε!");
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

				   $scope.getCategories();
				
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

			       alert("Έγινε!");
				
			   }, function myError(response) {
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");
			   });
			 
		};

});

appAdmin.controller("programsController",function($scope, $http, $location, $window, $route, $rootScope){
	
	
	
	
	$scope.initMenuPrograms = function(state)
	{
		
		$scope.selectedContact=$scope.selectedContactBack;
		$scope.selState=state;
		$scope.selectedProgram=null;
		$scope.programDays=null;
		$scope.selectedContact1=null;
		$scope.mysearch="";
		$scope.showAllContacts=false;
	}
	
	$scope.initMenuStandardPrograms = function(state)
	{
		
		$scope.selState=state;
		
		$scope.selectedContact=$rootScope.adminContact; 
		$scope.getPrograms($rootScope.adminContact); 
		$scope.selectedProgram=null; 
		$scope.programDays=null;
		$scope.selectedContact1=null;
		$scope.mysearch="";
		$scope.showAllContacts=false;
	}
	$scope.$on('$viewContentLoaded', function() {
	    //call it here
		$scope.selectedProgram=null;
	});
	
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
	 
	 
	 ////Get standard programs
		$scope.getStandardPrograms = function () {
		 $http({
		       method : "GET",
		       url : "contacts/"+$rootScope.adminContact.id+"/programs" //admin
		   }).then(function mySuccess(response) {
			   $scope.standardPrograms = response.data;
		    	for(k=0;k<$scope.standardPrograms.length;k++)
	  		{
			    	 if($scope.standardPrograms[k].datestart)
			    		 $scope.standardPrograms[k].tmpdatestart=new Date($scope.standardPrograms[k].datestart);
			    	 if($scope.standardPrograms[k].dateend)
			    		 $scope.standardPrograms[k].tmpdateend=new Date($scope.standardPrograms[k].dateend);
	  		}
		   }, function myError(response) {
		      // alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");
		   });
		}
		
	 ////////////////////
	 
		$scope.getPrograms = function (contact) {
		/*	 $scope.selectedProgram =null;
			 $scope.programDays = null;*/
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
		
		$scope.getExpiringPrograms = function () {
			 $scope.selectedProgram =null;
			 $scope.programDays = null;
			 $http({
			       method : "GET",
			       url : "programs?expiringsoon"
			   }).then(function mySuccess(response) {
				   $scope.allPrograms = response.data;
			    	for(k=0;k<$scope.allPrograms.length;k++)
		    		{
				    	 if($scope.allPrograms[k].datestart)
				    		 $scope.allPrograms[k].tmpdatestart=new Date($scope.allPrograms[k].datestart);
				    	 if($scope.allPrograms[k].dateend)
				    		 $scope.allPrograms[k].tmpdateend=new Date($scope.allPrograms[k].dateend);
		    		}
			   }, function myError(response) {
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");
			   });
		}
		$scope.getAllPrograms = function () {
			/* $scope.selectedProgram =null;
			 $scope.programDays = null;*/
			 $http({
			       method : "GET",
			       url : "programs"
			   }).then(function mySuccess(response) {
				   $scope.allPrograms = response.data;
			    	for(k=0;k<$scope.allPrograms.length;k++)
		    		{
				    	 if($scope.allPrograms[k].datestart)
				    		 $scope.allPrograms[k].tmpdatestart=new Date($scope.allPrograms[k].datestart);
				    	 if($scope.allPrograms[k].dateend)
				    		 $scope.allPrograms[k].tmpdateend=new Date($scope.allPrograms[k].dateend);
		    		}
			   }, function myError(response) {
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");
			   });
		}
		$scope.checkToGetAllPrograms = function(){
			if(!$scope.allPrograms)
				$scope.getAllPrograms();
		}
		$scope.getOtherPrograms = function (contact) {
			// $scope.selectedProgram =null;
			 //$scope.programDays = null;
			 $http({
			       method : "GET",
			       url : "contacts/"+contact.id+"/programs"
			   }).then(function mySuccess(response) {
				   $scope.otherPrograms = response.data;
/*			    	for(k=0;k<$scope.programs.length;k++)
		    		{
				    	 if($scope.programs[k].datestart)
				    		 $scope.programs[k].tmpdatestart=new Date($scope.programs[k].datestart);
				    	 if($scope.programs[k].dateend)
				    		 $scope.programs[k].tmpdateend=new Date($scope.programs[k].dateend);
		    		}*/
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
				//   if(contactid!=19)
					   //$scope.getPrograms(contact);
					   $scope.getAllPrograms();
				  // else
					 //  $scope.getStandardPrograms();
					//  / 
				   $scope.showProgram(response.data);
			   }, function myError(response) {
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");
			   });
		}
		
		$scope.showProgram = function (program) {

				   $scope.selectedProgram = program;
				   $scope.getEntries(program);
		}
		
		$scope.editProgram = function (program, addtohistory) {
			
			//if(program.tmpdatestart)
				program.datestart=program.tmpdatestart;
			//if(program.tmpdateend)
				program.dateend=program.tmpdateend;
			 $http({
			       method : "PUT",
			       url : "programs",
			        data: program,
			        headers: {'Content-Type': 'application/json; charset=utf-8'} 
			   }).then(function mySuccess(response) {
				   $scope.getAllPrograms();
				   if(!addtohistory)
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
		$scope.deleteProgram = function (program, action) {
			 if(!confirm("Είστε σίγουρος;"))
				 return;
			 $http({
			       method : "DELETE",
			       url : "programs/"+program.id
			   }).then(function mySuccess(response) {
			/*	   if(action=="ListAllPrograms")
				       $scope.getAllPrograms();
				   if(action=="ListExpiringPrograms")
				       $scope.getExpiringPrograms();
				   else*/
				   $scope.getAllPrograms();
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
		$scope.createPdf  =function(contact, program, action){
			 $scope.pdf_img_path="";
			 $http({
			       method : "POST",
			       url : "contacts/"+program.contact.id+"/actions",
			       params:{action:"create_program",programid:program.id}
			   }).then(function mySuccess(response) {

				   var getUrl = window.location;
				   var baseUrl = getUrl .protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];
				   //$window.open(baseUrl+'/resources/pdf/program.pdf', '_blank');
				   //window.location.href=baseUrl+'/files/pdf/program.pdf';
				   $scope.pdf_path=baseUrl+'/files/pdf/Go-Go Gym Program.pdf';
				   $scope.pdf_img_path=baseUrl+'/files/pdf/Go-Go Gym Program.png';
				   
				   //
				   if(action=="preview")
				   {
					   $scope.openPreviewPdfModal();
				   
				   }
				   else
				   {
					   $scope.openDownloadPdfModal();
						if(!program.history&&!$scope.selState.includes("ST")) 
							if(confirm("Θέλετε να προσθέσε αυτό το πρόγραμμα στο ιστορικό?"))
								{
									program.history=true;
									 $scope.editProgram(program,true);
									
								}
				  }
		
			      // alert(baseUrl);
				  // http://localhost:8084/CRM/resources/pdf/PDF-XhtmlRendered1.pdf
			   }, function myError(response) {

				   
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");

			   });
		}
		
		
		$scope.sendEmail  =function(contact, program){
			if(!program.contact.email)
				{
					alert("Αυτός ο πελάτης δεν έχει ορισμένο E-Mail. Ορίστε E-Mail από το πελατολόγιο και ξαναπροσπαθήστε.")
					return;
				}
				else if(!program.contact.email.includes("@"))
				{

				alert("Αυτός ο πελάτης έχει λανθασμένο E-Mail ορισμένο. Ορίστε το σωστό E-Mail από το πελατολόγιο και ξαναπροσπαθήστε.")
				return;
				}
			 if(!confirm("Είστε σίγουρος;"))
				 return;
			 $http({
			       method : "POST",
			       url : "contacts/"+program.contact.id+"/actions",
			       params:{action:"send_program_email",programid:program.id}
			   }).then(function mySuccess(response) {

				   var getUrl = window.location;
				   var baseUrl = getUrl .protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];
				   //$window.open(baseUrl+'/resources/pdf/program.pdf', '_blank');
				 //  window.location.href=baseUrl+'/files/pdf/program.pdf';
			      // alert(baseUrl);
				  // http://localhost:8084/CRM/resources/pdf/PDF-XhtmlRendered1.pdf	   
			       alert("Το E-Mail στάλθηκε στον πελάτη "+ program.contact.name+"!");
			       
					if(!program.history) 
						//if(confirm("Θέλετε να προσθέσε αυτό το πρόγραμμα στο ιστορικό?"))
							{
								program.history=true;
								 $scope.editProgram(program,true);
								
							}
			       
			   }, function myError(response) {

				   
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");

			   });
		}
		$scope.selectedPanel = function(state){
			
			if($scope.selState==state)
				return "background_red";
			else
				return "";
			
		}
		
		$scope.contactSelected = function(contact,showpercustomer){
			$scope.selectedContact= contact;
			$scope.getPrograms(contact);
			$scope.selectedContactBack=$scope.selectedContact;
			if(showpercustomer)
				$scope.selState='ShowPerCustomer';
			
		}
		$scope.copyProgram  =function(contact, program){
			/*$scope.openCopyProgramModal();*/
			 $http({
			       method : "POST",
			       url : "contacts/"+contact.id+"/actions",
			       params:{action:"copy_program",programid:program.id}
			   }).then(function mySuccess(response) {
				   $scope.getPrograms(contact);
				   //$scope.closeCopyProgramModal();
				   
			        alert("Έγινε!");
			       	if($scope.selState.includes("ST"))
					       $scope.initMenuStandardPrograms('ShowPerCustomerST');
			       	else
			       		$scope.initMenuPrograms('ShowPerCustomer');
			       	$scope.getAllPrograms();
			   }, function myError(response) {
			 
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");

			   });
		}
		
/*		$scope.copyProgramFromOther  =function(contact, program){
			$scope.openCopyProgramModal();
			 $http({
			       method : "POST",
			       url : "contacts/"+contact.id+"/actions",
			       params:{action:"copy_program",programid:program.id}
			   }).then(function mySuccess(response) {
				   //$scope.closeCopyProgramModal();

	       		    $scope.getPrograms(contact);
			       alert("Έγινε1!");
			       	if($scope.selState.includes("ST"))
			       		{
			       			//$scope.getStandardPrograms();
					       $scope.initMenuStandardPrograms('ShowPerCustomerST');
			       		}
			       	else
			       		{
				       		$scope.initMenuPrograms('ShowPerCustomer');
			       		}
			   }, function myError(response) {
			 
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");

			   });
		}*/
		
		
		  
		  $scope.openCopyProgramModal = function (){

		
			  var modal = document.getElementById('copyProgramModal');

		      modal.style.display = "block";
			  
			  
		  }  
		  $scope.closeCopyProgramModal = function (){
			  
			  var modal = document.getElementById('copyProgramModal');
			  modal.style.display = "none";
			  
		  }  
		
		  $scope.openPreviewPdfModal = function (){

				
			  var modal = document.getElementById('previewPDFModal');

		      modal.style.display = "block";
		    
			  
		  }  
		  $scope.closePreviewPdfModal = function (){
			  
			  var modal = document.getElementById('previewPDFModal');
			  modal.style.display = "none";
			  $scope.pdf_img_path="";
		  }    
		  
		  $scope.openDownloadPdfModal = function (){

		
			  var modal = document.getElementById('downloadPDFModal');

		      modal.style.display = "block";
			  
			  
		  }  
		  $scope.closeDownloadPdfModal = function (){
			  
			  var modal = document.getElementById('downloadPDFModal');
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
		
		  
			///////ACCORDION////
			
			var acc = document.getElementsByClassName("accordion");
			var i;

			for (i = 0; i < acc.length; i++) {
			  acc[i].addEventListener("click", function() {
			    this.classList.toggle("active");
			    var panel = this.nextElementSibling;
			    if (panel.style.maxHeight){
			      panel.style.maxHeight = null;
			    } else {
			      panel.style.maxHeight = panel.scrollHeight + "px";
			    } 
			  });
			}

			////////
		  
});

appAdmin.controller("usersController",function($scope, $http, $location, $window,$route){
	
	


	$scope.getContacts = function () {
	 $http({
	       method : "GET",
	       url : "contacts"
	   }).then(function mySuccess(response) {

	       $scope.contacts = response.data;
	    	for(k=0;k<$scope.contacts.length;k++)
    		{
		    	 if($scope.contacts[k].birthdate)
		    		 $scope.contacts[k].tmpbirthdate=new Date($scope.contacts[k].birthdate);
		    	 if($scope.contacts[k].registerdate)
		    		 $scope.contacts[k].tmpregisterdate=new Date($scope.contacts[k].registerdate);
		    	
    		}
		
	   }, function myError(response) {
	 
	       //$scope.result = response.statusText;

	   });
	}
	$scope.getContacts();
		$scope.addContact = function (contact) {
			 if(!contact.name)
				 return;
			 $http({
			       method : "POST",
			       url : "contacts",
			        data: contact,
			        headers: {'Content-Type': 'application/json; charset=utf-8'} 
			   }).then(function mySuccess(response) {
				   $scope.getContacts();
				   alert("'Εγινε!")
				   $scope.initMenuCustomers('ShowAllCustomers');
				
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
				   $scope.getContacts();
				   alert("'Εγινε!")
				   $scope.initMenuCustomers('ShowAllCustomers');
				
			   }, function myError(response) {
			 
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");

			   });
			 
		};
		
		$scope.editContact = function (contact) {
		
		//	if(contact.tmpbirthdate)
				contact.birthdate=contact.tmpbirthdate;
			//if(contact.tmpregisterdate)
				contact.registerdate=contact.tmpregisterdate;
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
		$scope.initMenuCustomers = function(state)
		{
			$scope.selState=state;
			$scope.selectedContact=null;
		}
		$scope.selectedPanel = function(state){
			
			if($scope.selState==state)
				return "background_red";
			else
				return "";
			
		}
		
		
		///////ACCORDION////
		
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
		  acc[i].addEventListener("click", function() {
		    this.classList.toggle("active");
		    var panel = this.nextElementSibling;
		    if (panel.style.maxHeight){
		      panel.style.maxHeight = null;
		    } else {
		      panel.style.maxHeight = panel.scrollHeight + "px";
		    } 
		  });
		}

		////////
	  
});
