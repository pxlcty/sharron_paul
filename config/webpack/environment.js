const { environment } = require('@rails/webpacker')

// setup for bootstrap to include jquery and popper.js
const webpack = require("webpack")
environment.plugins.append("Provide", new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.j', 'default']
}))
// setup for bootstrap end here.

module.exports = environment
