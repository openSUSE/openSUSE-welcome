/*
** ANGULAR DEFINITIONS
*/
var app = angular.module("welcome", ['ngAnimate', 'ngRoute', 'lens.bridge', 'lens.ui'])
  .config(['$routeProvider',
    function($routeProvider) {
      $routeProvider
        .when('/main', {
          templateUrl: 'partials/main.html',
          controller: 'WelcomeCtrl'
        })
        .when('/contribute', {
          templateUrl: 'partials/contribute.html',
          controller: 'WelcomeCtrl'
        })
        .when('/features', {
          templateUrl: 'partials/features.html',
          controller: 'WelcomeCtrl'
        })
        .when('/readme', {
          templateUrl: 'partials/readme.html',
          controller: 'WelcomeCtrl'
        })
        .otherwise({
          redirectTo: '/main'
        });
    }
  ]);;

function WelcomeCtrl($scope) {
  $scope.system = {
    arch:       'n/a',
    distribution: {
      codename:   'n/a',
      desktop:    'n/a',
      version:    'n/a',
      live:       true,
    }
  };

  $scope.autostart = false;

  $scope.isDE = function(desktop) {
    return $scope.system.distribution.desktop.toLowerCase() === desktop.toLowerCase();
  }

  $scope.openURI = function(uri) {
    $scope.emit('open-url', uri);
  };

  $scope.command = function(cmd) {
    $scope.emit('command', cmd);
  };

  $scope.updateAutoStart = function() {
    $scope.emit('set-autostart', $scope.autostart);
  };

  $scope.close = function() {
    $scope.emit('close-request');
  };

  /* register for signals */
  $scope.$on('system-config', function(e, system) {
    $scope.system = system;
  });

  $scope.emit('get-system-config');
}

function MainCtrl($scope) {

}

/*
** PAGE HANDLER
*/
$(document).ready( function() {
  /* configure korobar */
  var fixed   = true;
  var korobar = $('#korobar');
  var page    = $('.page-container');
  var footer  = $('footer');
  var start   = 0;

  /* helper function to frob element heights for the layered effect */
  var resizeHelper = function() {
    // banner correction
    if( $('#banner').length ) {
      start = $('#banner').outerHeight();
    }

    /* calculate korobar position and initial pinning state */
    if( start - $(window).scrollTop() <= 0 ) {
      korobar.css({ position: 'fixed', top: 0 });
      fixed = true;
    }
    else {
      korobar.css({ position: 'absolute', top: start + 'px' });
      fixed = false;
    }

    /* frob page-container minimum height to at least the footer top */
    page.css({
      'min-height': ($(window).height()-footer.outerHeight()) + 'px',
      'margin-bottom': footer.outerHeight() + 'px'
    });

    /* frob page-content minimum height to consume immediate window */
    $('.page-content').css('min-height', ( $(window).height() - 96 )  + 'px');
  }

  /* pin korobar to top when it passes */
  $(window).on('scroll', function() {
    if( !fixed && (korobar.offset().top - $(window).scrollTop() <= 0) ) {
      korobar.css({ position: 'fixed', top: 0, });
      fixed = true;
    }
    else if( fixed && $(window).scrollTop() <= start ) {
      korobar.css({ position: 'absolute', top: start + 'px' });
      fixed = false;
    }
  });

  /* bind to resize events */
  $(window).on('resize', resizeHelper);

  /* turn on tooltips */
  $("[data-toggle='tooltip']").tooltip();

  /* smooth scroll targets */
  $('a[href*=#]:not([href=#]):not([data-toggle])').click(function() {
    if( location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') || location.hostname == this.hostname ) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if( target.length ) {
        $('html,body').animate({ scrollTop: target.offset().top - korobar.height() - 16 }, 1000);
        return false;
      }
    }
  });

  /* initial call to page resize helper */
  setTimeout(function() { resizeHelper(); }, 0);
});


