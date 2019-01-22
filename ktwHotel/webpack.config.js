var argv = require('yargs').argv;
var path = require('path');
var webpack = require('webpack');
var dir = path.resolve();

var ExtractTextPlugin = require('extract-text-webpack-plugin');
var OptimizeCssAssetsPlugin = require('optimize-css-assets-webpack-plugin');


module.exports = {
    entry: {
        bundle : [ 

            dir + '/HOTEL/src/main/webapp/resources/js/bootstrap.min.js',
            dir + '/HOTEL/src/main/webapp/resources/js/jquery-ui.min.js',
            dir + '/HOTEL/src/main/webapp/resources/js/range-slider.js',
            dir + '/HOTEL/src/main/webapp/resources/js/same-height.js',
            dir + '/HOTEL/src/main/webapp/resources/js/jquery.main.js',
            dir + '/HOTEL/src/main/webapp/resources/js/animations.min.js',
            dir + '/HOTEL/src/main/webapp/resources/js/jquery.plugin.js',
            dir + '/HOTEL/src/main/webapp/resources/js/jquery.countdown.js',
            dir + '/HOTEL/src/main/webapp/resources/js/timber.master.min.js',
            dir + '/HOTEL/src/main/webapp/resources/js/bootstrap-dropdownhover.min.js',
            dir + '/HOTEL/src/main/webapp/resources/js/bootstrap-datepicker.js',
            dir + '/HOTEL/src/main/webapp/resources/js/jquery.flexslider.js',
            dir + '/HOTEL/src/main/webapp/resources/js/myscript.js',
            dir + '/HOTEL/src/main/webapp/resources/js/style.js'

        ]
    },
    output: {
        path: dir + "/HOTEL/src/main/webapp/resources/build",
        filename: "[name].js"
    },
    module: {
        loaders: [
            {
                test: /\.css$/,
                use: ['style-loader', {
                    loader: 'css-loader',
                    options: {
                        minimize: true
                    }
                }],
            },
            {
                test: /\.(png|jpg|gif|woff|eot|woff2|ttf|svg)$/,
                loader: 'url-loader'
            },
            {
                test: /\.js$/,
                loader: 'babel-loader',
                exclude: /node_modules/,
            },
            {
                test: /\.html$/,
                loader: 'html-loader',
                options: {
                    minimize: true,
                    collapseWhitespace: true,
                    removeAttributeQuotes: false,
                    removeComments: false
                }
            }
        ]
    },
    devServer: {
        port: 3001,
        contentBase: dir + "/HOTEL/src/main/webapp/resources/js",
        compress: false,
        historyApiFallback: {
            disableDotRule: true
        }
    },
    plugins: [
    ]
};

if (argv.env === 'PROD') {
    module.exports.plugins.push(
        new webpack.optimize.UglifyJsPlugin({
            minimize: true,
            compress: {
                warnings: false
            }
        }));
}
