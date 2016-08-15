    function ajaxuploadImg(name) 
     
    { 
     
    alert(1); 
     
    $("#loading") 
     
    .ajaxStart(function(){ 
     
    $(this).show(); 
     
    }) 
     
    .ajaxComplete(function(){ 
     
    $(this).hide(); 
     
    }); 
     
    $.ajaxFileUpload 
     
    ( 
     
    { 
     
    url:'uploadFile!uploadTest.action?testName='+name, 
     
    secureuri:false, 
     
    fileElementId:'files', 
     
    dataType: 'json', 
     
    } 
     
    ) 
     
    } 