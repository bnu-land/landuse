** 
     * 图片上传 
     * @param request 
     * @param response 
     * @throws ServletException 
     * @throws IOException 
     */  
    private void imgUpload(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        String fileType = request.getParameter("fType");  
        BufferedInputStream fin = new BufferedInputStream(request.getInputStream());  
          
        //生成随机文件名  
        String fileName = uuid.generate() + fileType;  
          
        //path是本地路径  
        String path = getURI() + "/uploadFolder/" + fileName;  
          
        //uploadBasePath是从前台页面拿到的网页路径  
        String uploadBasePath = request.getParameter("uploadBasePath");  
        String imgAlt = request.getParameter("imgAlt");  
        if(null != uploadBasePath && imgAlt != null){  
            //url拼接出来以后是http://xxx.xxx.xxx/smdtx/uploadFolder/xxxx.jpg  
            String url = uploadBasePath + "uploadFolder/" + fileName;  
            PrintWriter out = response.getWriter();  
            if(saveFile(fin,path)){//成功了就返回url给jsp页面  
                Image img = new Image();  
                img.setUrl(url);  
                img.setAlt(imgAlt);  
                try{  
                    imgDao.add(img);  
                    out.write(url);  
                    out.flush();  
                }catch(Exception e){  
                    mLog.error(" method imgUpload() catch exception by " + e.getMessage());  
                    e.printStackTrace();  
                }finally{  
                    if(out != null){  
                        out.close();  
                    }  
                }  
            }else{  
                try{  
                    out.write("false");  
                    out.flush();  
                }catch(Exception e){  
                    mLog.error(" method imgUpload() catch exception by " + e.getMessage());  
                    e.printStackTrace();  
                }finally{  
                    if(out != null){  
                        out.close();  
                    }  
                }  
            }  
        }  
          
    }  
  
/** 
     * 保存文件到本地 
     * @param in 输入流 
     * @param path 保存地址 
     * @return boolean 成功标识  
     * @throws IOException 
     */  
    private boolean saveFile(InputStream in,String path) throws IOException{  
        File file = new File(path);  
        byte[] buff = new byte[1024];  
        int buffLength = -1;  
        OutputStream out = null;  
        boolean result = false;  
        try{  
            out = new FileOutputStream(file);  
            while((buffLength = in.read(buff)) != -1){  
                out.write(buff, 0, buffLength);  
            }  
            result = true;  
        }catch(Exception e){  
            mLog.error(" method saveFile() catch exception by " + e.getMessage());  
            e.printStackTrace();  
        }finally{  
            if(out != null){  
                out.close();  
            }  
        }  
        return result;  
    }  