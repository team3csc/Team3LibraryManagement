var app = angular.module('myApp');
app.controller('bookDetailController', function($scope,$http, $routeParams, productService) {
	$http({
		method: 'get',
		url: "http://localhost:9000/LMS/book/get/"+$routeParams.id
	}).success(function(data) {
		$scope.bookDetail=data;
		$scope.index=$scope.bookDetail.bookCategoryDetail.categoryId;
		$scope.isbn = data.isbn;
		getData();
	})
	function getData() { 
		$http({
			method: 'get',
			url: "http://localhost:9000/LMS/category/get/"+$scope.index
		}).success(function(dataBook){			
			$scope.bookRelation = dataBook;
			var cpisbn = dataBook.books[0].isbn;
			for(var i = 0; i< dataBook.books.length; i++){
				var crisbn = dataBook.books[i].isbn;
				if(angular.equals($scope.isbn, crisbn)){
					$scope.bookRelation.books.splice(i, 1);
				}
			}						
			
		})
		.error(function(data, status, headers, config){});
	}
	$scope.addCart= function (x)
	{
		var newObj ={
				id:x,
				valuable:1
		};
		productService.addProduct(newObj);
	}
});