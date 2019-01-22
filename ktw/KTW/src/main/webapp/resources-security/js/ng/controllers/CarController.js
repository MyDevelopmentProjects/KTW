/**
 * Created by Mikheil on 11/22/2017.
 */
angular.module('app').controller('CarController',
    ['$scope', '$http', 'GridManager', 'ModalManager', function ($scope, $http, GridManager, ModalManager) {

        angular.extend($scope, {
            url:'car/pagin',
            saveURL:'car/put',
            deleteURL:'car/delete',
            categoriesURL: 'category/list',
            init:{}
        });

        GridManager.givePowerTo($scope);
        ModalManager.enableModals($scope);
        $scope.AmfTable.openPage(0);

        $scope.showAddEdit = function (item) {
            $scope.init.action = item ? 'რედაქტირება' : 'დამატება';
            $scope.object = {};
            if (item) {
                $scope.object = angular.copy(item);
            }
            $('#showAddEdit').modal('show');
        };

        $scope.save = function () {
            var objectCopy = angular.copy($scope.object);
            $http.post($scope.saveURL, objectCopy).success(function (data) {
                if (!data.success) {
                    if(data.message === "RECORD_IS_USED_IN_OTHER_TABLES"){
                        $scope.showErrorModal("მოცემული ჩანაწერის წაშლა შეუძლებელია რადგან ის ფიქსირდება სხვა ცხრილშიც.")
                    }
                    return;
                }
                $scope.showSuccessAlert("Success");
                $scope.AmfTable.reloadData(true);
                $('#showAddEdit').modal('hide');
            });
        };


        $scope.delete = function (itemId) {
            $http.post($scope.deleteURL, itemId).
            success(function (data) {
                if (!data.success) {
                    if(response.message === "RECORD_IS_USED_IN_OTHER_TABLES"){
                        $scope.showErrorModal("მოცემული ჩანაწერის წაშლა შეუძლებელია რადგან ის ფიქსირდება სხვა ცხრილშიც.")
                    }
                    return;
                }
                $scope.AmfTable.reloadData(true);
            });
        };

        $scope.getListOfCategories = function () {
            $http.get($scope.categoriesURL).success(function (data) {
                $scope.categories = data.results;
            })
        };

        $scope.createFabMenuItems = function () {
            setTimeout(function () {
                var add = $scope.showAddEdit;
                var scope = angular.element($(".fabmenu")).scope();
                if(scope !== undefined){
                    scope.$apply(function () {
                        scope.app.fabScope = $scope;
                        $scope.fabMenuItems = scope.app.fabMenuItems = [];
                    });
                }
            }, 1000);
        };

        $scope.getListOfCategories();
        $scope.createFabMenuItems();

    }]);
