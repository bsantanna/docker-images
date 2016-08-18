var browserSync = require('browser-sync').create();

browserSync.init({
  proxy: process.env.REVERSE_PROXY_HOST,
  ui: {
    weinre: {
      port: 3002
    }
  }
});
