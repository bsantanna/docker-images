var browserSync = require('browser-sync').create();
browserSync.init({
  proxy: 'localhost:3003',
  online: false,
  ui: {
    weinre: {
      port: 3002
    }
  }
});
