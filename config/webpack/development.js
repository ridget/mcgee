process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')
const webpack = require('webpack');
const CopyWebpackPlugin = require('copy-webpack-plugin');

module.exports = environment.toWebpackConfig(
).merge({
    plugins: [
        new webpack.LoaderOptionsPlugin({
            minimize: true,
            debug: false
        }),
        new CopyWebpackPlugin([
            { from: './node_modules/graphql-voyager/dist/voyager.worker.js' }
        ])
    ]
})
