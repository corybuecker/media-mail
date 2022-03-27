# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true

pin '@material/ripple', to: 'https://ga.jspm.io/npm:@material/ripple@13.0.0/dist/mdc.ripple.js'
pin '@material/textfield', to: 'https://ga.jspm.io/npm:@material/textfield@13.0.0/dist/mdc.textfield.js'

pin '@material/base/component', to: 'https://ga.jspm.io/npm:@material/base@13.0.0/component.js'
pin '@material/base/foundation', to: 'https://ga.jspm.io/npm:@material/base@13.0.0/foundation.js'
pin '@material/dom/events', to: 'https://ga.jspm.io/npm:@material/dom@13.0.0/events.js'
pin '@material/dom/ponyfill', to: 'https://ga.jspm.io/npm:@material/dom@13.0.0/ponyfill.js'
pin 'tslib', to: 'https://ga.jspm.io/npm:tslib@2.3.1/tslib.es6.js'

pin_all_from 'app/javascript/controllers', under: 'controllers'
