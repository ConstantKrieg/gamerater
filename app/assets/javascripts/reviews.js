var reviewApp = angular.module('reviewApp', []);

reviewApp.controller('ReviewController', function($scope, $http){

    $http.get('reviews.json').success( function (data, status, headers, config) {
        $scope.reviews = data;
      });
});


reviewApp.controller('SingleReviewController', function($scope, $http){

    
    var id = document.getElementById("reviewId").innerText;
    var url = id + '.json';

    $http.get(url).success( function (data, status, headers, config) {
        $scope.review = data;
      });
});


