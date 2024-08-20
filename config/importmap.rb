# Pin npm packages by running ./bin/importmap

pin "application"
pin "jquery" # @3.7.1
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "@popperjs--core.js", preload: true # @2.11.8
