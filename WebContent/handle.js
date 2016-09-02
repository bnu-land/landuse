/**
 * 
 */


$('#file_dataImport').on("change", function(e) {
    var formData = new FormData();
    formData.append('Content-Type', 'multipart/form-data');
    formData.append('type', 'POST');
    formData.append('filetype', 'excel');
    formData.append('file', e[0]);
    formData.append('emulateJSON', true);
    formData.append('processData', false);
    Ext.Ajax.request({
        url: 'file_upload',
        params: {
            filetype: 'excel'
        },
        rawData: formData,
        success: function(response) {
            var re = response.responseText;
            console.log("re:", re);
            Ext.Msg.alert('成功提示', 'formdata成功。');
        },
        failure: function(response) {
            Ext.Msg.alert('失败提示', '记录删除失败。');
        }
    });

    

});
