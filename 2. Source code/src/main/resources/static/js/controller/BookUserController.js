var app = angular.module('myApp');

app.controller('BookUserController', function($scope, $http, $routeParams, productService) {
	
	var size=8;
	$scope.addCart= function (x)
	{
		var newObj ={
				id:x,
				valuable:1
		};
		productService.addProduct(newObj);
	}
	getData();
	function getData() { 
		$http({
			method: 'get',
			url: "http://localhost:9000/LMS/book/findAll?page=0&size="+size
		}).success(function(data, status, headers, config){
			$scope.books = data.content;
			$scope.currentPage = 1;
			$scope.totalPages = data.totalPages;
			if(data.totalElements > size){
				$scope.pagingShow=true;
			}
		})
		.error(function(data, status, headers, config){});
	}

	//Start Paging
	$scope.incPaging = function(currentPage){
		if(currentPage == $scope.totalPages){
			
		}else{
			pageNumb = parseInt(currentPage)+1;
			$scope.currentPage = pageNumb;	
			$http({
				method: 'get',
				url: "http://localhost:9000/LMS/book/findAll?page="+(pageNumb-1)+"&size="+size
			}).success(function(data, status, headers, config){
				$scope.books = data.content;			
			})
			.error(function(data, status, headers, config){});
		}	
	}
	
	$scope.desPaging = function(currentPage){
		if(currentPage == 1){
			
		}else{
			pageNumb = parseInt(currentPage)-1;
			$scope.currentPage = pageNumb;	
			$http({
				method: 'get',
				url: "http://localhost:9000/LMS/book/findAll?page="+(pageNumb-1)+"&size="+size
			}).success(function(data, status, headers, config){
				$scope.books = data.content;			
			})
			.error(function(data, status, headers, config){});
		}		
	}
	//end Paging

});
