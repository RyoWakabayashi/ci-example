const path = require("path");
const { CleanWebpackPlugin } = require("clean-webpack-plugin");
const HTMLWebpackPlugin = require("html-webpack-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

module.exports = {
  // 読込の起点となる Javascript ファイル
  entry: "./src/index.js",
  // 出力先
  output: {
    filename: "main.js",
    path: path.resolve(__dirname, "dist"),
  },
  module: {
    rules: [
      // Javascript の読込設定
      // babel を使うことで古いブラウザにも対応する
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
          options: {
            presets: ["@babel/preset-env"],
          },
        },
      },
      // scss の読込設定
      {
        test: /\.scss$/,
        exclude: /node_modules/,
        use: [
          MiniCssExtractPlugin.loader,
          "css-loader",
          {
            loader: "sass-loader",
            options: {
              implementation: require("sass"),
            },
          },
        ],
      },
    ],
  },
  plugins: [
    // 前回の結果を削除する
    new CleanWebpackPlugin(),
    // HTMLファイルにビルド結果の Javascript ファイルへのリンクを追加する
    new HTMLWebpackPlugin({
      template: "src/index.html",
      inject: "body",
    }),
    // scee を変換した css の出力先を設定する
    new MiniCssExtractPlugin({
      filename: "css/style.css",
    }),
  ],
  // 開発用 Web サーバーの設定
  devServer: {
    host: "localhost",
    static: path.join(__dirname, "dist"),
    port: 3100,
    open: true,
    historyApiFallback: true,
  },
};
