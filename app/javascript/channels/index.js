// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)
OAuth.initialize('<%= ENV["OAUTHIO_PUBLIC_KEY"] %>');
OAuth.popup('google')
    .done(function(result) {
      //use result.access_token in your API request
      //or use result.get|post|put|del|patch|me methods (see below)
    })
    .fail(function (err) {
      //handle error with err
});

