import riot from 'rollup-plugin-riot'
import nodeResolve from 'rollup-plugin-node-resolve'
import commonjs from 'rollup-plugin-commonjs'
import buble from 'rollup-plugin-buble'
import postcss from 'rollup-plugin-postcss'
import uglify from 'rollup-plugin-uglify'
import livereload from 'rollup-plugin-livereload'
import server from 'rollup-plugin-server'
import globals from 'rollup-plugin-node-globals'
import path from 'path'

export default {
  input: 'src/app.js',
  output: {
    file: 'dist/bundle.js',
    sourceMap: true,
    format: 'iife'
  },
  plugins: [
    riot({
      parsers: 'riot.config.js'
    }),
    postcss({
      plugins: []
    }),
    nodeResolve({ browser: true, jsnext: true }),
    commonjs(),
    buble({ exclude: 'node_modules/**' }),
    globals(),
    uglify(),
    livereload(),
    server({
      contentBase: path.join(__dirname, './'),
      historyApiFallback: true
    })
  ]
}
