angular.module('app').controller('UserController',
    ['$scope', '$http', 'GridManager', 'ModalManager','FileUploader', function ($scope, $http, GridManager, ModalManager, FileUploader) {

        angular.extend($scope, {
            url:'user/list',
            saveURL:'user/put',
            deleteURL:'user/delete',
            roleURL: 'role/list',
            imageUploaded: false,
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
            $scope.sendSave();
        };

        $scope.sendSave = function () {
            var userCopy = angular.copy($scope.object);

            if(userCopy.newpassword && userCopy.newpassword.length >= 8){
                userCopy.password = userCopy.newpassword;
                delete userCopy.newpassword;
                delete userCopy.verifynewpassword;
            }
            delete userCopy.verify_password;

            $http.post($scope.saveURL, userCopy).success(function (data) {
                if (!data.success) {
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

        $scope.loadRoles = function(){
            $http.get($scope.roleURL).success(function(response){
                $scope.role_list = response.results;
            });
        };

        $scope.createFabMenuItems = function () {
            setTimeout(function () {
                var add = $scope.showAddEdit;
                var scope = angular.element($(".fabmenu")).scope();
                scope.$apply(function () {
                    scope.app.fabScope = $scope;
                    $scope.fabMenuItems = scope.app.fabMenuItems = [
                        {
                            callback: add,
                            "fa": "plus",
                            "title": "დამატება"
                        }
                    ];
                });
            }, 2000);
        };

        $scope.loadRoles();
        $scope.createFabMenuItems();
    }]);
