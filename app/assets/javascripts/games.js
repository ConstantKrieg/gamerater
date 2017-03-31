
var gameApp = angular.module("gameApp", []);

gameApp.controller("gameController", function($scope, $http){

    $http.get("games.json").success(function(data,status,headers,config){
        $scope.games = data;
    });
});


gameApp.controller("newGameController", function($scope, $http){

    $http.get("/publishers.json").success(function(data,status,headers, config){
        $scope.publishers = data;
    });

    $http.get("/platforms.json").success(function(data,status,headers, config){
        console.log(data);
        $scope.platforms = data;
    });

    $http.get("/genres.json").success(function(data,status,headers, config){
        $scope.genres = data;
    });

    $scope.addGame = function(){
        $http.post("/games.json", $scope.game).success(function(data, status, headers, config){
            $scope.game = {};
        });

    }


});

