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
var usercount=function (call) {
    $.ajax({
        url:"usercount.do",
        type:"get",
        dataType:"json",
        contentType: "application/json",
        success:function(data){
            call(data);
        }
    })
};
var tweetcount=function (call) {
    $.ajax({
        url:"tweetcount.do",
        type:"get",
        dataType:"json",
        contentType: "application/json",
        success:function(data){
            call(data);
        }
    })
};
var syslog=function (page,before,call) {
    var url="syslog.do?pagenum="+page;
    $.ajax({
        url:url,
        type:"get",
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
var sinauser=function (page,state,before,call) {
    var url="sinauser.do?pagenum="+page+"&status="+state;
    $.ajax({
        url:url,
        type:"get",
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
var sysuser=function (page,before,call) {
    var url="sysuser.do?pagenum="+page;
    $.ajax({
        url:url,
        type:"get",
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

var changePwd=function (data,before,call) {
    $.ajax({
        url:"cp.do",
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

var addUser=function (data,before,call) {
    $.ajax({
        url:"au.do",
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
var delUser=function (id,before,call) {
    var url="du.do?suid="+id;
    $.ajax({
        url:url,
        type:"post",
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
var webStart=function (call) {
    $.ajax({
        url:"start.do",
        type:"get",
        dataType:"json",
        contentType:"application/json",
        success:function(data){
            call(data)
        }
    });
};
var postbytime=function (st,et,before,call) {
    var url="postbytime.do?startTime="+st+"&endTime="+et;
    $.ajax({
        url:url,
        type:"get",
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
var webStop=function (call) {
    $.ajax({
        url:"cancel.do",
        type:"post",
        success:function(){
            call()
        }
    });
};
