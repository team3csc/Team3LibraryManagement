var app = angular.module('myApp');

app.controller('cartController', function($scope, $http, $routeParams,
		productService) {
	$scope.bookCarts = [];
	$scope.products = productService.getProducts();
	//console.log($scope.products);
	getCartInfor();
	//console.log($scope.bookCarts);
	$scope.removeCart = function(x) {
		$scope.bookCarts.splice(x, 1);
		$scope.products.splice(x, 1);
	}
	$scope.cancelTicket = function() {
		var len = $scope.products.length;
		$scope.bookCarts.splice(0, len);
		$scope.products.splice(0, len);

	}
	$scope.addNumberTicket = function(x, id) {
		var temp =$scope.bookCarts[x].amount - $scope.bookCarts[x].brwTcktNber;
		if($scope.bookCarts[x].valuable == temp ){
			$scope.bookCarts[x].valuable = temp;
		}
		else {
		$scope.bookCarts[x].valuable += 1;
		}
		//console.log(id);
		//console.log($scope.bookCarts[x].valuable);
		productService.updateNumProducts(id,$scope.bookCarts[x].valuable)
	}
	$scope.subNumberTicket = function(x,id) {
		if($scope.bookCarts[x].valuable ==0){
			$scope.bookCarts[x].valuable=0;
		}
		else {
		$scope.bookCarts[x].valuable -= 1;
		}
		productService.updateNumProducts(id,$scope.bookCarts[x].valuable)
	}
	$scope.orderByMe = function(x) {
		$scope.myOrderBy = x;
	}
	$scope.AddTicket= function(){
		var num= getNumBorrow();
		$scope.ticket={
				"borrowNumber": num,
				"borrowedDate": "2017-03-16",
				"userInfo": {
			    	"userId": 1
				},
				"books":$scope.bookCarts	
		}
		console.log($scope.ticket)
		$http.post("http://localhost:9000/LMS/ticket/add",$scope.ticket)
		.success(function(data, status, headers, config){
			//alert("Add user success!!");
			
		})
		.error(function(data, status, headers, config){
			//alert("Add user error!!");

		});
	}
	function getNumBorrow(){
		var len = $scope.bookCarts.length;
		var num=0;
		for (var i = 0; i < len; i++) {
			num+= $scope.bookCarts[i].valuable;
		}
		return num;
	}
	function getCartInfor() {
		var len = $scope.products.length;
		for (var i = 0; i < len; i++) {
			var index = $scope.products[i].id;
			getData(index, $scope.products[i].valuable);
		}
	}
		
	function getData(x,num) {
		$http({
			method : 'get',
			url : "http://localhost:9000/LMS/book/get/" + x
		}).success(function(data, status, headers, config) {
			data.valuable = num;
			$scope.bookCarts.push(data);
		}).error(function(data, status, headers, config) {
		});
	}
});
