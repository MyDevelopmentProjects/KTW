angular.module('app').controller('HRestaurantController',
    ['$scope', '$http', 'GridManager', 'ModalManager', 'FileUploader',
        function ($scope, $http, GridManager, ModalManager, FileUploader) {

            angular.extend($scope, {
                url: 'restaurant/id',
                saveURL: 'restaurant/put',
                init: {},
                countries: [],
                fileArr: [],
                uploadQuantity: 0
            });

            GridManager.givePowerTo($scope);
            ModalManager.enableModals($scope);
            $scope.AmfTable.openPage(0);

            $scope.showAddEdit = function (item) {
                $scope.init.action = item ? 'რედაქტირება' : 'დამატება';
                $scope.data = {};
                if (item) {
                    $scope.data = angular.copy(item);
                }
                $('#showAddEdit').modal('show');
            };

            $scope.saveLazy = function () {

                let objectCopy = angular.copy($scope.data);

                if ($scope.fileArr.length > 0) {
                    objectCopy.images = JSON.stringify($scope.fileArr);
                }

                $http.post($scope.saveURL, objectCopy).success(function (response) {
                    if (!response.success) {
                        return;
                    }
                    $scope.showSuccessAlert("Success");
                    $scope.AmfTable.reloadData(true);
                    $scope.uploaderMultiple.queue = [];
                    location.reload()
                });
            };

            $scope.save = function () {
                if ($scope.uploaderMultiple.queue.length > 0) {
                    $scope.uploadQuantity++;
                    imageUploaderMultiple.uploadAll();
                } else {
                    $scope.saveLazy();
                }
            };


            var imageUploaderMultiple = $scope.uploaderMultiple = new FileUploader({
                url: 'upload/file'
            });

            imageUploaderMultiple.onBeforeUploadItem = function (item) {
                item.formData.push({type: 'GENERAL'});
            };

            imageUploaderMultiple.onCompleteItem = function (fileItem, response, status, headers) {
                if (response.success) {
                    if (response.source.length > 0) {
                        $scope.fileArr.push(response.source[0]);
                    }
                }
            };

            imageUploaderMultiple.onCompleteAll = function () {
                $(".uplMult").val('').clone(true);
                if ($scope.uploadQuantity - 1 === 0) {
                    $scope.saveLazy();
                } else {
                    $scope.uploadQuantity--
                }
            };

            $scope.removeImage = function (at) {
                $scope.fileArr.splice(at, 1);
            };

            $scope.AmfTable.doOnReload = function () {
                $scope.fileArr = [];
                imageUploaderMultiple.queue = [];
                $scope.uploadQuantity = 0;
                $(".uplMult").val('').clone(true);
                if ($scope.data) {
                    $scope.data = angular.copy($scope.data);
                    if ($scope.data.images !== null && $scope.data.images !== "") {
                        $scope.fileArr = JSON.parse($scope.data.images)
                    }
                }
                setTimeout(function () {
                    $('.gallery-img').hover(
                        function() {
                            $(this).find('.overbox').show();
                        },
                        function() {
                            $(this).find('.overbox').hide();
                        }
                    );
                }, 500);
            };


            $scope.createFabMenuItems = function () {
                setTimeout(function () {
                    var add = $scope.showAddEdit;
                    var scope = angular.element($(".fabmenu")).scope();
                    if (scope !== undefined) {
                        scope.$apply(function () {
                            scope.app.fabScope = $scope;
                            $scope.fabMenuItems = scope.app.fabMenuItems = [
                                {
                                    callback: add,
                                    "fa": "plus",
                                    "title": "Add"
                                }
                            ];
                        });
                    }
                }, 1000);
            };
            $scope.createFabMenuItems();

        }]);