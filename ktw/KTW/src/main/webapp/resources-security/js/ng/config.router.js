(function () {
    'use strict';
    angular
        .module('app')
        .run(runBlock)
        .constant('urls', {
            BASE_API: '/'
        })
        .config(config);

    runBlock.$inject = ['$rootScope', '$state', '$stateParams', '$localStorage', 'Access'];
    function runBlock($rootScope, $state, $stateParams, $localStorage, Access) {
        $rootScope.$state = $state;
        $rootScope.$stateParams = $stateParams;

        $rootScope.$on('$stateChangeStart', function(event, toState, toParams, fromState, fromParams, error) {
            $state.current = toState;
            if($rootScope.loggedIn && $localStorage.token && toState.name === "app.signin"){
                event.preventDefault();
                $state.go('app.dashboard');
            }
        });

        $rootScope.$on('$stateChangeSuccess', function(event, toState, toParams, fromState, fromParams) {
            $state.current = toState;
        });

        $rootScope.$on("$stateChangeError", function (event, toState, toParams, fromState, fromParams, error) {
            $state.current = toState;
            $state.current = toState;
            if (error === Access.UNAUTHORIZED) {
                event.preventDefault();
                delete $localStorage.token;
                $rootScope.loggedIn = false;
                $.notify("UNAUTHORIZED", "error");
                $state.go('app.signin');
            } else if (error <= Access.SERVER_IS_DOWN) {
                event.preventDefault();
                delete $localStorage.token;
                $rootScope.loggedIn = false;
                $.notify("SERVER_IS_DOWN", "error");
                $state.go('app.signin');
            }
        });

        $rootScope.$on("success:logout", function(event, data){
            $state.go('app.signin');
        });

        $rootScope.$on("success:auth", function(event, data){
            $state.go('app.dashboard');
        });
    }

    config.$inject = ['$stateProvider', '$urlRouterProvider', 'MODULE_CONFIG'];
    function config($stateProvider, $urlRouterProvider, MODULE_CONFIG) {

        $urlRouterProvider.otherwise('/app/dashboard');

        $stateProvider
            .state('app', {
                abstract: true,
                url: '/app',
                views: {
                    '': {
                        templateUrl: '/admin/view/Default/aside.html'
                    }
                }
            })
            .state('app.dashboard', {
                url: '/dashboard',
                templateUrl: '/admin/view/Default/index.html',
                data: {title: 'მთავარი გვერდი'},
                controller: 'DefaultController',
                resolve: {
                    userProfile: "UserProfile",
                    access: ["Access", function (Access) { return Access.hasRole("ADMIN"); }],
                    loadMyFiles: function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            name: "app",
                            files: [
                                "/admin/js/ng/controllers/DefaultController.js"
                            ]
                        });
                    }
                }
            })
            .state('app.signin', {
                url:'/signin',
                controller: 'SignInController',
                resolve: {
                    userProfile: "UserProfile",
                    loadMyFiles: function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            name: "app",
                            files: [
                                "/admin/js/ng/controllers/SignInController.js"
                            ]
                        });
                    }
                },
                templateUrl:'/admin/view/Login/index.html'
            })
            .state('app.slider', {
                url: '/slider',
                templateUrl: '/admin/view/Slider/index.html',
                data: {title: 'სლაიდერი'},
                controller: 'GSliderController',
                resolve: load(["admin/js/ng/controllers/GSliderController.js"])
            })
            .state('app.laundries', {
                url: '/laundries',
                templateUrl: '/admin/view/Laundries/index.html',
                data: {title: 'სამრეცხაოები'},
                controller: 'GLaundriesController',
                resolve: load(["admin/js/ng/controllers/GLaundriesController.js"])
            })
            .state('app.wines', {
                url: '/wines',
                templateUrl: '/admin/view/Services/index.html',
                data: {title: 'ღვინოები'},
                controller: 'GServicesController',
                resolve: load(["admin/js/ng/controllers/GServicesController.js"])
            })
            .state('app.shops', {
                url: '/shops',
                templateUrl: '/admin/view/Shops/index.html',
                data: {title: 'მაღაზიები'},
                controller: 'ShopsController',
                resolve: load(["admin/js/ng/controllers/ShopsController.js"])
            })
            .state('app.car', {
                url: '/car',
                templateUrl: '/admin/view/Car/index.html',
                data: {title: 'მანქანები'},
                controller: 'CarController',
                resolve: load(["ui.select","admin/js/ng/controllers/CarController.js"])
            })
            .state('app.category', {
                url: '/category',
                templateUrl: '/admin/view/Category/index.html',
                data: {title: 'კატეგორიები'},
                controller: 'CategoryController',
                resolve: load(["admin/js/ng/controllers/CategoryController.js"])
            })
            .state('app.params', {
                url: '/params',
                templateUrl: '/admin/view/Params/index.html',
                data: {title: 'პარამეტრები'},
                controller: 'GParamsController',
                resolve: load(["admin/js/ng/controllers/GParamsController.js"])
            })
            .state('app.mobile', {
                url: '/mobile',
                templateUrl: '/admin/view/Mobile/index.html',
                data: {title: 'მობილური მომხმარებლები'},
                controller: 'MobileController',
                resolve: load([
                    'admin/js/ng/controllers/MobileController.js'
                ])
            })
            .state('app.kilogram-price', {
                url: '/kilogram-price',
                templateUrl: '/admin/view/KilogramPrice/index.html',
                data: {title: 'ფასის პარამეტრები'},
                controller: 'KilogramPriceController',
                resolve: load([
                    'admin/js/ng/controllers/KilogramPriceController.js'
                ])
            })
            .state('app.main-video', {
                url: '/main-video',
                templateUrl: '/admin/view/MainVideo/index.html',
                data: {title: 'მთავარი გვერდი ვიდეო'},
                controller: 'GMainVideoController',
                resolve: load([
                    'admin/js/ng/controllers/GMainVideoController.js'
                ])
            })
            .state('app.terms', {
                url: '/terms-rights',
                templateUrl: '/admin/view/Terms/index.html',
                data: {title: 'წესები და უფლებები'},
                controller: 'GTermsAndRightsController',
                resolve: load([
                    "admin/js/ng/controllers/GTermsAndRightsController.js"
                ])
            })
            .state('app.cashflow', {
                url: '/cash-flow',
                templateUrl: '/admin/view/CashFlow/index.html',
                data: {title: 'ქეშფლოუ'},
                controller: 'GCashFlowController',
                resolve: load([
                    "admin/js/ng/controllers/GCashFlowController.js"
                ])
            })
            .state('app.transactions', {
                url: '/transactions',
                templateUrl: '/admin/view/Transactions/index.html',
                data: {title: 'ტრანზაქციები'},
                controller: 'GTransactionsController',
                resolve: load([
                    "admin/js/ng/controllers/GTransactionsController.js"
                ])
            })
            .state('app.coordinates', {
                url: '/coordinates',
                templateUrl: '/admin/view/ParcelCoordinates/index.html',
                data: {title: 'კორდინატები'},
                controller: 'GParcelCoordinatesController',
                resolve: load([
                    "admin/js/ng/controllers/GParcelCoordinatesController.js"
                ])
            })
            // main state
            .state('app.main', {
                url: '/main',
                template: '<div ui-view></div>'
            })
            .state('app.main.city', {
                url: '/city',
                templateUrl: '/admin/view/City/index.html',
                data: {title: 'ქალაქები'},
                controller: 'GCityController',
                resolve: load([
                    'admin/js/ng/controllers/GCityController.js'
                ])
            })
            .state('app.main.district', {
                url: '/district',
                templateUrl: '/admin/view/District/index.html',
                data: {title: 'რაიონები'},
                controller: 'GDistrictController',
                resolve: load([
                    'admin/js/ng/controllers/GDistrictController.js'
                ])
            })
            .state('app.main.country', {
                url: '/country',
                templateUrl: '/admin/view/Country/index.html',
                data: {title: 'ქვეყნები'},
                controller: 'GCountryController',
                resolve: load([
                    'admin/js/ng/controllers/GCountryController.js'
                ])
            })
            .state('app.main.currency', {
                url: '/currency',
                templateUrl: '/admin/view/Currency/index.html',
                data: {title: 'ვალუტა'},
                controller: 'GCurrencyController',
                resolve: load([
                    'admin/js/ng/controllers/GCurrencyController.js'
                ])
            })
            .state('app.main.itemcategory', {
                url: '/item-category',
                templateUrl: '/admin/view/ItemCategory/index.html',
                data: {title: 'ნივთები და კოდები'},
                controller: 'GItemCategoryController',
                resolve: load([
                    'admin/js/ng/controllers/GItemCategoryController.js'
                ])
            })
            // tours state
            .state('app.user', {
                url: '/user',
                template: '<div ui-view></div>'
            })
            .state('app.user.list', {
                url: '/list',
                templateUrl: '/admin/view/User/index.html',
                data: {title: 'მომხმარებლის გვერდი'},
                controller: 'UserController',
                resolve: {
                    loadMyFiles: function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            name: "app",
                            files: [
                                "admin/js/ng/controllers/UserController.js"
                            ]
                        });
                    }
                }
            })
            .state('forbidden', {
                url: '/forbidden',
                templateUrl: '/resources/admin/view/Forbidden/index.html'
            })
            // ui router
            .state('app.layout', {
                url: '/layout',
                template: '<div ui-view></div>'
            })
            .state('app.ui', {
                url: '/ui',
                template: '<div ui-view></div>'
            })
            .state('app.form', {
                url: '/form',
                template: '<div ui-view></div>'
            })
            .state('app.table', {
                url: '/table',
                template: '<div ui-view></div>'
            })
            .state('access', {
                url: '/access',
                template: '<div class="dark bg-auto w-full"><div ui-view class="fade-in-right-big smooth pos-rlt"></div></div>'
            })


        function load(srcs, callback) {
            return {
                deps: ['$ocLazyLoad', '$q',
                    function ($ocLazyLoad, $q) {
                        var deferred = $q.defer();
                        var promise = false;
                        srcs = angular.isArray(srcs) ? srcs : srcs.split(/\s+/);
                        if (!promise) {
                            promise = deferred.promise;
                        }
                        angular.forEach(srcs, function (src) {
                            promise = promise.then(function () {
                                angular.forEach(MODULE_CONFIG, function (module) {
                                    if (module.name == src) {
                                        src = module.module ? module.name : module.files;
                                    }
                                });
                                return $ocLazyLoad.load(src);
                            });
                        });
                        deferred.resolve();
                        return callback ? promise.then(function () {
                            return callback();
                        }) : promise;
                    }]
            }
        }
    }
})();
