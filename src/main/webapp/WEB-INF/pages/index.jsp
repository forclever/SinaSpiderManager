<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>微博爬虫</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/dest/css/weibo.css">
    <script src="<%=request.getContextPath()%>/dest/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/dest/js/base.js"></script>
</head>
<body>
<div class="mod-login" style="display: none;">
    <div class="login-hd">实时微博数据采集系统<br/>Real-time Weibo Data Collection System</div>
    <div class="login-bd">
        <form action="">
            <ul>
                <li><label for=""><i class="ico ico-user"></i></label><input type="text" class="ipt ipt-user" placeholder="请输入账户"></li>
                <li><label for=""><i class="ico ico-pwd"></i></label><input type="password" class="ipt ipt-pwd" placeholder="请输入密码"></li>
                <li class="login-err"></li>
            </ul>
            <a href="javascript:;" class="btn btn-login">登录</a>
        </form>
    </div>
</div>
<div class="mod-warp" style="display: none">
    <div class="mod-header">
        <div class="header-left">
            <h1>实时微博数据采集系统</h1>
        </div>
        <div class="header-right">
            <div class="header-user">
                <div class="hu-main">
                    <div class="hu-pic"><img src="<%=request.getContextPath()%>/dest/images/admin-pic.png" alt=""></div>
                    <div class="hu-name">管理员：<span>loading...</span><i class="ico-arrow"></i></div>
                </div>
                <div class="hu-tip">
                    <ol>
                        <li><a href="javascript:;" class="btn-edit"><i class="ico ico-pwd1"></i>修改密码</a></li>
                        <li><a href="javascript:;" data-click="exit"><i class="ico ico-exit"></i>退出</a></li>
                    </ol>
                </div>
            </div>
            <div class="header-time">登录时间：<span>loading...</span></div>
        </div>
    </div>
    <div class="mod-body">
        <div class="mod-aside">
            <ul class="aside-list">
                <li class="active">
                    <i class="ico ico-sina"></i>
                    新浪微博
                </li>
                <li>
                    <i class="ico ico-log"></i>
                    采集日志
                </li>
                <li>
                    <i class="ico ico-wbuser"></i>
                    微博用户
                </li>
                <li>
                    <i class="ico ico-sysuser"></i>
                    系统用户
                </li>
            </ul>
        </div>
        <div class="mod-main">
            <div class="mod-content">
                <div class="mc-con"></div>
            </div>
        </div>
    </div>
</div>
<div class="tableHide">
    <table id="tableToExcel" class="tableToExcel">
        <thead>
        <tr>
            <th>uid</th>
            <th>tid</th>
            <th>time</th>
            <th>text</th>
            <th>sharecount</th>
            <th>rumor</th>
            <th>repostcommentcount</th>
            <th>regposttime</th>
            <th>mid</th>
            <th>attributescount</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>
</div>
<script type="text/template" id="mc0">
    <div class="mc-screen">
        <label for="">时间：</label>
        <a href="javascript:;" class="btn btn-execl">导出execl</a>
        <div class="ms-tbox">
            <input type="text" id="iptStart" readonly>
            <span>--</span>
            <input type="text" id="iptEnd" readonly>
        </div>
    </div>
    <div class="mc-data">
        <div class="mcd-hd mcd-s-0">
            <div class="mcd-state">
                <div class="mc-spic">
                    <i class="ico ico-pull"></i>
                </div>
                <div class="mc-stxt">数据抓取未开启</div>
            </div>
            <div class="mcd-btn">
                <a href="javascript:;" class="btn btn-pull">立即开启</a>
            </div>
        </div>
        <div class="mcd-bd">
            <ol>
                <li>
                    <div class="mcd-title">已工作时间：</div>
                    <div class="mcd-pic"><i class="ico ico-dtime"></i></div>
                    <div class="mcd-num" data-count="time">loading...</div>
                    <div class="mcd-unit">小时</div>
                </li>
                <li>
                    <div class="mcd-title">用户数量：</div>
                    <div class="mcd-pic"><i class="ico ico-duser"></i></div>
                    <div class="mcd-num" data-count="user">loading...</div>
                    <div class="mcd-unit">人</div>
                </li>
                <li>
                    <div class="mcd-title">采集数据量：</div>
                    <div class="mcd-pic"><i class="ico ico-dnum"></i></div>
                    <div class="mcd-num" data-count="tweet">loading...</div>
                    <div class="mcd-unit">条</div>
                </li>
            </ol>
        </div>
    </div>
</script>
<script type="text/template" id="mc1">
    <div class="mc-log">
        <table class="log-table">
            <thead>
            <tr>
                <th width="50">序号</th>
                <th>开始时间</th>
                <th>信息</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</script>
<script type="text/template" id="logTr">
    <tr>
        <td>{logNum}</td>
        <td>{logtime}</td>
        <td>{message}</td>
    </tr>
</script>
<script type="text/template" id="mc2">
    <div class="mc-web">
        <table class="web-table">
            <thead>
            <tr>
                <th width="50">序号</th>
                <th>用户名</th>
                <th width="200" class="tb-left">
                    <div class="web-state">状态
                        <div class="state-select">
                            <span>全部</span>
                            <ol class="s-list">
                                <li data-type="-1">全部</li>
                                <li data-type="1">未使用</li>
                                <li data-type="0">已使用</li>
                            </ol>
                        </div>
                    </div>
                </th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</script>
<script type="text/template" id="webTr">
    <tr>
        <td>{webNum}</td>
        <td><div class="web-user"><img src="<%=request.getContextPath()%>/dest/images/webpic.png" alt=""><span>{sid}</span></div></td>
        <td class="tb-left"><span class="user-state-{state}">{avaiable}</span></td>
    </tr>
</script>
<script type="text/template" id="mc3">
    <div class="mc-sys">
        <div class="sys-list">
            <ul>
                <li data-sys="add"><div class="add-sys"><a href="javascript:;"><i class="ico ico-add"></i><p>添加管理员</p></a></div></li>
            </ul>
        </div>
    </div>
</script>
<script type="text/template" id="sysLi">
    <li>
        <div class="sys-item">
            <div class="sys-num">{sysNum}</div>
            <div class="sys-bd">
                <div><label for="">名称：</label><span>{suname}</span></div>
                <div><label for="">密码：</label><span data-sys="pwd" data-cgpwd="{suid}">{pwd}</span></div>
            </div>
            <div class="sys-ft">
                <a href="javascript:;" data-suid="{suid}" class="btn btn-edit"><i class="ico ico-edit"></i></a>
                <a href="javascript:;" data-suid="{suid}" class="btn btn-del"><i class="ico ico-del"></i></a>
            </div>
        </div>
    </li>
</script>
<script type="text/template" id="page">
    <div class="mod-page">
        <div class="mp-bd">
            <a href="javascript:;" class="prev-page"><i class="ico-arrow-left"></i>上一页</a>
            <a href="javascript:;" class="next-page">下一页<i class="ico-arrow-right"></i></a>
            <em>共<i class="pageAll"></i>页</em>
        </div>
    </div>
</script>
<script type="text/template" id="ChangePwd">
    <ul class="changePwd">
        <li><label for="">用户名</label>{user}</li>
        <li><label for="">原始密码</label><input type="text" readonly value="{pwd}"></li>
        <li><label for="">新密码</label><input type="password" class="cgpwd" placeholder="请输入新密码"></li>
    </ul>
</script>
<script type="text/template" id="addUser">
    <ul class="addUser">
        <li><label for="">用户名</label><input type="text" class="ipt-nid" placeholder="请输入用户名"></li>
        <li><label for="">昵称</label><input type="text" class="ipt-nname" placeholder="请输入昵称"></li>
        <li><label for="">新密码</label><input type="password" class="ipt-npwd" placeholder="请输入密码"></li>
    </ul>
</script>
<script type="text/template" id="exTr">
    <tr>
        <td>{uid}</td>
        <td>{tid}</td>
        <td>{time}</td>
        <td>{text}</td>
        <td>{sharecount}</td>
        <td>{rumor}</td>
        <td>{repostcommentcount}</td>
        <td>{regposttime}</td>
        <td>{mid}</td>
        <td>{attributescount}</td>
    </tr>
</script>
<script src="<%=request.getContextPath()%>/dest/js/jquery.base64.js"></script>
<script src="<%=request.getContextPath()%>/dest/js/tableExport.js"></script>
<script src="<%=request.getContextPath()%>/dest/js/jedate.js"></script>
<script src="<%=request.getContextPath()%>/dest/js/weibo.js"></script>
<script src="<%=request.getContextPath()%>/dest/js/data.js"></script>
<script>
    (function(){
        wb.login.init();
        var start = {
            dateCell: '#iptStart',
            format: 'YYYY-MM-DD',
            minDate: '2015-10-16', //设定最小日期为当前日期
            isinitVal:true,
            festival:true,
            maxDate: '2099-06-16', //最大日期
            isTime: true,
            choosefun: function(elem,datas){
                end.minDate = datas; //开始日选好后，重置结束日的最小日期
            }
        };
        var end = {
            dateCell: '#iptEnd',
            format: 'YYYY-MM-DD',
            minDate: jeDate.now(0),//, //设定最小日期为当前日期
            isinitVal:true,
            festival:true,
            maxDate: '2099-06-16', //最大日期
            isTime: true,
            choosefun: function(elem,datas){
                start.maxDate = datas; //将结束日的初始值设定为开始日的最大日期
            },
            okfun:function(){

            }
        };
        jeDate(start);
        jeDate(end);

    })();
</script>
</body>
</html>
