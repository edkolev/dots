
var handler1 = Phoenix.bind( 'f', [ 'cmd', 'alt' ], function() {
  fullScreen()
});

var handler2 = Phoenix.bind( 'e', [ 'cmd' ], function() {
  focusApplicationIfRunning('Google Chrome')
});

var handler3 = Phoenix.bind( 'i', [ 'cmd' ], function() {
  focusApplicationIfRunning('iTerm')
});

var handler4 = Phoenix.bind( 'u', [ 'cmd' ], function() {
  focusApplicationIfRunning('MacVim')
});

var handler5 = Phoenix.bind( 'm', [ 'cmd' ], function() {
  focusApplicationIfRunning('Mail')
});

var handler6 = Phoenix.bind( 'o', [ 'cmd' ], function() {
  focusApplicationIfRunning('Sequel Pro')
});

var handler7 = Phoenix.bind( 'd', [ 'cmd' ], function() {
  focusApplicationIfRunning('VLC')
});

var handler8 = Phoenix.bind( 'д', [ 'cmd' ], function() {
  focusApplicationIfRunning('VLC')
});

function fullScreen() {
  var win = Window.focusedWindow();
  var screenFrame = Window.focusedWindow().screen().frameWithoutDockOrMenu();
  win.setFrame(screenFrame);
}

function switchToLastUsedWindow(app_title) {
  var last_used_window = _.find( Window.visibleWindowsMostRecentFirst().reverse(), function(w) {
    if ( w.app().title() == app_title) return true;
  });

  last_used_window.focusWindow();
}

function isApplicationRunning( title ) {
  return _( App.runningApps() ).find( function( app ) {
    return app.title() === title;
  });
};

function isApplicationFocused( title ) {
  return Window.focusedWindow() && Window.focusedWindow().app().title() == title
}

function focusApplicationIfRunning ( title ) {
  var app = App.get( title );
  if ( app ) {
    // app.focus();
    App.launch( title ).focus();
  }
}
