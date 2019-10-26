/*
    openSUSE Welcome - A welcome utility
    Copyright (C) 2019  Carson Black
    Copyright (C) 2019  Stasiek Michalski
    Copyright (C) 2017  Ian Firns

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/
/*
** ANGULAR DEFINITIONS
*/

var bridge;
var launcher;
var enabler;
var pageIn;
var pageOut;
var xfceLayout;

var homeTr;
var socialTr;
var conTr;
var readTr;
var xfceTr;

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
        xfceTr = channel.objects.xfceTr;
        xfceLayout = channel.objects.layouter;
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

        var deHelpElms = document.querySelectorAll(".de-help,.de-footer");
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
  $scope.xfceTrans = xfceTr;
  $scope.xfceLayout = xfceLayout;

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
