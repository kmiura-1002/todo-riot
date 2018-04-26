
import buble from 'buble'
import postcss from 'postcss'
import postcssCssnext from 'postcss-cssnext'

export default {
  type: 'buble',
  style: 'cssnext',
  parsers: {
    js: { buble: js => buble.transform(js) },
    css: { cssnext: (tagName, css) => {
      // ちょっとだけハックして、:scopeを:rootに置き換えてPostCSSに渡す
      // タグの中でCSS変数を使いやすくするため
      css = css.replace(/:scope/g, ':root')
      css = postcss([cssnext]).process(css).css
      css = css.replace(/:root/g, ':scope')
      return css
    }}
  }
}
