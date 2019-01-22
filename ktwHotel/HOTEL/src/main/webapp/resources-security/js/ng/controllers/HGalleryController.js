angular.module('app').controller('HGalleryController',
    ['$scope', '$http', 'GridManager', 'ModalManager', 'FileUploader', '$sce',
    function ($scope, $http, GridManager, ModalManager, FileUploader, $sce) {

        angular.extend($scope, {
            url:'gallery/list?pageSize=-255',
            saveURL:'gallery/put',
            deleteURL:'gallery/delete',
            init:{},
            object: {},
            countries: []
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

        $scope.trustSrc = function(src) {
            return $sce.trustAsResourceUrl(src);
        }

        $scope.AmfTable.doOnReload = function () {
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

        $scope.saveLazy = function () {
            var objectCopy = angular.copy($scope.object);
            $http.post($scope.saveURL, objectCopy).success(function (response) {
                if (!response.success) {
                    return;
                }
                $scope.showSuccessAlert("Success");
                $scope.AmfTable.reloadData(true);
                $scope.uploader.queue = [];
                $('#showAddEdit').modal('hide');
            });
        };

        $scope.save = function () {

            if ($scope.object && $scope.object.videoUrl) {
                $scope.saveLazy();
                return
            }
            $scope.object = {};
            if($scope.uploader.queue.length > 0){
                $scope.uploader.uploadAll();
            } else {
                if($scope.object.image === undefined || $scope.object.image === null){
                    $scope.showErrorModal("Please upload image.");
                    return
                }
                $scope.saveLazy();
            }
        };


        var galleryUploader = $scope.uploader = new FileUploader({
            url: 'upload/file'
        });

        // CALLBACKS
        galleryUploader.onBeforeUploadItem = function(item) {
            item.formData.push({type: 'GENERAL'});
        };

        galleryUploader.onCompleteItem = function(fileItem, response, status, headers) {
            if(response.success){
                if(response.source.length > 0){
                    $scope.object.image = response.source[0];
                }
            }
        };

        galleryUploader.onCompleteAll = function() {
            $("input[type='file']").val('').clone(true);
            $scope.saveLazy();
        };

        $('#showAddEdit').on("hidden.bs.modal", function(){
            galleryUploader.queue = [];
            // Clear File Input
            $("input[type='file']").val('').clone(true);
        });

        
        
        $scope.delete = function (itemId) {
            $http.post($scope.deleteURL, itemId).
            success(function (data) {
                $scope.object = {};
                if (!data.success) {
                    if(response.errorMessage === "RECORD_IS_USED_IN_OTHER_TABLES"){
                        $scope.showErrorModal("მოცემული ჩანაწერის წაშლა შეუძლებელია რადგან ის ფიქსირდება სხვა ცხრილშიც.")
                    }
                    return;
                }
                $scope.AmfTable.reloadData(true);
            });
        };

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
                                "title": "Add"
                            }
                        ];
                    });
                }
            }, 1000);
        };

        $scope.createFabMenuItems();

    }]);