angular.module('app').controller('GTransactionsController',
    ['$scope', '$http', 'GridManager', 'ModalManager', function ($scope, $http, GridManager, ModalManager) {

        angular.extend($scope, {
            transList: 'orders/all',
            exportLink: 'orders/export',
            laundryList: 'laundry/list?showsAll=true&pageSize=-255',
            transactionList: [
                {id: "0", name: "დასრულებული"},
                {id: "3", name: "წარუმატებელი"}
            ],
            init: {}
        });

        GridManager.givePowerTo($scope);
        ModalManager.enableModals($scope);

        $scope.loadLaundries = function () {
            $http.get($scope.laundryList).success(function (data) {
                $scope.laundryList = data.results;
            })
        };

        $scope.filter = function () {
            var objCopy = angular.copy($scope.object);
            console.log($.param(objCopy))
            $scope.url = $scope.transList + "?" + $.param(objCopy);
            GridManager.givePowerTo($scope);
            $scope.AmfTable.openPage(0);
        };

        $scope.view = function (item) {
            $("#showInvoice").modal("show");
            $scope.obj = {};
            var obj = angular.copy(item);
            $scope.obj = obj;
        };

        $scope.exportData = function () {
            var objCopy = angular.copy($scope.object);
            $scope.downloadAll([
                $scope.exportLink + "?" + $.param(objCopy)
            ]);
        };

        $scope.loadLaundries();

        $scope.downloadAll = function (urls) {
            var link = document.createElement('a');
            link.setAttribute('download', null);
            link.style.display = 'none';
            document.body.appendChild(link);
            for (var i = 0; i < urls.length; i++) {
                link.setAttribute('href', urls[i]);
                link.click();
            }
            document.body.removeChild(link);
        };

    }]);