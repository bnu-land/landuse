<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.io.*" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<% //声明变量和函数。
 //request.setCharacterEncoding("utf-8");//解决中文乱码问题。
  
%>
  <% 
   BufferedInputStream fileIn = new 
   BufferedInputStream(request.getInputStream()); 
   String fn = request.getParameter("fileName"); 
   
   byte[] buf = new byte[1024];
   //out.print(request.result);
   File file = new File("G:/MyProject/uploadFiles/"+fn); /**/ 

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
   out.print(fn+"<br>");
  
   out.print(file.getAbsolutePath()); 
 
 %>
</body>
</html>