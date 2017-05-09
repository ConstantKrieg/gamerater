
var platformApp = angular.module('platformApp',[]);


platformApp.controller("platformController", function($scope, $http) {

    $http.get('platforms.json').success( function (data, status, headers, config) {
        $scope.platforms = data;
    });

    $scope.addPlatform = function() {
        $http.post('platforms.json', $scope.platform).success(function(data, status, headers, config) {
            $scope.platforms.push(data);
            $scope.platform = {};
        });

    }


});