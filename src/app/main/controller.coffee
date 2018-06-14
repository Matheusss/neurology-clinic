angular.module 'neurology-clinic'
 .controller 'MainController', ($rootScope, $scope, $state, $timeout, $interval, $element, $anchorScroll, $location) ->
    'ngInject'

    $scope.images = []

    $scope.clinicImages = [
      '/assets/images/cli1.jpeg'
      '/assets/images/cli2.jpeg'
      '/assets/images/cli3.jpeg'
      '/assets/images/cli4.jpeg'
      '/assets/images/cli5.jpeg'
      '/assets/images/cli6.jpeg'
    ]

    $scope.smImages = [
      '/assets/images/prof1.jpeg'
      '/assets/images/prof2.jpeg'
      '/assets/images/prof3.jpeg'
      '/assets/images/prof4.jpeg'
      '/assets/images/prof11.jpeg'
      '/assets/images/prof13.jpeg'
      '/assets/images/prof14.jpeg'
      '/assets/images/prof15.jpeg'
      '/assets/images/prof17.jpeg'
    ]

    $scope.mdImages = [
      '/assets/images/prof10.jpeg'
      '/assets/images/prof16.jpeg'
      '/assets/images/prof12.jpeg'
    ]

    $scope.lgImages = [
      '/assets/images/prof5.jpeg'
      '/assets/images/prof6.jpeg'
      '/assets/images/prof7.jpeg'
      '/assets/images/prof8.jpeg'
      '/assets/images/prof9.jpeg'
      'https://media.giphy.com/media/UdoS9OzIS2lgY/giphy.gif'
    ]

    $scope.methods = 
      getRandomImage: (array) ->
        image = $scope.methods.getRan(0, array.length - 1) 
        return array[image]
      
      getRan: (min, max) ->
        return Math.floor(Math.random() * (max - min + 1)) + min

      loadImages: () ->
        $scope.images[1] = $scope.methods.getRandomImage($scope.smImages)
        $scope.images[2] = $scope.methods.getRandomImage($scope.smImages)
        $scope.images[3] = $scope.methods.getRandomImage($scope.mdImages)
        $scope.images[4] = $scope.methods.getRandomImage($scope.lgImages)
        $scope.images[5] = $scope.methods.getRandomImage($scope.mdImages)
        $scope.images[6] = $scope.methods.getRandomImage($scope.smImages)
        $scope.images[7] = $scope.methods.getRandomImage($scope.smImages)

      changeImageRan: () ->
        index = $scope.methods.getRan(1, 7)
        if index is 1 or index is 2 or index is 6 or index is 7
          ranImg = $scope.methods.getRandomImage($scope.smImages)
        else if index is 3 or index is 5
          ranImg = $scope.methods.getRandomImage($scope.mdImages)
        else
          ranImg = $scope.methods.getRandomImage($scope.lgImages)

        $scope.images[index] = ranImg if $scope.methods.isAlreadyShowing(ranImg) is -1

      isAlreadyShowing: (ranImg) ->
        return _.indexOf $scope.images, ranImg 

      scrollToHash: (hash) ->
        if hash
          $('html, body').animate { scrollTop: $("##{hash}").offset().top }, 1000, 'easeInOutExpo'
        else
          $('html, body').animate { scrollTop: $("html").offset().top }, 1000, 'easeInOutExpo'  
        
    $scope.methods.loadImages()
    $interval($scope.methods.changeImageRan, 800)
  return
