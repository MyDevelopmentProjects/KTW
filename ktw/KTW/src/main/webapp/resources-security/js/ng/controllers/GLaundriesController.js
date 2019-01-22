angular.module('app').controller('GLaundriesController',
    ['$scope', '$http', 'GridManager', 'ModalManager', 'FileUploader',
        function ($scope, $http, GridManager, ModalManager, FileUploader) {

            angular.extend($scope, {
                init: {},
                url: 'laundry/list?showsAll=true',
                saveURL: 'laundry/save',
                savePricesURL: 'laundry/savePrices',
                deleteURL: 'laundry/delete',
                categoriesURL: 'category/list',
                cityListURL: 'city/list',
                servicesListURL: 'laundry/services',
                districtListURL: 'city/district',
                districtByIdURL: 'city/districtById',
                fileArr: [],
                uploadQuantity: 0,
                categories: [],
                services: [],
                serviceModel: null
            });

            GridManager.givePowerTo($scope);
            ModalManager.enableModals($scope);

            $scope.AmfTable.sortBy("id", false);
            $scope.AmfTable.openPage(0);
            $scope.mustReload = false;
            $scope._services = [];
            $scope._outServ = [];

            $scope.showAddEdit = function (item) {
                $scope.services = [];
                $scope._outServ = [];
                $scope.init.action = item ? 'რედაქტირება' : 'დამატება';
                $scope.object = {};
                $scope.fileArr = [];
                $scope.district = {};
                if (item) {
                    $scope.object = angular.copy(item);
                    if ($scope.object.district) {
                        $scope.getDistrict($scope.object.district.id)
                    }
                }
                $scope.getListOfServices();
                $('#showAddEdit').modal('show');
            };

            $scope.showPricesAddEdit = function (item) {
                $scope.object = {};
                $scope.prices = [];
                if (item) {
                    $scope.object = angular.copy(item);
                    $scope.prices = $scope.object.prices;
                }

                $('#showPricesAddEdit').modal('show');

                setTimeout(function () {
                    $('.inpPrice').each(function (i, v) {
                        $(v).val($(v).attr('data-rec-value'))
                    });
                }, 300)
            };

            $scope.showImagesAddEdit = function (item) {
                $scope.object = {};
                $scope.fileArr = [];
                if (item) {
                    $scope.object = angular.copy(item);
                    if ($scope.object.images !== null && $scope.object.images !== "") {
                        $scope.fileArr = JSON.parse($scope.object.images)
                    }
                }
                $('#showImagesAddEdit').modal('show');
            };

            $scope.showMgtAddEdit = function (item) {
                $scope.object = {};
                $scope.mgt = [];
                if (item) {
                    $scope.object = angular.copy(item);
                    $http.get('/laundry-mgt/list?laundryId=' + item.id).success(function (resp) {
                        $scope.mgt = resp;
                    });
                }
                $('#showMgtAddEdit').modal('show');
            };

            $scope.addNewMgt = function () {
                $scope.mgt.push({
                    laundry: {id: $scope.object.id},
                    position: '',
                    fullName: '',
                    mNumber: '',
                    email: '',
                    receivesNotification: false
                })
            };

            $scope.delete = function (itemId) {
                $http.post($scope.deleteURL, itemId).success(function (data) {
                    if (!data.success) {
                        if (response.message == "RECORD_IS_USED_IN_OTHER_TABLES") {
                            $scope.showErrorModal("მოცემული ჩანაწერის წაშლა შეუძლებელია რადგან ის ფიქსირდება სხვა ცხრილშიც.")
                        }
                        return;
                    }
                    $scope.AmfTable.reloadData(true);
                });
            };

            $scope.deleteMgt = function (item, index) {
                if (!item.id) {
                    return
                }
                $http.post("/laundry-mgt/delete", item.id).success(function (data) {
                    if (!data.success) {
                        return;
                    }
                    $scope.showSuccessAlert("Success");
                    $scope.AmfTable.reloadData(true);
                    $('#showMgtAddEdit').modal('hide');
                });
            };

            $scope.saveMgt = function () {
                var objectCopy = angular.copy($scope.mgt);

                for (var i = 0; i < objectCopy.length; i++) {
                    objectCopy[i]['laundry'] = {id: $scope.object.id}
                }

                $http.post("/laundry-mgt/save", objectCopy).success(function (data) {
                    if (!data.success) {
                        return;
                    }
                    $scope.showSuccessAlert("Success");
                    $scope.AmfTable.reloadData(true);
                    $('#showMgtAddEdit').modal('hide');
                });
            };

            $scope.save = function () {
                var objectCopy = angular.copy($scope.object);
                if ($scope.fileArr.length > 0) {
                    objectCopy.images = JSON.stringify($scope.fileArr);
                }
                objectCopy.services = [];
                angular.forEach($scope._services, function (value, key) {
                    if (value.isSelected !== undefined && value.isSelected) {
                        objectCopy.services.push(
                            $scope.getService(parseInt(value.id))
                        );
                    }
                });

                if (!objectCopy.district || !objectCopy.district.id) {
                    alert("აირჩიეთ ქუჩა");
                    return;
                }

                $http.post($scope.saveURL, objectCopy).success(function (data) {
                    $scope.fileArr = [];
                    if ($scope.mustReload) {
                        location.reload();
                    } else {
                        $scope.showSuccessAlert("Success");
                        $scope.AmfTable.reloadData(true);
                        $('#showAddEdit').modal('hide');
                    }
                });
            };

            $scope.savePrices = function () {
                var objectCopy = angular.copy($scope.object);
                for (var i = 0; i < objectCopy.prices.length; i++) {
                    objectCopy.prices[i].prices = $scope.getPrice(objectCopy.prices)
                }

                var arr = [];
                $('.inpPrice').each(function (i, v) {
                    var id = $(v).attr('data-rec-id')
                    var obj = {
                        prices: $(v).val(),
                        laundry: {id: $scope.object.id},
                        category: {id: $(v).attr('data-cat-id')}
                    };
                    if (id) {
                        obj['id'] = id
                    }
                    arr.push(obj)
                });

                $http.post($scope.savePricesURL, arr).success(function (data) {
                    if (!data.success) {
                        return;
                    }
                    $scope.showSuccessAlert("Success");
                    $scope.AmfTable.reloadData(true);
                    $('#showPricesAddEdit').modal('hide');
                });
            };

            $scope.getListOfCities = function () {
                $http.get($scope.cityListURL).success(function (data) {
                    $scope.city_list = data.results;
                })
            };

            $scope.getListOfDistrict = function () {
                if (!$scope.district.city) return;
                $http.get($scope.districtListURL + "?cityId=" + $scope.district.city.id).success(function (data) {
                    $scope.districts = data.results;
                })
            };

            $scope.getDistrict = function (id) {
                $http.get($scope.districtByIdURL + "?id=" + id).success(function (data) {
                    $scope.district = data;
                    $scope.getListOfDistrict()
                })
            };

            $scope.getListOfServices = function () {
                $http.get($scope.servicesListURL).success(function (data) {
                    $scope._services = [];
                    $scope._outServ = [];
                    $scope.services = data;
                    for (var i = 0; i < $scope.services.length; i++) {
                        $scope._services.push({
                            id: $scope.services[i].id,
                            isSelected: $scope.isSelected($scope.services[i].id),
                            title: $scope.services[i].title
                        })
                    }
                    console.log($scope._services)
                })

            };

            $scope.getService = function (id) {
                for (var i = 0; i < $scope.services.length; i++) {
                    if ($scope.services[i].id === id) {
                        return $scope.services[i];
                    }
                }
                return null
            };

            $scope.isSelected = function (id) {
                return $scope.object.services.find(o=> o.id === id) !== undefined
            };


            /********** UPLOADER ***********/

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
                    $scope.save();
                } else {
                    $scope.uploadQuantity--
                }
            };

            $scope.saveLazyMult = function () {
                if ($scope.uploaderMultiple.queue.length > 0) {
                    $scope.uploadQuantity++;
                    imageUploaderMultiple.uploadAll();
                    $scope.mustReload = true;
                }
            };

            $('#showAddEdit').on("hidden.bs.modal", function () {
                imageUploaderMultiple.queue = [];
                $scope.uploadQuantity = 0;
                $(".uplMult").val('').clone(true);
            });

            /********** UPLOADER ***********/

            $scope.removeImage = function (at) {
                $scope.fileArr.splice(at, 1);
            };

            $scope.getPrice = function (catId) {
                if ($scope.object && $scope.object.prices) {
                    for (var i = 0; i < $scope.object.prices.length; i++) {
                        if (catId === $scope.object.prices[i].category.id) {
                            var p = $scope.object.prices[i].prices;
                            if (p === '') {
                                return 0;
                            }
                            return p;
                        }
                    }
                }
                return 0;
            };

            $scope.getRecId = function (catId) {
                if ($scope.object && $scope.object.prices) {
                    for (var i = 0; i < $scope.object.prices.length; i++) {
                        if (catId === $scope.object.prices[i].category.id) {
                            return $scope.object.prices[i].id;
                        }
                    }
                }
                return 0;
            };

            $http.get($scope.categoriesURL).success(function (resp) {
                if (resp.results.length > 0) {
                    $scope.categories = resp.results;
                }
            });

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
                                    "title": "დამატება"
                                }
                            ];
                        });
                    }
                }, 1000);
            };

            $scope.createFabMenuItems();

            $scope.getListOfCities();

        }]);
