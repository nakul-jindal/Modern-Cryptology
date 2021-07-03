for i in range(8):
   file = open("inputs"+str(i+1)+".txt", "a")
   for j in range(128):
      t = ['f']*16
      t[2*i] = chr(102+j//16)
      t[2*i+1] = chr(102+j%16)
      t.append("\n")
      value = ''.join(str(tmp) for tmp in t)
      file.write(value)
    
    
