angular.module('app').controller('GMainVideoController',
    ['$scope', '$http', 'GridManager', 'ModalManager','FileUploader', function ($scope, $http, GridManager, ModalManager,FileUploader) {

        angular.extend($scope, {
            url:'main-video/first',
            saveURL:'main-video/put',
            uploadPath:"/upload/files/",
            init:{},
            options:{
                height: 300,
                toolbar: [
                    ['edit',['undo','redo']],
                    ['headline', ['style']],
                    ['style', ['bold', 'italic', 'underline', 'superscript', 'subscript', 'strikethrough', 'clear']],
                    ['fontface', ['fontname']],
                    ['textsize', ['fontsize']],
                    ['fontclr', ['color']],
                    ['alignment', ['ul', 'ol', 'paragraph', 'lineheight']],
                    ['height', ['height']],
                    ['table', ['table']],
                    ['insert', ['link','picture','video','hr']],
                    ['view', ['fullscreen', 'codeview']],
                    ['help', ['help']]
                ]
            }
        });

        ModalManager.enableModals($scope);

        $scope.loadMainVido = function(){
            $scope.object = {};
            $http.post($scope.url).success(function (data) {
                if(data.id != undefined){
                    $scope.object = data;
                }
            });
        };

        $scope.save = function () {
            if($scope.uploader.queue.length > 0){
                $scope.uploader.uploadAll();
            } else {
                if($scope.object.image === undefined || $scope.object.image == null){
                    $scope.showErrorModal("Please upload image.");
                    return
                }
                $scope.saveLazy();
            }
        };

        $scope.saveLazy = function () {
            var copyObject = angular.copy($scope.object);
            $http.post($scope.saveURL, copyObject).success(function (data) {
                if (!data.success) {
                    return;
                }
                $scope.showSuccessAlert("Success");
                $scope.loadMainVido();
            });
        };

        $scope.loadMainVido();


        var AboutUploader = $scope.uploader = new FileUploader({
            url: 'upload/file'
        });

        // CALLBACKS
        AboutUploader.onBeforeUploadItem = function(item) {
            item.formData.push({type: 'GENERAL'});
        };

        AboutUploader.onCompleteItem = function(fileItem, response, status, headers) {
            if(response.success){
                if(response.source.length > 0){
                    $scope.object.image = response.source[0];
                }
            }
        };

        AboutUploader.onCompleteAll = function() {
            $("input[type='file']").val('').clone(true);
            $scope.saveLazy();
        };

        $('#showAddEdit').on("hidden.bs.modal", function(){
            AboutUploader.queue = [];
            // Clear File Input
            $("input[type='file']").val('').clone(true);
        });


    }]);
