<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
  <% 
   BufferedInputStream fileIn = new 
   BufferedInputStream(request.getInputStream()); 
   String fn = request.getParameter("fileName"); 
  
   byte[] buf = new byte[1024];
   //console.log(fn);
   File file = new File("G:/MyProject/uploadFiles/"+fn); /**/
  // File file = new File("http://localhost:8080/landuse/public/image/" + fn); //失败
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
</body>
</html>