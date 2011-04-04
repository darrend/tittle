function render_as_qrcode(text, parent_selector) {
  var parent = $(parent_selector);  
  var canvas = parent.children("canvas#tittle");
  if(canvas.size()==0) {
      parent.append("<canvas id='tittle'></canvas>")
      canvas = parent.children("canvas#tittle");
  }

  var qr = new QRCode(10, QRErrorCorrectLevel.L);
  qr.addData(text);
  qr.make();

  var block_size = 2;
  var module_count = qr.getModuleCount();
  
  canvas.attr('width',module_count*block_size);
  canvas.attr('height',module_count*block_size);
  
  var context = canvas[0].getContext('2d');   
  for(var row=0; row < module_count; row++) {
    for(var col=0; col < module_count; col++) {
      context.fillStyle = qr.isDark(col,row) ? "rgb(0,0,0)" : "rgb(255,255,255)"; 
      context.fillRect(row*block_size,col*block_size,block_size,block_size);
    }
  }  
 
}