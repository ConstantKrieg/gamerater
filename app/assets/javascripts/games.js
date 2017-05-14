
var gameApp = angular.module("gameApp", []);

gameApp.controller("gameController", function($scope, $http){


    $scope.formVisible = false;

    $http.get("/games.json").success(function(data,status,headers,config){
        $scope.games = data;
    });
});


gameApp.controller("singleGameController", function($scope, $http){


    var id = document.getElementById("gameId").innerText;
    var url = id + '.json';
    


    $http.get(url).success( function (data, status, headers, config) {
        console.log(data);
        $scope.game = data;
        $scope.platforms = $scope.game.platforms
        var total = 0;
        angular.forEach($scope.game.reviews, function(review){
            total += review.score;
        })

        $scope.avgScore = $scope.game.name + " has the average score of " + (total / $scope.game.reviews.length).toFixed(2) + " out of 10";

        if($scope.game.reviews.length === 0) {
            $scope.avgScore = "This game hasn't been reviewed yet";
        }

      });
});







