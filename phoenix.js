
api.bind( 'f', [ 'cmd', 'alt' ], function() {
  fullScreen()
});

api.bind( 'e', [ 'cmd' ], function() {
  focusApplicationIfRunning('Google Chrome')
});

api.bind( 'i', [ 'cmd' ], function() {
  focusApplicationIfRunning('iTerm')
});

api.bind( 'u', [ 'cmd' ], function() {
  focusApplicationIfRunning('MacVim')
});

api.bind( 'm', [ 'cmd' ], function() {
  focusApplicationIfRunning('Mail')
});

api.bind( 'o', [ 'cmd' ], function() {
  focusApplicationIfRunning('Sequel Pro')
});

api.bind( 'd', [ 'cmd' ], function() {
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
  if ( isApplicationFocused( title )) {
    switchToLastUsedWindow( title)
  } else if (isApplicationRunning( title )) {
    api.launch( title );
  }
}
