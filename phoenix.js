
function fullScreen() {
  var win = Window.focusedWindow();
  var screenFrame = Window.focusedWindow().screen().frameWithoutDockOrMenu();
  win.setFrame(screenFrame);
}

api.bind( 'f', [ 'cmd', 'alt' ], function() {
  fullScreen()
});

api.bind( 'e', [ 'cmd' ], function() {
  App.focusIfRunning('Google Chrome')
});

api.bind( 'i', [ 'cmd' ], function() {
  App.focusIfRunning('iTerm')
});

api.bind( 'u', [ 'cmd' ], function() {
  App.focusIfRunning('MacVim')
});

api.bind( 'm', [ 'cmd' ], function() {
  App.focusIfRunning('Mail')
});

api.bind( 'o', [ 'cmd' ], function() {
  App.focusIfRunning('Sequel Pro')
});

api.bind( 'd', [ 'cmd' ], function() {
  App.focusIfRunning('VLC')
});

App.focusIfRunning = function ( title ) {
  if ( App.findByTitle( title ) ) api.launch( title );
}

App.findByTitle = function( title ) {
  return _( this.runningApps() ).find( function( app ) {
    if ( app.title() === title ) return true;
  });
};
