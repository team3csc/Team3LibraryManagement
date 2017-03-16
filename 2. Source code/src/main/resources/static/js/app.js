var app = angular.module('myApp', [ 'ngRoute', 'ngResource' ]);
app.config(function($routeProvider) {
	$routeProvider.when('/', {
		templateUrl : '/LMS/views/home.html',
		controller : 'MainController'
	}).when('/register', {
		templateUrl : '/LMS/views/registration.html',
		controller : 'registerController'
	}).when('/main', {
		templateUrl : '/LMS/views/main.html',
		controller : 'MainController'
	}).when('/book', {
		templateUrl : '/LMS/views/book.html',
		controller : 'BookUserController'
	}).when('/search/:id', {
		templateUrl : '/LMS/views/searchBook.html',
		controller : 'searchController'
	}).when('/book/bookdetail', {
		templateUrl : '/LMS/views/bookdetail.html',
		controller : 'bookDetailController'
	}).when('/book/bookdetail/:id', {
		templateUrl : '/LMS/views/bookdetail.html',
		controller : 'bookDetailController'
	}).when('/author', {
		templateUrl : '/LMS/views/author.html',
		controller : 'MainController'
	}).when('/user', {
		templateUrl : '/LMS/views/user.html',
		controller : 'MainController'
	}).when('/user/updateuser', {
		templateUrl : '/LMS/views/admin/update_user.html',
		controller : 'userDetailCtr'
	}).when('/cart', {
		templateUrl : '/LMS/views/cart.html',
		controller : 'cartController'
	}).otherwise({
		redirectTo : '/'
	}

	);
});
app.service('productService', function() {
	var productList = [];

	var addProduct = function(newObj) {
		var count = 0;
		for (var i = 0; i < productList.length; i++) {
			if (productList[i].id == newObj.id) {
				productList[i].valuable += 1;
				break;
			}
			count++;
		}
		if (count == productList.length) {
			productList.push(newObj);
		}
	};

	var getProducts = function() {
		return productList;
	};
	var updateNumProducts = function(x, y) {
		for (var i = 0; i < productList.length; i++) {
			if (productList[i].id == x) {
				productList[i].valuable = y;
				break;
			}
		}
	};
	return {
		addProduct : addProduct,
		getProducts : getProducts,
		updateNumProducts : updateNumProducts
	};

});
