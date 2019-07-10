/*
    openSUSE Welcome - A welcome utility
    Copyright (C) 2019  Carson Black
    Copyright (C) 2019  Stasiek Michalski

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
var lang = new Lang('en');

//check if there is a langCookie in the browser
document.addEventListener("DOMContentLoaded", function(event) { 
  var languageCode;
  var selectedLanguageName;

  if (cookieLanguage === undefined) {
    try {
      // try to use navigator.language
      languageCode = navigator.language.replace("-","_");
      window.lang.change(languageCode);
    }
    catch(err) {
      // navigator.language is not available
      if (navigator.language.length > 2) {
        try {
          // try with a more general string (for example, if navigator.language is "es-ES" then "es" is tried)
          languageCode = navigator.language.substring(0,2);
          window.lang.change(languageCode);
        }
        catch(err) {
          languageCode = "en";
        }
      }
      else {
        languageCode = "en";
      }
    }
  }
  else {
    languageCode = cookieLanguage;
  }
});

/* function for checking headline on news.opensuse.org */

jQuery(function($) {
$("#rss-feeds").rss(
	"https://news.opensuse.org/feed",
	{
		limit: 1,
		ssl: true,
		layoutTemplate: "<div class=\"alert alert-info text-truncate text-center mb-0\" role=\"alert\">{entries}</div>",
        entryTemplate: '<a class="news-link" onclick="bridge.openURL(\'{url}\')">{title}</a>',
        filter: function(entry, tokens) {
            console.log(tokens.url);
            console.log(tokens.title);
            if (tokens.url.includes("launcher.launch")) {
                    return false;
            } else if (tokens.title.includes("launcher.launch")) {
                    return false;
            } else {
                    return true;
            }
        }
	},
)
});
