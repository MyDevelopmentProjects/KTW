angular.module('app').controller('HConferenceController',
    ['$scope', '$http', 'GridManager', 'ModalManager', 'FileUploader',
    function ($scope, $http, GridManager, ModalManager, FileUploader) {

        angular.extend($scope, {
            url:'conference/id',
            saveURL:'conference/put',
            init:{},
            countries: []
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
            var objectCopy = angular.copy($scope.data);
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
            if($scope.uploader.queue.length > 0){
                $scope.uploader.uploadAll();
            } else {
                if($scope.data.image === undefined || $scope.data.image === null){
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
                    $scope.data.image = response.source[0];
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