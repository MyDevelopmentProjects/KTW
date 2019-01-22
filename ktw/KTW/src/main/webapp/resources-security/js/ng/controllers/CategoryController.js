/**
 * Created by Mikheil on 11/22/2017.
 */
angular.module('app').controller('CategoryController',
    ['$scope', '$http', 'GridManager', 'ModalManager', 'FileUploader', function ($scope, $http, GridManager, ModalManager, FileUploader) {

        angular.extend($scope, {
            url:'categoryList',
            saveURL:'categoryPut',
            deleteURL:'category/delete',
            init:{},
            fileArr: [],
            uploadQuantity: 0
        });

        GridManager.givePowerTo($scope);
        ModalManager.enableModals($scope);
        $scope.AmfTable.openPage(0);

        $scope.showAddEdit = function (item) {
            $scope.init.action = item ? 'რედაქტირება' : 'დამატება';
            $scope.object = {};
            $scope.fileArr = [];
            if (item) {
                $scope.object = angular.copy(item);
                if ($scope.object.image !== null &&
                    $scope.object.image !== "" &&
                    $scope.object.image !== undefined) {
                    $scope.fileArr.push($scope.object.image)
                }

                if ($scope.object.images !== null &&
                    $scope.object.images !== "" &&
                    $scope.object.images !== undefined) {
                    JSON.parse($scope.object.images).forEach(function (t) {
                        $scope.fileArr.push(t)
                    })

                }
            }
            $('#showAddEdit').modal('show');
        };

        $scope.sendSave = function () {
            var objectCopy = angular.copy($scope.object);

            if($scope.fileArr.length > 0) {

                if ($scope.fileArr.length === 1) {
                    objectCopy.image = $scope.fileArr[0]
                }
                if ($scope.fileArr.length > 1) {
                    objectCopy.image = $scope.fileArr[0]
                    objectCopy.images = JSON.stringify($scope.fileArr.splice(1, $scope.fileArr.length - 1))
                }
            } else {
                objectCopy.image = ""
                objectCopy.images = ""
            }

            $http.post($scope.saveURL, objectCopy).success(function (data) {
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

        $scope.save = function () {
            if ($scope.uploaderMultiple.queue.length === 0) {
                $scope.sendSave();
            } else {
                $scope.saveLazyMult();
            }
        };


        var imageUploaderMultiple = $scope.uploaderMultiple = new FileUploader({
            url: 'upload/file'
        });

        imageUploaderMultiple.onBeforeUploadItem = function(item) {
            item.formData.push({type: 'GENERAL'});
        };

        imageUploaderMultiple.onCompleteItem = function(fileItem, response, status, headers) {
            if(response.success){
                if(response.source.length > 0){
                    $scope.fileArr.push(response.source[0]);
                }
            }
        };

        imageUploaderMultiple.onCompleteAll = function() {
            $(".uplMult").val('').clone(true);
            if ($scope.uploadQuantity - 1 === 0) {
                $scope.sendSave();
            } else {
                $scope.uploadQuantity--
            }
        };

        $scope.saveLazyMult = function () {
            if($scope.uploaderMultiple.queue.length > 0){
                $scope.uploadQuantity++;
                imageUploaderMultiple.uploadAll();
            }
        };

        $scope.removeFile = function(at) {
            $scope.fileArr.splice(at, 1);
        };

        $('#showAddEdit').on("hidden.bs.modal", function() {
            imageUploaderMultiple.queue = [];
            $scope.uploadQuantity = 0;
            $(".uplMult").val('').clone(true);
        });



        $scope.createFabMenuItems = function () {
            setTimeout(function () {
                var add = $scope.showAddEdit;
                var scope = angular.element($(".fabmenu")).scope();
                if(scope !== undefined){
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
                }
            }, 1000);
        };

        $scope.createFabMenuItems();

    }]);
