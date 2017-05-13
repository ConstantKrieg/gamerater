
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

        $scope.avgScore = (total / $scope.game.reviews.length).toFixed(2);

      });
});







