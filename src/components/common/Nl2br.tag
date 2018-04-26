<nl2br>
  <virtual each={text, i in texts}>
    <br if={i}>{text}
  </virtual>

  <script>
    const self = this
    if(opts.text){
        self.texts = opts.text.split('\n')
    }else{
        self.texts = []
    }
  </script>
</nl2br>