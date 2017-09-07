const path = require('path');
const ExtractTextPlugin = require("extract-text-webpack-plugin");
const fs = require('fs');

function OnBuildPlugin(callback) {
	this.callback = callback;
	this.apply = function(compiler) {
		compiler.plugin('done', this.callback);
	};
};

module.exports = {
	entry: "./src/GdipCMain.ahk",
	output: {
		path: path.join(__dirname, 'lib'),
		filename: "bundle.js"
	},
    plugins: [
		new ExtractTextPlugin("GdipC.ahk"),
		new OnBuildPlugin(function() {
			var bundlePath = path.join(__dirname, 'lib', 'bundle.js');
			if (fs.existsSync(bundlePath)) {
				fs.unlinkSync(bundlePath);
			}
		})		
    ],
	module: {
		loaders: [{
			test: /\.ahk$/,
			exclude: /node_modules/,
			use: ExtractTextPlugin.extract({
                use: [{
                    loader: 'ahk-loader'
                }]
			})
		}]
	}
}