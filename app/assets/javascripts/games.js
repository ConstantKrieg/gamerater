
var gameApp = angular.module("gameApp", []);

gameApp.controller("gameController", function($scope, $http){


    $scope.formVisible = false;

    $http.get("games.json").success(function(data,status,headers,config){
        $scope.games = data;
    });
});







