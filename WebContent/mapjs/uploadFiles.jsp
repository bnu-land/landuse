<%@ page import="java.io.*" %><% 
   BufferedInputStream fileIn = new 
  BufferedInputStream(request.getInputStream()); 
   String fn = request.getParameter("fileName"); 
   
   byte[] buf = new byte[1024];
   File file = new File("G:/MyProject/uploadFiles/" + fn); 
   // File file = new File("http://localhost:8080/landuse/public/image/" + fn); 
   
   BufferedOutputStream fileOut = new BufferedOutputStream(new 
 FileOutputStream(file)); 
   
   while (true) { 
       // 读取数据
      int bytesIn = fileIn.read(buf, 0, 1024); 
      
      System.out.println(bytesIn); 
      
      if (bytesIn == -1) 
 { 
         break; 
      } 
 else 
 { 
         fileOut.write(buf, 0, bytesIn); 
      } 
   } 
   
   fileOut.flush(); 
   fileOut.close(); 
   
   out.print(file.getAbsolutePath()); 
 %>