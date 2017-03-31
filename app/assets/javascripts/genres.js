var genreApp = angular.module("GenreApp", []);

var url = 'genres.json';

genreApp.controller("genreController", function($scope,$http) {
    $http.get(url).success(function(data, status, headers, config) {
        $scope.genres = data;
    });

    $scope.addGenre = function(){
        $http.post(url, $scope.genre).success(function(data, status, headers, config) {
            $scope.genres.push(data);
        });
    }

})