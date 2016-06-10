module.exports = {
  config: {
    paths: {
      watched: ["src", "app"]
    },
    files: {
      javascripts: {
        joinTo: "js/app.js"
      },
      stylesheets: {
        joinTo: "css/app.css"
      }
    },
    plugins: {
      elmBrunch: {
        elmFolder: 'src',
        mainModules: ["MetroUi.elm"],
        outputFolder: "../public/js/",
        makeParameters : ['--warn']
      },
      sass: {
        mode: "native"
      }
    }
  }
};
