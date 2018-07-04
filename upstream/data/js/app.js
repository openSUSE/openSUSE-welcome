/*
** ANGULAR DEFINITIONS
*/
var app = angular.module("welcome", ['lens.bridge', 'lens.ui']);

angular.element(document).ready(function () {
  angular.bootstrap(document, ['welcome']);
});

app.controller('WelcomeCtrl', function($scope) {
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
});
