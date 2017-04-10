var myApp = angular.module('publisherApp', []);


  myApp.config(function($httpProvider) {
    $httpProvider.defaults.useXDomain = true;
    delete $httpProvider.defaults.headers.common['X-Requested-With'];
});

 
  myApp.controller("PublisherController", function($scope, $window, $http) {
      

      $scope.formVisible = false;

      $http.get('publishers.json').success( function (data, status, headers, config) {
        $scope.publishers = data;
      });
      
      $scope.addPublisher = function() {
          $http.post('publishers.json', $scope.publisher).success(function(data,status,headers,config) {
            console.log(data);  
            $scope.publishers.push(data);
      });

          $scope.formVisible = false;
          $scope.publisher = {};
      }

    });


    
  
