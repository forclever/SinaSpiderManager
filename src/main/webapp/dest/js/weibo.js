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
                wb.main.init();
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
                        sessionStorage.setItem("weiboLogin",1);
                        sessionStorage.setItem("weiUser",d.UserName);
                        sessionStorage.setItem("weiTime",(new Date()).Format("yyyy-MM-dd hh:mm:ss"));
                        //执行主模块
                        wb.main.init();
                    }else{
                        $(".login-err").empty().append(d.LoginMessage);
                    }
                });
            })
        }
    }
};

wb.main={
    init:function(){
        this.page.i();
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
        }
    },
    btn:{
        i:function(){
           // this.p();
            this.e();
            this.o();
            this.t();
            this.s();
        },
        p:function(){
            var param={
                title:"修改密码",
                bd:""
            };
            param.bd=$("#ChangePwd").html();
            MarkTip.init(param,"changePwd");
        },
        o:function(){
            $(document).on("click",function(){
                $(".header-user").removeClass("active");
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
        },
        t:function(){
            var body=$("body");
            body.on("click",".mod-aside li",function(){
               if(!$(this).hasClass("active")){
                   $(this).addClass("active").siblings().removeClass("active");
                   var i=$(this).index();
                   $(".mod-content .mc-con").eq(i).addClass("active").siblings("active");
               }
            });
        },
        s:function(){
            var body=$("body");
            body.on("click",".state-select",function(){
                if(!$(this).hasClass("active")){
                    $(this).addClass("active");
                }
            });
            body.on("click",".s-list li", function (e) {
                e.stopPropagation();
               var txt=$(this).text();
                $(".state-select span").text(txt);
                $(".state-select").removeClass("active");
            });
        }
    }
};
























