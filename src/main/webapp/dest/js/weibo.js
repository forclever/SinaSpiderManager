var wb=wb||{};
wb.login={
    init:function(){
        this.p.i();
        this.b.i();
    },
    p:{
        i:function(){
            if(1==sessionStorage.getItem("weiboLogin")){
                $(".mod-login").hide();
                $(".mod-warp").show();
                wb.main.page.i();
                $("body").removeClass("unlogin")
            }else{
                $(".mod-login").show();
                $(".mod-warp").hide();
            }
        }
    },
    b:{
        i:function(){
            this.ipt();
            this.btn();
        },
        ipt:function(){
            var ipt=$(".login-bd .ipt");
            ipt.focus(function(){
                $(this).parent("li").addClass("focus")
            });
            ipt.blur(function(){
                $(this).parent("li").removeClass("focus");
            })
        },
        btn:function(){
            var body=$("body");
            body.on("click",".btn-login",function(){
                if(isinputnull.init("ipt-user")){
                    return comNotice.init("账号为空！")
                }
                if(isinputnull.init("ipt-pwd")){
                    return comNotice.init("密码为空！")
                }
                var d={
                    "suid" :$(".ipt-user").val(),
                    "pwd" :$(".ipt-pwd").val()
                };
                loginData(JSON.stringify(d),function(){
                    comNotice.init("",true);
                },function(d){
                    comNotice.close();
                    if(0==d.LoginCode){
                        $(".mod-login").hide();
                        $(".mod-warp").show();
                        sessionStorage.setItem("webUid",$(".ipt-user").val());
                        sessionStorage.setItem("webPwd",$(".ipt-pwd").val());
                        sessionStorage.setItem("weiboLogin",1);
                        sessionStorage.setItem("weiUser",d.UserName);
                        sessionStorage.setItem("weiTime",(new Date()).Format("yyyy-MM-dd hh:mm:ss"));
                        //执行主模块
                        wb.main.page.i();
                    }else{
                        $(".login-err").empty().append(d.LoginMessage);
                    }
                });
            });
            $(document).on("keydown", ".unlogin",function(event) {
                if (event.keyCode=="13"){
                    if(isinputnull.init("ipt-user")){
                        return comNotice.init("账号为空！")
                    }
                    if(isinputnull.init("ipt-pwd")){
                        return comNotice.init("密码为空！")
                    }
                    var d={
                        "suid" :$(".ipt-user").val(),
                        "pwd" :$(".ipt-pwd").val()
                    };
                    loginData(JSON.stringify(d),function(){
                        comNotice.init("",true);
                    },function(d){
                        comNotice.close();
                        if(0==d.LoginCode){
                            $(".mod-login").hide();
                            $(".mod-warp").show();
                            sessionStorage.setItem("webUid",$(".ipt-user").val());
                            sessionStorage.setItem("webPwd",$(".ipt-pwd").val());
                            sessionStorage.setItem("weiboLogin",1);
                            sessionStorage.setItem("weiUser",d.UserName);
                            sessionStorage.setItem("weiTime",(new Date()).Format("yyyy-MM-dd hh:mm:ss"));
                            //执行主模块
                            wb.main.page.i();
                        }else{
                            $(".login-err").empty().append(d.LoginMessage);
                        }
                    });
                }
            })
        }
    }
};

wb.main={
    d:{
        s:-1,
        u:""
    },
    init:function(){
        //this.page.i();
        this.btn.i();
    },
    page:{
        i:function(){
            this.s();
            this.m();
        },
        s:function(){
            $(".mod-body").css("height",$(".mod-warp").height()-75);
            $(window).resize(function(){
                $(".mod-body").css("height",$(".mod-warp").height()-75);
            });
        },
        m:function(){
            $(".hu-name span").html(sessionStorage.getItem("weiUser"));
            $(".header-time span").html(sessionStorage.getItem("weiTime"));
            //首界面
            wb.main.btn.d(0);
        }
    },
    btn:{
        i:function(){
            this.e();
            this.o();
            this.t();
            this.s();
        },
        p:function(d){
            var param={
                title:"修改密码",
                bd:""
            };
            var c=$("#ChangePwd").html();
            param.bd=formatTemplate(d,c);
            MarkTip.init(param,"changePwd");
        },
        a:function(){
            var param={
                title:"添加管理员",
                bd:""
            };
            param.bd=$("#addUser").html();
            MarkTip.init(param,"addUser");
        },
        o:function(){
            var body=$("body"),_this=this;
            $(document).on("click",function(){
                $(".header-user").removeClass("active");
            });
            body.on("click",".sys-list .btn-edit",function () {
                var d={};
                d.user=wb.main.d.u=$(this).data("suid");
                d.pwd=$(this).parents("li").find("span[data-sys='pwd']").text();
                _this.p(d);
            });
            body.on("click",".hu-tip .btn-edit",function(){
                var d={};
                d.user=wb.main.d.u=sessionStorage.getItem("webUid");
                d.pwd=sessionStorage.getItem("webPwd");
                _this.p(d);
            });
            body.on("click",".btn[data-click='changePwd']",function(){
                if(isinputnull.init("cgpwd")){
                    return comNotice.init("新密码不能为空！");
                }
                var d={};
                d.suid=wb.main.d.u;
                d.pwd=$(".cgpwd").val();
                changePwd(JSON.stringify(d),function(){comNotice.init("",true)},function(d){
                    comNotice.close();
                    if(d==1){
                        comNotice.init("修改成功！");
                        $(".mc-sys").find("[data-cgpwd='"+wb.main.d.u+"']").text($(".cgpwd").val());
                        MarkTip.close();
                    }else{
                        comNotice.init("修改失败！")
                    }
                });
            });
            body.on("click",".add-sys a",function(){
                _this.a();
            });
            body.on("click",".btn[data-click='addUser']",function () {
                if(isinputnull.init("ipt-nid")){
                    return comNotice.init("用户名不能为空！");
                }
                if(isinputnull.init("ipt-nname")){
                    return comNotice.init("昵称不能为空！");
                }
                if(isinputnull.init("ipt-npwd")){
                    return comNotice.init("请输入密码！");
                }
                var d={};
                d.suid=$(".ipt-nid").val();
                d.suname=$(".ipt-nname").val();
                d.pwd=$(".ipt-npwd").val();
                addUser(JSON.stringify(d),function(){
                    comNotice.init("",true)
                },function(d){
                    comNotice.close();
                    if(0==d){
                        comNotice.init("未知错误！")
                    }else if(2==d){
                        comNotice.init("此用户已存在！")
                    }else{
                        comNotice.init("添加成功！");
                        MarkTip.close();
                        _this.d(3);
                    }
                })
            });
            body.on("click",".sys-list .btn-del",function(){
                var suid=$(this).data("suid");
                delUser(suid,function(){comNotice.init("",true)},function(d){
                    comNotice.close();
                    if(0==d){
                        comNotice.init("删除失败！")
                    }else if(2==d){
                        comNotice.init("系统管理员不可删除！")
                    }else if(1==d){
                        comNotice.init("删除成功！");
                        _this.d(3);
                    }
                })
            });
            body.on("click",".mc-sys .mod-page a",function(){
                var np=$(this).data("page");
                _this.d(3,np);
            });
            body.on("click",".mc-web .mod-page a",function(){
                var np=$(this).data("page");
                _this.d(2,np);
            });
            body.on("click",".mc-log .mod-page a",function(){
                var np=$(this).data("page");
                _this.d(1,np);
            });
        },
        e:function(){
            var body=$("body");
            body.on("click",".hu-main",function(e){
                e.stopPropagation();
                var that=$(this).parent(".header-user");
                if(that.hasClass("active")){
                    that.removeClass("active");
                }else{
                    that.addClass("active");
                }
            });
            //退出
            body.on("click",".hu-tip a[data-click='exit']",function(){
                sessionStorage.removeItem("weiboLogin");
                $(".mod-warp").hide();
                $(".mod-login").show();
            });
            body.on("click",".btn-execl",function(){
                var st=$("#iptStart").val(),et=$("#iptEnd").val();
                if(st==""||et==""){
                    return comNotice.init("请先选择时间段")
                }
                postbytime(st,et,function () {
                    comNotice.init("",true);
                },function(d){
                    comNotice.close();
                    console.log(d);
                    var tr=$("#exTr").html(),etr="";
                    $.each(d,function (i,v) {
                        etr+=formatTemplate(v,tr);
                    });
                    $(".tableToExcel tbody").append(etr);
                    $("#tableToExcel").tableExport({type:'excel',escape:'false'});
                });
            });
        },
        t:function(){
            var body=$("body");
            var _this=this;
            body.on("click",".mod-aside li",function(){
               if(!$(this).hasClass("active")){
                   $(this).addClass("active").siblings().removeClass("active");
                   var i=$(this).index();
                   if(i==2){
                       wb.main.d.s=-1;
                   }
                    _this.d(i);
               }
            });
        },
        s:function(){
            var body=$("body"),_this=this;
            body.on("click",".state-select",function(){
                if(!$(this).hasClass("active")){
                    $(this).addClass("active");
                }
            });
            body.on("click",".s-list li", function (e) {
                e.stopPropagation();
                wb.main.d.s=$(this).data("type");
                $(".state-select").removeClass("active");
                _this.d(2);
            });
            body.on("click",".mcd-s-0 .btn-pull",function(){
                webStart(function(d){
                    if(2==d){
                        comNotice.init("抓取正在进行")
                    }else if(0==d){
                        comNotice.init("未知错误")
                    }else if(1==d){
                        comNotice.init("启动成功");
                        sessionStorage.setItem("webStart","1");
                        $(".mcd-hd").removeClass("mcd-s-0").addClass("mcd-s-1");
                        $(".mc-stxt").text("数据抓取中");
                    }
                });
            });
            body.on("click",".mcd-s-2 .btn-pull",function(){
                webStart(function(d){
                    if(2==d){
                        comNotice.init("抓取正在进行")
                    }else if(0==d){
                        comNotice.init("未知错误")
                    }else if(1==d){
                        comNotice.init("启动成功");
                        sessionStorage.setItem("webStart","1");
                        $(".mcd-hd").removeClass("mcd-s-2").addClass("mcd-s-1");
                        $(".mc-stxt").text("数据抓取中");
                    }
                });
            });
            body.on("click",".mcd-s-1 .btn-pull",function(){
                var mp={};
                mp.sc="minPop";
                mp.bd="确定取消抓取吗";
                MarkTip.init(mp,"pullCancel");
            });
            body.on("click",".btn[data-click='pullCancel']",function(){
                MarkTip.close();
                webStop(function () {
                    $(".mcd-hd").removeClass("mcd-s-1").addClass("mcd-s-2");
                    $(".mc-stxt").text("已取消抓取");
                    sessionStorage.setItem("webStart","0");
                });
            });
        },
        d:function(i,np){
            var b=$(".mod-content .mc-con");
            var _this=this;
            var page=np||1;
            switch (i){
                case 0:
                    b.empty().append($("#mc0").html());
                    //工作时长暂时假数据
                    $(".mcd-num[data-count='time']").html("56");
                    usercount(function(n){
                        n=addCommas(n);
                        $(".mcd-num[data-count='user']").html(n);
                    });
                    tweetcount(function (n) {
                        n=addCommas(n);
                        $(".mcd-num[data-count='tweet']").html(n);
                    });
                    if(sessionStorage.getItem("webStart")==1){
                        $(".mcd-hd").removeClass("mcd-s-0 mcd-s-2").addClass("mcd-s-1");
                        $(".mc-stxt").text("数据抓取中");
                    }
                    $('#iptStart').jeDate({
                        isinitVal:true,
                        format: 'YYYY-MM-DD' // 分隔符可以任意定义，该例子表示只显示年月
                    });
                    $('#iptEnd').jeDate({
                        isinitVal:true,
                        format: 'YYYY-MM-DD' // 分隔符可以任意定义，该例子表示只显示年月
                    });
                    break;
                case 1:
                    var log=$("#mc1").html();
                    var tr=$("#logTr").html();
                    syslog(page,function () {
                        comNotice.init("",true);
                    },function(d){
                        var curp=d.curPageNum;
                        var allp=d.pageCount;
                        comNotice.close();
                        b.empty().append(log);
                        _this.n(curp,allp,$(".mc-log"));
                        var tb="";
                        $.each(d.resultList,function(i,v){
                            v.logNum=i+(page-1)*10+1;
                            tb+=formatTemplate(v,tr);
                        });
                        $(".log-table tbody").append(tb);
                    });
                    break;
                case 2:
                    var web=$("#mc2").html();
                    var wtr=$("#webTr").html();
                    var txt="";
                    if(wb.main.d.s==-1){
                        txt="全部"
                    }else if(wb.main.d.s==0){
                        txt="已使用"
                    }else if(wb.main.d.s==1){
                        txt="未使用"
                    }
                    sinauser(page,wb.main.d.s,function () {
                        comNotice.init("",true);
                    },function(d){
                        var curp = d.curPageNum;
                        var allp = d.pageCount;
                        comNotice.close();
                        b.empty().append(web);
                        _this.n(curp,allp,$(".mc-web"));
                        var tb="";
                        $.each(d.resultList,function (i,v) {
                            var nv={};
                            nv.webNum=i+(page-1)*8+1;
                            nv.avaiable=v.avaiable?"未使用":"已使用";
                            nv.state=v.avaiable?"0":"1";
                            nv.sid=v.sid;
                            tb +=formatTemplate(nv,wtr);
                        });
                        $(".web-table tbody").append(tb);
                        $(".state-select span").text(txt);
                    });
                    break;
                case 3:
                    var sys=$("#mc3").html();
                    var li=$("#sysLi").html();
                    sysuser(page,function () {
                       comNotice.init("",true);
                    },function (d) {
                        var curp=d.curPageNum;
                        var allp=d.pageCount;
                        comNotice.close();
                        b.empty().append(sys);
                        _this.n(curp,allp,$(".mc-sys"));
                        var nli="";
                        $.each(d.resultList,function (i,v) {
                            v.sysNum=i+(page-1)*8+1;
                            nli+=formatTemplate(v,li);
                        });
                        $(".mc-sys li[data-sys='add']").after(nli);
                    });
                    break;
            }
        },
        n:function(c,a,e){
             if(a<=1) return;
             else{
                var p=$("#page").html();
                e.append(p);
                 $(".pageAll").text(a);
                var pre=$(".prev-page"),next=$(".next-page");
                for(var i=0;i<a;i++){
                    var $a="";
                    if(c!=i+1){
                        if(c+3>i||i>a-4){
                            $a='<a href="javascript:;" data-page="'+(i+1)+'">'+(i+1)+'</a>';
                        }else if(i>=c+3&&i==a-4){
                            $a='<span>...</span>'
                        }
                    }else{
                        $a='<span class="active">'+c+'</span>'
                    }
                    next.before($a);
                }
                if(c==1){
                    pre.hide();
                }
                if(c==a){
                    next.hide();
                }
            }
        }
    }
};

wb.main.btn.i();
