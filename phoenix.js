
api.bind( 'e', [ 'cmd' ], function() {
  App.focusIfRunning('Google Chrome')
});

api.bind( 'i', [ 'cmd' ], function() {
  App.focusIfRunning2('iTerm', 'iTerm 2')
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

App.focusIfRunning2 = function ( title, launch_title ) {
  if ( App.findByTitle( title ) ) api.launch( launch_title );
}

App.findByTitle = function( title ) {
  return _( this.runningApps() ).find( function( app ) {
    if ( app.title() === title ) return true;
  });
};
