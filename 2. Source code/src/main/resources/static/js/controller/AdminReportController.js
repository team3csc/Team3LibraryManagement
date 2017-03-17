var app = angular.module('myAdmin');


app.controller('AdminReportController', function($http, $scope, $routeParams, $q) {

	
	$scope.dataReport = function(){
		var deferred = $q.defer();
		$http({
			method: 'get',
			url: "http://localhost:9000/LMS/ticket/quantity"
		}).success(function(data, status, headers, config){			
			deferred.resolve(data);
		})
		.error(function(data, status, headers, config){});
		return deferred.promise;
	}		
	
//	$scope.ticketReport = getData();	
//	var url = "http://localhost:9000/LMS/ticket/quantity";
//	$scope.ticketReport = function (url) {
//		var data = "";
//		var deferred = $q.defer();
//
//		$http.get(url)
//		    .success( function(response, status, headers, config) {
//		         deferred.resolve(response);
//		    })
//		    .error(function(errResp) {
//		         deferred.reject({ message: "Really bad" });
//		    });
//		return deferred.promise;
//		}
	$scope.ticketData = {
		     ticketModel: null,
		     ticketOptions: [
		       {id: 'ticketReportByWeek', name: 'Weekly'},
		       {id: 'ticketReportByMonth', name: 'Monthly'},
		       {id: 'ticketReportByYear', name: 'Yearly'}
		     ]
		    };
	$scope.incomeData = {
		     incomeModel: null,
		     incomeOptions: [
		       {id: 'incomeReportByWeek', name: 'Weekly'},
		       {id: 'incomeReportByMonth', name: 'Monthly'},
		       {id: 'incomeReportByYear', name: 'Yearly'}
		     ]
		    };	 	 		
	
	$scope.ticketReport = $scope.dataReport();

// 	$scope.incomeReport = incomeReport; 	 	
	
 	$scope.changeTicketReportType = function(){
 		var type = $scope.ticketData.ticketModel; 		
 		if(angular.equals(type, "ticketReportByMonth")) {
// 			$http({
// 				method: 'get',
// 				url: "http://localhost:9000/LMS/ticket/quantity"
// 			}).success(function(data, status, headers, config){			
// 				$scope.ticketReport = data;
// 			})
// 			.error(function(data, status, headers, config){});
 			$scope.ticketReport = ticketReportByMonth;
 		}else if(angular.equals(type, "ticketReportByWeek")){
 			$scope.ticketReport = ticketReportByWeek;
 		}else if(angular.equals(type, "ticketReportByYear")){
 			$scope.ticketReport = ticketReportByYear;
 		}
 	}
 	$scope.changeIncomeReportType = function(){ 		
 		var type = $scope.incomeData.incomeModel; 		
 		if(angular.equals(type, "incomeReportByMonth")) {
 			$scope.incomeReport = ticketReportByMonth;
 		}else if(angular.equals(type, "incomeReportByWeek")){
 			$scope.incomeReport = ticketReportByWeek;
 		}else if(angular.equals(type, "incomeReportByYear")){
 			$scope.incomeReport = ticketReportByYear;
 		}
 	}
});

//data test
var ticketReportByYear = {
		   chart: {
//		       caption: "Borrowing Ticket by Month's 2017",
//		       subCaption: "Top 5 stores in last month by revenue",
		       xAxisName: "Month",
		       yAxisName: "Number of tickets", 	
		       paletteColors: "#0075c2",
//		       numberPrefix: "Ticket ",
//		       theme: "ocean"
		   },
		   data:[{
		       label: "Jan",
		       value: "880000"
		   },		   
		   {
		       label: "Dec",
		       value: "330000"
		   }]
		}

//data test
var ticketReportByWeek = {
		   chart: {
//		       caption: "Borrowing Ticket by Month's 2017",
//		       subCaption: "Top 5 stores in last month by revenue",
		       xAxisName: "Month",
		       yAxisName: "Number of tickets", 	
		       paletteColors: "#0075c2",
//		       numberPrefix: "Ticket ",
//		       theme: "ocean"
		   },
		   data:[{
		       label: "Jan",
		       value: "880000"
		   },
		   {
		       label: "Feb",
		       value: "730000"
		   },
		   {
		       label: "Mar",
		       value: "590000"
		   },
		   {
		       label: "Dec",
		       value: "330000"
		   }]
		}

//data test
var ticketReportByMonth = {
		   chart: {
//		       caption: "Borrowing Ticket by Month's 2017",
//		       subCaption: "Top 5 stores in last month by revenue",
		       xAxisName: "Month",
		       yAxisName: "Number of tickets", 	
		       paletteColors: "#0075c2",
//		       numberPrefix: "Ticket ",
//		       theme: "ocean"
		   },
		   data:[{
		       label: "Jan",
		       value: "880000"
		   },
		   {
		       label: "Feb",
		       value: "730000"
		   },
		   {
		       label: "Mar",
		       value: "590000"
		   },
		   {
		       label: "Apr",
		       value: "520000"
		   },
		  {
		       label: "May",
		       value: "520000"
		   },
		  {
		       label: "Jun",
		       value: "980000"
		   },
		  {
		       label: "Jul",
		       value: "520000"
		   },
		  {
		       label: "Aug",
		       value: "520000"
		   },
		  {
		       label: "Sep",
		       value: "520000"
		   },
		  {
		       label: "Oct",
		       value: "520000"
		   },
		  {
		       label: "Nov",
		       value: "520000"
		   },
		   {
		       label: "Dec",
		       value: "330000"
		   }]
		}  


var incomeReport = {
		   chart: {
//		       caption: "Income by Month's 2017",
//		       subCaption: "Top 5 stores in last month by revenue",
		       numberPrefix: "$",
		       xAxisName: "Month",
		       paletteColors: "#0075c2",
	       yAxisName: "VND",
//		       theme: "ocean"
		   },
		   data:[{
		       label: "Jan",
		       value: "880000"
		   },
		   {
		       label: "Feb",
		       value: "730000"
		   },
		   {
		       label: "Mar",
		       value: "590000"
		   },
		   {
		       label: "Apr",
		       value: "520000"
		   },
		  {
		       label: "May",
		       value: "520000"
		   },
		  {
		       label: "Jun",
		       value: "980000"
		   },
		  {
		       label: "Jul",
		       value: "520000"
		   },
		  {
		       label: "Aug",
		       value: "520000"
		   },
		  {
		       label: "Sep",
		       value: "520000"
		   },
		  {
		       label: "Oct",
		       value: "520000"
		   },
		  {
		       label: "Nov",
		       value: "520000"
		   },
		   {
		       label: "Dec",
		       value: "330000"
		   }]
		} 