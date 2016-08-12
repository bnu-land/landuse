<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<% //声明变量和函数。
  // request.setCharacterEncoding("utf-8");//解决中文乱码问题。
  /* Protected void processRequest(HttpServletRequest request, HttpServletResponse response)  
 Throws ServletException, IOException {  
    response.setContentType("text/html;charset = utf-8");  
    printWriter out = response.getWriter();  
    try{  
         String old = request.getParameter("name");  
         String name = URLDecoder.decode(old,”utf-8”);  
             System.out.println(name);  
             
        } 
  }  */
%>
  <% 
   BufferedInputStream fileIn = new 
   BufferedInputStream(request.getInputStream()); 
   String fn = request.getParameter("fileNames"); 
   String name=request.getParameter("fileN");
   //System.out.println(fn);  
   //String name = URLDecoder.decode(fn,"utf-8"); 
   //System.out.println(name);  
   byte[] buf = new byte[1024];
   //console.log(fn);
   File file = new File("G:/MyProject/uploadFiles/"+name); /**/
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