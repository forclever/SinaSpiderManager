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
                        <li><a href="javascript:;"><i class="ico ico-pwd1"></i>修改密码</a></li>
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
                <!--page1-->
                <div class="mc-con">
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
                                    <div class="mcd-num">1236.3</div>
                                    <div class="mcd-unit">小时</div>
                                </li>
                                <li>
                                    <div class="mcd-title">用户数量：</div>
                                    <div class="mcd-pic"><i class="ico ico-duser"></i></div>
                                    <div class="mcd-num">236,135</div>
                                    <div class="mcd-unit">人</div>
                                </li>
                                <li>
                                    <div class="mcd-title">采集数据量：</div>
                                    <div class="mcd-pic"><i class="ico ico-dnum"></i></div>
                                    <div class="mcd-num">1,236,135</div>
                                    <div class="mcd-unit">条</div>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!--end page1-->
                <!--page2-->
                <div class="mc-con" style="display: none;">
                    <div class="mc-log">
                        <table class="log-table">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>开始时间</th>
                                <th>结束时间</th>
                                <th>用户数</th>
                                <th>总条数</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>01</td>
                                <td>2016-12-01 12:00:56</td>
                                <td>2016-12-20 12:00:56</td>
                                <td>12,031,445</td>
                                <td>12,031,445</td>
                            </tr>
                            <tr>
                                <td>02</td>
                                <td>2016-12-01 12:00:56</td>
                                <td>2016-12-20 12:00:56</td>
                                <td>12,031,445</td>
                                <td>12,031,445</td>
                            </tr>
                            <tr>
                                <td>03</td>
                                <td>2016-12-01 12:00:56</td>
                                <td>2016-12-20 12:00:56</td>
                                <td>12,031,445</td>
                                <td>12,031,445</td>
                            </tr>
                            <tr>
                                <td>04</td>
                                <td>2016-12-01 12:00:56</td>
                                <td>2016-12-20 12:00:56</td>
                                <td>12,031,445</td>
                                <td>12,031,445</td>
                            </tr>
                            <tr>
                                <td>05</td>
                                <td>2016-12-01 12:00:56</td>
                                <td>2016-12-20 12:00:56</td>
                                <td>12,031,445</td>
                                <td>12,031,445</td>
                            </tr>
                            <tr>
                                <td>06</td>
                                <td>2016-12-01 12:00:56</td>
                                <td>2016-12-20 12:00:56</td>
                                <td>12,031,445</td>
                                <td>12,031,445</td>
                            </tr>
                            <tr>
                                <td>07</td>
                                <td>2016-12-01 12:00:56</td>
                                <td>2016-12-20 12:00:56</td>
                                <td>12,031,445</td>
                                <td>12,031,445</td>
                            </tr>
                            <tr>
                                <td>08</td>
                                <td>2016-12-01 12:00:56</td>
                                <td>2016-12-20 12:00:56</td>
                                <td>12,031,445</td>
                                <td>12,031,445</td>
                            </tr>
                            <tr>
                                <td>09</td>
                                <td>2016-12-01 12:00:56</td>
                                <td>2016-12-20 12:00:56</td>
                                <td>12,031,445</td>
                                <td>12,031,445</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>2016-12-01 12:00:56</td>
                                <td>2016-12-20 12:00:56</td>
                                <td>12,031,445</td>
                                <td>12,031,445</td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="mod-page">
                            <div class="mp-bd">
                                <a href="javascript:;" class="prev-page"><i class="ico-arrow-left"></i>上一页</a>
                                <a href="javascript:;">1</a>
                                <span class="active">2</span>
                                <a href="javascript:;">3</a>
                                <a href="javascript:;">4</a>
                                <a href="javascript:;">5</a>
                                <span>...</span>
                                <a href="javascript:;">6</a>
                                <a href="javascript:;" class="prev-page">下一页<i class="ico-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end page2-->
                <!--page3-->
                <div class="mc-con" style="display: none;">
                    <div class="mc-web">
                        <table class="web-table">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>用户名</th>
                                <th width="200" class="tb-left">
                                    <div class="web-state">状态
                                        <div class="state-select">
                                            <span>全部</span>
                                            <ol class="s-list">
                                                <li>全部</li>
                                                <li>未使用</li>
                                                <li>已使用</li>
                                            </ol>
                                        </div>
                                    </div>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>01</td>
                                <td><div class="web-user"><img src="<%=request.getContextPath()%>/dest/images/webpic.jpg" alt=""><span>高原原</span></div></td>
                                <td class="tb-left"><span class="user-state-0">未使用</span></td>
                            </tr>
                            <tr>
                                <td>02</td>
                                <td><div class="web-user"><img src="<%=request.getContextPath()%>/dest/images/webpic.jpg" alt=""><span>高原原</span></div></td>
                                <td class="tb-left"><span class="user-state-1">已使用</span></td>
                            </tr>
                            <tr>
                                <td>03</td>
                                <td><div class="web-user"><img src="<%=request.getContextPath()%>/dest/images/webpic.jpg" alt=""><span>高原原</span></div></td>
                                <td class="tb-left"><span class="user-state-1">已使用</span></td>
                            </tr>
                            <tr>
                                <td>04</td>
                                <td><div class="web-user"><img src="<%=request.getContextPath()%>/dest/images/webpic.jpg" alt=""><span>高原原</span></div></td>
                                <td class="tb-left"><span class="user-state-0">未使用</span></td>
                            </tr>
                            <tr>
                                <td>05</td>
                                <td><div class="web-user"><img src="<%=request.getContextPath()%>/dest/images/webpic.jpg" alt=""><span>高原原</span></div></td>
                                <td class="tb-left"><span class="user-state-0">已使用</span></td>
                            </tr>
                            <tr>
                                <td>06</td>
                                <td><div class="web-user"><img src="<%=request.getContextPath()%>/dest/images/webpic.jpg" alt=""><span>高原原</span></div></td>
                                <td class="tb-left"><span class="user-state-0">未使用</span></td>
                            </tr>
                            <tr>
                                <td>07</td>
                                <td><div class="web-user"><img src="<%=request.getContextPath()%>/dest/images/webpic.jpg" alt=""><span>高原原</span></div></td>
                                <td class="tb-left"><span class="user-state-1">已使用</span></td>
                            </tr>
                            <tr>
                                <td>08</td>
                                <td><div class="web-user"><img src="<%=request.getContextPath()%>/dest/images/webpic.jpg" alt=""><span>高原原</span></div></td>
                                <td class="tb-left"><span class="user-state-0">未使用</span></td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="mod-page">
                            <div class="mp-bd">
                                <a href="javascript:;" class="prev-page"><i class="ico-arrow-left"></i>上一页</a>
                                <a href="javascript:;">1</a>
                                <span class="active">2</span>
                                <a href="javascript:;">3</a>
                                <a href="javascript:;">4</a>
                                <a href="javascript:;">5</a>
                                <span>...</span>
                                <a href="javascript:;">6</a>
                                <a href="javascript:;" class="prev-page">下一页<i class="ico-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end page3-->
                <!--page4-->
                <div class="mc-con" style="display: none;">
                    <div class="mc-sys">
                        <div class="sys-list">
                            <ul>
                                <li><div class="add-sys"><a href="javascript:;"><i class="ico ico-add"></i><p>添加管理员</p></a></div></li>
                                <li>
                                    <div class="sys-item">
                                        <div class="sys-num">1</div>
                                        <div class="sys-bd">
                                            <div><label for="">名称：</label><span>高原原</span></div>
                                            <div><label for="">密码：</label><span>123456</span></div>
                                        </div>
                                        <div class="sys-ft">
                                            <a href="javascript:;" class="btn btn-edit"><i class="ico ico-edit"></i></a>
                                            <a href="javascript:;" class="btn btn-del"><i class="ico ico-del"></i></a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="sys-item">
                                        <div class="sys-num">2</div>
                                        <div class="sys-bd">
                                            <div><label for="">名称：</label><span>高原原</span></div>
                                            <div><label for="">密码：</label><span>123456</span></div>
                                        </div>
                                        <div class="sys-ft">
                                            <a href="javascript:;" class="btn btn-edit"><i class="ico ico-edit"></i></a>
                                            <a href="javascript:;" class="btn btn-del"><i class="ico ico-del"></i></a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="sys-item">
                                        <div class="sys-num">3</div>
                                        <div class="sys-bd">
                                            <div><label for="">名称：</label><span>高原原</span></div>
                                            <div><label for="">密码：</label><span>123456</span></div>
                                        </div>
                                        <div class="sys-ft">
                                            <a href="javascript:;" class="btn btn-edit"><i class="ico ico-edit"></i></a>
                                            <a href="javascript:;" class="btn btn-del"><i class="ico ico-del"></i></a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="sys-item">
                                        <div class="sys-num">4</div>
                                        <div class="sys-bd">
                                            <div><label for="">名称：</label><span>高原原</span></div>
                                            <div><label for="">密码：</label><span>123456</span></div>
                                        </div>
                                        <div class="sys-ft">
                                            <a href="javascript:;" class="btn btn-edit"><i class="ico ico-edit"></i></a>
                                            <a href="javascript:;" class="btn btn-del"><i class="ico ico-del"></i></a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="sys-item">
                                        <div class="sys-num">5</div>
                                        <div class="sys-bd">
                                            <div><label for="">名称：</label><span>高原原</span></div>
                                            <div><label for="">密码：</label><span>123456</span></div>
                                        </div>
                                        <div class="sys-ft">
                                            <a href="javascript:;" class="btn btn-edit"><i class="ico ico-edit"></i></a>
                                            <a href="javascript:;" class="btn btn-del"><i class="ico ico-del"></i></a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="sys-item">
                                        <div class="sys-num">6</div>
                                        <div class="sys-bd">
                                            <div><label for="">名称：</label><span>高原原</span></div>
                                            <div><label for="">密码：</label><span>123456</span></div>
                                        </div>
                                        <div class="sys-ft">
                                            <a href="javascript:;" class="btn btn-edit"><i class="ico ico-edit"></i></a>
                                            <a href="javascript:;" class="btn btn-del"><i class="ico ico-del"></i></a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="sys-item">
                                        <div class="sys-num">7</div>
                                        <div class="sys-bd">
                                            <div><label for="">名称：</label><span>高原原</span></div>
                                            <div><label for="">密码：</label><span>123456</span></div>
                                        </div>
                                        <div class="sys-ft">
                                            <a href="javascript:;" class="btn btn-edit"><i class="ico ico-edit"></i></a>
                                            <a href="javascript:;" class="btn btn-del"><i class="ico ico-del"></i></a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="sys-item">
                                        <div class="sys-num">8</div>
                                        <div class="sys-bd">
                                            <div><label for="">名称：</label><span>高原原</span></div>
                                            <div><label for="">密码：</label><span>123456</span></div>
                                        </div>
                                        <div class="sys-ft">
                                            <a href="javascript:;" class="btn btn-edit"><i class="ico ico-edit"></i></a>
                                            <a href="javascript:;" class="btn btn-del"><i class="ico ico-del"></i></a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="mod-page">
                            <div class="mp-bd">
                                <a href="javascript:;" class="prev-page"><i class="ico-arrow-left"></i>上一页</a>
                                <a href="javascript:;">1</a>
                                <span class="active">2</span>
                                <a href="javascript:;">3</a>
                                <a href="javascript:;">4</a>
                                <a href="javascript:;">5</a>
                                <span>...</span>
                                <a href="javascript:;">6</a>
                                <a href="javascript:;" class="prev-page">下一页<i class="ico-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end page4-->
            </div>
        </div>
    </div>
</div>

<script type="text/template" id="ChangePwd">
    <ul class="changePwd">
        <li><label for="">用户名</label>{user}</li>
        <li><label for="">原始密码</label><input type="text" placeholder="请输入原始密码"></li>
        <li><label for="">新密码</label><input type="text" placeholder="请输入新密码"></li>
    </ul>
</script>
<script src="<%=request.getContextPath()%>/dest/js/jedate.js"></script>
<script src="<%=request.getContextPath()%>/dest/js/weibo.js"></script>
<script src="<%=request.getContextPath()%>/dest/js/data.js"></script>
<script>
    (function(){
        wb.login.init();
        var start = {
            dateCell: '#iptStart',
            format: 'YYYY-MM-DD hh:mm',
            minDate: '2015-10-16 12:59', //设定最小日期为当前日期
            isinitVal:true,
            festival:true,
            maxDate: '2099-06-16 23:59:59', //最大日期
            isTime: true,
            choosefun: function(elem,datas){
                end.minDate = datas; //开始日选好后，重置结束日的最小日期
            }
        };
        var end = {
            dateCell: '#iptEnd',
            format: 'YYYY-MM-DD hh:mm',
            minDate: jeDate.now(0),//, //设定最小日期为当前日期
            isinitVal:true,
            festival:true,
            maxDate: '2099-06-16 23:59:59', //最大日期
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
