/**
 * 
 */

function setImagePreview(avalue) {
        var docObj = document.getElementById("doc");
        var imagepreview=Ext.getCmp("imagePreview");
        //console.log("ExtJs中的图片预览："+imagepreview);
        var imgObjPreview = document.getElementById("preview");
        if (docObj.files && docObj.files[0]) {
            //火狐下，直接设img属性
            imgObjPreview.style.display = 'block';
            imgObjPreview.style.width = '100%';
            imgObjPreview.style.height = '100%';
            //imgObjPreview.src = docObj.files[0].getAsDataURL();

            //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
           // console.log("图片的url："+window.URL.createObjectURL(docObj.files[0]));
            imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
            //imagepreview.src=window.URL.createObjectURL(docObj.files[0]);
        } else {
            //IE下，使用滤镜
            docObj.select();
            var imgSrc = document.selection.createRange().text;
            var localImagId =document.getElementById("localImag");
            //必须设置初始大小
            localImagId.style.width = "300px";
            localImagId.style.height = "360px";
            //图片异常的捕捉，防止用户修改后缀来伪造图片
            try {
                localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
            } catch (e) {
                alert("您上传的图片格式不正确，请重新选择!");
                return false;
            }
            imgObjPreview.style.display = 'none';
            document.selection.empty();
        }
        return true;
    }

    function uploadAndSubmit() {
        var form = document.forms["demoForm"];

        if (form["file"].files.length > 0) {
            // 寻找表单域中的 <input type="file" ... /> 标签
            var file = form["file"].files[0];
            console.log(file.name);
            
            // try sending 
            var reader = new FileReader();

            reader.onloadstart = function() {
                // 这个事件在读取开始时触发
                console.log("onloadstart");
                document.getElementById("bytesTotal").textContent = file.size;
            };
            reader.onprogress = function(p) {
                // 这个事件在读取进行中定时触发
                console.log("onprogress");
                document.getElementById("bytesRead").textContent = p.loaded;
            };

            reader.onload = function() {
                // 这个事件在读取成功结束后触发
                console.log("load complete");
            };

            reader.onloadend = function() {
                // 这个事件在读取结束后，无论成功或者失败都会触发
                if (reader.error) {
                    console.log(reader.error);
                } 
                else {
                    document.getElementById("bytesRead").textContent = file.size;
                    // 构造 XMLHttpRequest 对象，发送文件 Binary 数据
                    var xhr = new XMLHttpRequest();
                    xhr.open( /* method */ "POST",
                        /* target url */
                        "uploadFiles.jsp?fileName=" + file.name,true
                        /*, async, default to true */
                    );
                    //浏览器的兼容
                    if (!XMLHttpRequest.prototype.sendAsBinary) {
                        XMLHttpRequest.prototype.sendAsBinary = function(datastr) {
                            function byteValue(x) {
                                return x.charCodeAt(0) & 0xff;
                            }
                            var ords = Array.prototype.map.call(datastr, byteValue);
                            var ui8a = new Uint8Array(ords);
                            this.send(ui8a.buffer);
                        };
                        
                    }
                     
                   // xhr.overrideMimeType("application/octet-stream");
                    xhr.sendAsBinary(reader.result);
                    xhr.onreadystatechange = function() {
                        if (xhr.readyState == 4) {
                            if (xhr.status == 200) {
                                console.log("上传完成");
                                alert(file.name+"上传成功！");
                                console.log("response: " + xhr.responseText);
                            };
                        };
                    };
                }
            
            };
        
            reader.readAsBinaryString(file);
        } 
    
        else {
            alert("请选择要上传的文件");
        }
    }
   /* function downloadFile(url) {   
        try{ 
            var elemIF = document.createElement("iframe");   
            elemIF.src = url;   
            elemIF.style.display = "none";   
            document.body.appendChild(elemIF);   
        }catch(e){ 
 
        }
    }; */
