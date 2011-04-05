package org.whittlebits.tittle

import android.app.Activity
import android.widget.TextView
import android.widget.Button
import android.content.Intent

class TittleActivity < Activity
  def onCreate(state)
    super state
    setContentView(R.layout.main)
    
    tittleActivity = self
    Button(findViewById(R.id.button)).setOnClickListener do |view|
      intent = Intent.new("com.google.zxing.client.android.SCAN")
      intent.putExtra("SCAN_MODE","QR_CODE_MODE")
      tittleActivity.startActivityForResult(intent,0)
    end
  end  
  
  def onSaveInstanceState(state)
    super(state)
    state.putString("TEXT_STATE", TextView(findViewById(R.id.text)).getText().toString())
  end
  
  def onRestoreInstanceState(state)
    super(state)
    text = state.getString("TEXT_STATE")
    TextView(findViewById(R.id.text)).setText(text) unless text == null
  end

  def onActivityResult(requestCode,resultCode,intent)
    if (requestCode == 0 && resultCode == Activity.RESULT_OK) 
      text = intent.getStringExtra("SCAN_RESULT")
      TextView(findViewById(R.id.text)).setText(text)        
    end
  end
end
