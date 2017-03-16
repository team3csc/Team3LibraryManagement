var app = angular.module('myApp');

app.controller('searchController', function($scope, $http, $routeParams, productService) {
	$scope.searchText=$routeParams.id;
	getData();
	function getData() { 
		$http({
			method: 'get',
			url: "http://localhost:9000/LMS/book/list"
		}).success(function(data, status, headers, config){
			$scope.books = data;

		})
		.error(function(data, status, headers, config){});
	}
	
	$scope.addCart= function (x)
	{
		var newObj ={
				id:x,
				valuable:1
		}
		productService.addProduct(newObj);
	}

});