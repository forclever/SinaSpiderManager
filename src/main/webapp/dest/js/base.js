Date.prototype.Format = function(fmt) {
    var o = {
        "M+": this.getMonth() + 1,
        "d+": this.getDate(),
        "h+": this.getHours(),
        "m+": this.getMinutes(),
        "s+": this.getSeconds(),
        "q+": Math.floor((this.getMonth() + 3) / 3),
        "S": this.getMilliseconds()
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o) if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt
};
var comNotice = {
    init: function(txt, isloading, time) {
        this.close();
        var $notice = $("<div/>").addClass("mod-notice").appendTo("body");
        var $txt = $("<p/>").text(txt).appendTo($notice);
        if (isloading) {
            loading.init($notice,true);
        }
        var tm = time * 1000 || 2000;
        setTimeout(function() {
                $notice.remove()
            },
            tm)
    },
    close: function() {
        $(".mod-notice").remove()
    }
};

var MarkTip = {
    init: function(p,fun,btn) {
        var modTip = $("<div/>").addClass("mod-pop").appendTo("body");
        var modMark = $("<div/>").addClass("pop-mark").appendTo("body");
        var tipHd=$("<div/>").addClass("pop-hd").append('<h2>'+ p.title+'</h2><a href="javascript:;" class="btn btn-close">X</a>').appendTo(modTip);
        var tipBd = $("<div/>").addClass("pop-bd").append(p.bd).appendTo(modTip);
        var tipFt = $("<div/>").addClass("pop-ft").appendTo(modTip);
        var btn1='<a href="javascript:;" class="btn btn-cancel" data-click="cancel">取消</a>';
        var btn2='<a href="javascript:;" class="btn btn-sure" data-click="'+fun+'">确认</a>';
        if(btn){
            var btn3='<a href="javascript:;" data-click="'+fun+'">'+btn+'</a>';
            tipFt.addClass("oneBtn").append(btn3);
        }else{
            tipFt.append(btn2,btn1);
        }
        this.cancel();
    },
    close: function() {
        $(".mod-pop").remove();
        $(".pop-mark").remove()
    },
    cancel:function(){
        var body=$("body");
        var _this=this;
        body.on("click",".mod-pop .btn-cancel[data-click='cancel']",function(){
            _this.close();
        });
        body.on("click",".mod-pop .btn-close",function(){
            _this.close();
        });
    }
};

var loading={
    init:function(box,isPage){
        var $loading = $("<div/>").addClass("ball-spin-fade-loader");
        for (var i = 0; i < 8; i++) {
            $("<div/>").appendTo($loading)
        }
        if(isPage){
            box.prepend($loading)
        }else{
            var $Div=$("<div/>").addClass("loadDiv").append($loading).appendTo(box);
        }
    }
};

var vailNum = {
    init: function(value) {
        //value=value.replace(/\s/g,"");
        var strArray = ['139', '138', '137', '136', '135', '134', '147', '150', '151', '152', '157', '158', '159', '182', '183', '184', '187', '188', '130', '131', '132', '155', '156', '185', '186', '145', '133', '153', '180', '181', '189', '177'];
        var mobile = new RegExp('^(' + strArray.join('|') + ')\\d{8}$');
        return mobile.test($.trim(value))
    }
};
var isinputnull = {
    init: function(ipt) {
        var flag = false;
        $("." + ipt).each(function() {
            var _val = $(this).val();
            if (!_val || '' === _val) {
                flag = true;
                return false
            }
        });
        return flag
    }
};
