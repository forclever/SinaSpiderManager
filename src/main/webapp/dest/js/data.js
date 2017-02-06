/*
* login
* */
var loginData=function(data,before,call){
    $.ajax({
        url:"login.do",
        type:"post",
        data:data,
        dataType:"json",
        contentType: "application/json",
        beforeSend:function(){
            before();
        },
        success:function(data){
            call(data);
        }
    })
};


