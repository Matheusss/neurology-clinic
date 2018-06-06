angular.module 'neurology-clinic'
 .controller 'MainController', ($rootScope, $scope, $state, $timeout, $interval, $element) ->
    'ngInject'

    $scope.images = []

    $scope.methods = {}

    do ->
      target = $("#page-top")
      $("#page-top").scroll ->
        console.log this.scrollTop


  return
