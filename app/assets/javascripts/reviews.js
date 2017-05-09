var reviewApp = angular.module('reviewApp', []);

reviewApp.controller('ReviewController', function($scope, $http){

    $scope.propertyName = 'score';

    $http.get('reviews.json').success( function (data, status, headers, config) {
        $scope.reviews = data;
      });

      $scope.sortBy = function(propertyName) {
         $scope.reverse = ($scope.propertyName === propertyName) ? !$scope.reverse : false;
         $scope.propertyName = propertyName;
  };
});


reviewApp.controller('SingleReviewController', function($scope, $http){

    
    var id = document.getElementById("reviewId").innerText;
    var url = id + '.json';
    var userId = document.getElementById("userId").innerText;
    $scope.formVisible = false;



    $http.get(url).success( function (data, status, headers, config) {
        console.log(data);
        $scope.review = data;
      });

    $scope.submitComment = function(){
        $scope.comment.review_id = id;
        $scope.comment.user_id = userId;
        console.log($scope.comment);  
        $http.post('/comments.json', $scope.comment).success(function(data,status,headers,config) {
            console.log(data);  
            $scope.review.comments.push(data);
            document.getElementById("commentArea").value = "";
      });
    }  
});


