<%@ page language="java" import="java.io.*"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
    String readFile(String fileName){
	File file=new File(fileName);
	BufferedReader reader=null;
	try
	{
		//System.out.println("以行为单位读取文件内容，一次读一整行：");
		 reader = new BufferedReader(new FileReader(file));
         String tempString = null;
         int line = 1;
         // 一次读入一行，直到读入null为文件结束
         while ((tempString = reader.readLine()) != null) {
             // 显示行号
             System.out.println("line " + line + ": " + tempString);
             tempString+=tempString;
             line++;
         }
         reader.close();
         return tempString;
     } catch (IOException e) {
         e.printStackTrace();
         return "false";
     } finally {
         if (reader != null) {
             try {
                 reader.close();
             } catch (IOException e1) {
             }
         }
     }
	
}
%>
<%= readFile("G:\123.txt") %> 
<textarea id="show" name="show" cols="100" rows="20" >
    </textarea>
</body>
</html>