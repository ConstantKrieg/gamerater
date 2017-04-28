var reviewApp = angular.module('reviewApp', []);

reviewApp.controller('ReviewController', function($scope, $http){

    $http.get('reviews.json').success( function (data, status, headers, config) {
        $scope.reviews = data;
      });
});


reviewApp.controller('SingleReviewController', function($scope, $http){

    
    var id = document.getElementById("reviewId").innerText;
    var url = id + '.json';
    $scope.formVisible = false;

    $http.get(url).success( function (data, status, headers, config) {
        console.log(data);
        $scope.review = data;
      });

    $scope.submitComment = function(){
        $scope.comment.review_id = id;
        console.log($scope.comment);  
        $http.post('/comments.json', $scope.comment).success(function(data,status,headers,config) {
            console.log(data);  
            $scope.review.comments.push(data);
      });
    }  
});


