/*
** ANGULAR DEFINITIONS
*/
var app = angular.module("welcome", []);
//var app_rscope = angular.injector(['ng']).get('$rootScope');
var app_rs;

function WelcomeCtrl($scope) {
  $scope.config = {
    arch:       'n/a',
    codename:   'n/a',
    desktop:    'n/a',
    version:    'n/a',
    live:       true,
    auto_start: false,
  };

  // register to configuration updates
  $scope.$on('configUpdate', function(e, d) {
    $scope.config = d;
  });

  $scope.isAutoStart = function() {
    return $scope.config.auto_start === true;
  }

  $scope.isLive = function() {
    return $scope.config.live === true;
  }

  $scope.isCINNAMON = function() {
    return $scope.config.desktop.toLowerCase() === 'cinnamon';
  }

  $scope.isGNOME = function() {
    return $scope.config.desktop.toLowerCase() === 'gnome';
  }

  $scope.isKDE = function() {
    return $scope.config.desktop.toLowerCase() === 'kde';
  }

  $scope.isMATE = function() {
    return $scope.config.desktop.toLowerCase() === 'mate';
  }
}

/*
** PAGE HANDLER
*/
$(document).ready( function() {
  // configure korobar
  var korobar = $('#korobar');
  var fixed = true;

  var footer  = $('footer');

  // TODO: correct korobar start position
  // HOME PAGE correction
  var start = 0;

  if( start - $(window).scrollTop() <= 0 ) {
    korobar.css('top', 0);
    korobar.css('position', 'fixed');
    fixed = true;
  }
  else {
    korobar.css('position', 'absolute');
    korobar.css('top', start + 'px');
    fixed = false;
  }

  // pin korobar to top when it passes
  $(window).off('scroll');
  $(window).on('scroll', function () {
    if( !fixed && (korobar.offset().top - $(window).scrollTop() <= 0) ) {
      korobar.css('top', 0);
      korobar.css('position', 'fixed');
      fixed = true;
    }
    else if( fixed && $(window).scrollTop() <= start ) {
      korobar.css('position', 'absolute');
      korobar.css('top', start + 'px');
      fixed = false;
    }
  });

  // frob page-container minimum height to at least the footer top
  $('.page-container').css('min-height', ($(window).height()-footer.outerHeight()) + 'px');


  app_rs = angular.element(document).scope();

  /*
  var data = { arch: 'woot' };
  app_rs.$apply( function() { app_rs.$broadcast( 'configUpdate', data ) });
  console.log('emitting done...');
  */
});


