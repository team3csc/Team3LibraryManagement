var app = angular.module('myAdmin');
app.controller("UserController", function($scope, $http){
		
	var size = 10;
	
	$scope.AddUser = function(){
		$scope.user = {
			"address": $scope.user.address,
			"degree": $scope.user.degree,	
			"email": $scope.user.email,
			"job": $scope.user.job,
			"phoneNumber": $scope.user.phone,
			"pword": "test",
			"realName": $scope.user.name,
			"sex": $scope.user.gender,
			"valid": "true",
			"dayOfBirth":$scope.user.dayOfBirth,
		};
			$http.post("http://localhost:9000/LMS/userInfo/add",$scope.user)
			.success(function(data, status, headers, config){
				//alert("Add user success!!");
				
			})
			.error(function(data, status, headers, config){
				//alert("Add user error!!");

			});
		
	}
	$scope.removeUser = function(x){
		//$scope.users.splice(x, 1);
		$http({
			method: 'get',
			url: "http://localhost:9000/LMS/userInfo/remove/"+x
		}).success(function(data, status, headers, config){
			$scope.users = data;
			getData();
		})
		.error(function(data, status, headers, config){
			getData();
		});
		
	}
	$scope.orderByMe = function(x){
		$scope.myOrderBy = x;
	}


	function getData() { 
		$http({
			method: 'get',
			url: "http://localhost:9000/LMS/userInfo/findAll?page=0&size="+size
		}).success(function(data, status, headers, config){
			$scope.users = data.content;
			$scope.currentPage = 1;
			$scope.totalPages = data.totalPages;
			if(data.totalElements > size){
				$scope.pagingShow=true;
			}
		})
		.error(function(data, status, headers, config){});
	}
	getData();
	
	//Start Paging
	$scope.incPaging = function(currentPage){
		if(currentPage == $scope.totalPages){
			
		}else{
			pageNumb = parseInt(currentPage)+1;
			$scope.currentPage = pageNumb;	
			$http({
				method: 'get',
				url: "http://localhost:9000/LMS/userInfo/findAll?page="+(pageNumb-1)+"&size="+size
			}).success(function(data, status, headers, config){
				$scope.users = data.content;			
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
				url: "http://localhost:9000/LMS/userInfo/findAll?page="+(pageNumb-1)+"&size="+size
			}).success(function(data, status, headers, config){
				$scope.users = data.content;			
			})
			.error(function(data, status, headers, config){});
		}		
	}
	//end Paging
})