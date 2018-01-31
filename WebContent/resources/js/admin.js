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

appAdmin.controller("programsController",function($scope, $http, $location, $window){
	
	
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
			   
			   }, function myError(response) {
			 
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");

			   });
			 
		};
		
		$scope.getEntries = function (program) {

			 $http({
			       method : "GET",
			       url : "programs/"+program.id+"/entries"
			   }).then(function mySuccess(response) {
				   $scope.selectedProgram.entries=response.data;
			   }, function myError(response) {
			 
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.");

			   });
			 
		};
		
});
