/*
** ANGULAR DEFINITIONS
*/

var bridge;
var launcher;
var enabler;
var pageIn;
var pageOut;

var homeTr;
var socialTr;
var conTr;
var readTr;

function updateAutoStart() {
    enabler.toggle();
}
function delayedClick (URL) {
    pageIn.restart();
    setTimeout( function() { window.location = URL }, 50 );
}
window.onload = function () {
    new QWebChannel(qt.webChannelTransport, function(channel) {
        bridge = channel.objects.bridge;
        launcher = channel.objects.launcher;
        enabler = channel.objects.enabler;
        homeTr = channel.objects.homeTr;
        socialTr = channel.objects.socialTr;
        readTr = channel.objects.readmeTr;
        conTr = channel.objects.contributeTr;
        pageIn = channel.objects.pageIn;
        pageOut = channel.objects.pageOut;

        angular.bootstrap(document, ['welcome']);

        if (document.getElementById("autostart") !== null) {
            if (bridge.enabled) {
                document.getElementById("autostart").checked = true;
            } else {
                document.getElementById("autostart").checked = false;
            }
        }
        if (document.getElementById("live") !== null) {
            if (bridge.live) {
                document.getElementById("live").classList.add("active");
            }
        }

        var deHelpElms = document.querySelectorAll(".de-help");
        for (var i = 0; i < deHelpElms.length; i++) {
            var name = deHelpElms[i].getAttribute("data-de");
            if (name.toLowerCase().includes(bridge.de.toLowerCase())) {
                if (name.toLowerCase().includes("gnome") && bridge.de.toLowerCase().includes("budgie")) {
                    continue;
                } else {
                    deHelpElms[i].classList.add("current");
                }
            }
        }
        if (bridge.pastFirstPage) {
            pageOut.restart();
        }
        bridge.pastFirstPage = true;
        bridge.ready = true;
    });
}
function currentDE() {
    if (bridge.de === null) {
        return "WM"
    } else {
        return bridge.de
    }
}

var app = angular.module("welcome", ['lens.bridge', 'lens.ui']);

app.controller('WelcomeCtrl', function($scope) {
    $scope.system = {
      arch:       bridge.arch,
      distribution: {
        codename:   'n/a',
        desktop:    currentDE(),
        version:    bridge.os,
        live:       enabler.isLive(),
      }
    };
  $scope.homeTrans = homeTr;
  $scope.socialTrans = socialTr;
  $scope.conTrans = conTr;
  $scope.readTrans = readTr;

  $scope.autostart = bridge.enabled;

  $scope.isDE = function(desktop) {
    console.log("does " + bridge.de + " include " + desktop + "?");
    return bridge.de.toLowerCase().includes(desktop.toLowerCase());
  }

  $scope.openURI = function(uri) {
    bridge.openURL(uri);
  };

  $scope.command = function(cmd) {
    $scope.emit('command', cmd);
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
