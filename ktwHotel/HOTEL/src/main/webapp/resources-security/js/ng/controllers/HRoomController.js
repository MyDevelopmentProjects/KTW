angular.module('app').controller('HRoomController',
    ['$scope', '$http', 'GridManager', 'ModalManager', 'FileUploader',
        function ($scope, $http, GridManager, ModalManager, FileUploader) {

            angular.extend($scope, {
                url: 'rooms/list',
                saveURL: 'rooms/put',
                deleteURL: 'rooms/delete',
                init: {},
                countries: [],
                options: {
                    height: 300,
                    toolbar: [
                        ['edit', ['undo', 'redo']],
                        ['headline', ['style']],
                        ['style', ['bold', 'italic', 'underline', 'superscript', 'subscript', 'strikethrough', 'clear']],
                        ['fontface', ['fontname']],
                        ['fontclr', ['color']],
                        ['alignment', ['ul', 'ol', 'paragraph', 'lineheight']],
                        ['height', ['height']],
                        ['table', ['table']],
                        ['insert', ['link', 'picture', 'video', 'hr']],
                        ['view', ['fullscreen', 'codeview']],
                        ['help', ['help']]
                    ]
                },
            });

            GridManager.givePowerTo($scope);
            ModalManager.enableModals($scope);
            $scope.AmfTable.openPage(0);

            $scope.showAddEdit = function (item) {
                $scope.init.action = item ? 'რედაქტირება' : 'დამატება';
                $scope.object = {};
                $scope.fileArr = [];
                imageUploaderMultiple.queue = [];
                $scope.uploadQuantity = 0;
                $(".uplMult").val('').clone(true);
                if (item) {
                    if (item.images !== null && item.images !== "") {
                        $scope.fileArr = JSON.parse(item.images)
                    }
                    $scope.object = angular.copy(item);
                }
                setTimeout(function () {
                    $('.gallery-img').hover(
                        function () {
                            $(this).find('.overbox').show();
                        },
                        function () {
                            $(this).find('.overbox').hide();
                        }
                    );
                }, 500);
                $('#showAddEdit').modal('show');
            };

            $scope.saveLazy = function () {
                var objectCopy = angular.copy($scope.object);
                objectCopy.images = JSON.stringify($scope.fileArr);
                $http.post($scope.saveURL, objectCopy).success(function (response) {
                    if (!response.success) {
                        return;
                    }
                    $scope.showSuccessAlert("Success");
                    $scope.AmfTable.reloadData(true);
                    $('#showAddEdit').modal('hide');
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

            $scope.delete = function (itemId) {
                $http.post($scope.deleteURL, itemId).success(function (data) {
                    if (!data.success) {
                        if (response.errorMessage === "RECORD_IS_USED_IN_OTHER_TABLES") {
                            $scope.showErrorModal("მოცემული ჩანაწერის წაშლა შეუძლებელია რადგან ის ფიქსირდება სხვა ცხრილშიც.")
                        }
                        return;
                    }
                    $scope.AmfTable.reloadData(true);
                    location.reload()
                });
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