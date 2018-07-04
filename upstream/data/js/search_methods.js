var lang = new Lang('en');
window.lang.dynamic('en', 'app://js/langpack/en.json');
window.lang.dynamic('pl', 'app://js/langpack/pl.json');

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
	"http://news.opensuse.org/feed",
	{
		limit: 1,
		ssl: true,
		layoutTemplate: "<div class=\"alert alert-info text-truncate text-center mb-0\" role=\"alert\">{entries}</div>",
		entryTemplate: '<a href="{url}">{title}</a>'
	},
)
});
