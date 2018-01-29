var appAdmin = angular.module("appAdmin", ["ngRoute",'ngMaterial', 'ngMessages', 'material.svgAssetsCache']);

appAdmin.config(function($routeProvider) {
    $routeProvider

    .when("/admincategories", {
        templateUrl : "admincategories",
        controller: "categoriesController"

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
			       alert("Κάτι δεν πήγε καλά. Ξαναπροσπαθήστε.")
			   });
			 
		};
});