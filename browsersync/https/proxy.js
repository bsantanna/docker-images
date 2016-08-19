var browserSync = require('browser-sync').create();
browserSync.init({
  proxy: 'localhost:3003',
  ui: {
    weinre: {
      port: 3002
    }
  }
});
