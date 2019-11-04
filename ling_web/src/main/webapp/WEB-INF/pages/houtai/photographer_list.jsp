<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 摄影师列表 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel  heading-border">
                <div class="panel-menu">
                    <div class="row">
                        <div class="hidden-xs hidden-sm col-md-3">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-refresh"></i>
                                </button>
                               <%-- <button type="button" class="btn btn-default light">
                                    <i class="fa fa-trash"></i>
                                </button>--%>
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-plus" onclick="javascript:window.location.href='<c:url value='/houtai/photographer/to_add'/>';"></i>
                                </button>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-9 text-right">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-chevron-left"></i>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-chevron-right"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body pn">
                    <table id="message-table" class="table admin-form theme-warning tc-checkbox-1">
                        <thead>
                        <tr class="">
                            <th class="text-center hidden-xs">Select</th>
                            <th class="hidden-xs">摄影师编号</th>
                            <th class="hidden-xs">姓名</th>
                            <th class="hidden-xs">性别</th>
                            <th class="hidden-xs">年龄</th>
                            <th class="hidden-xs">电话</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="photoGrapher">
                        <tr class="message-unread">
                            <td class="hidden-xs">
                                <label class="option block mn">
                                    <input type="checkbox" name="mobileos" value="FR">
                                    <span class="checkbox mn"></span>
                                </label>
                            </td>
                            <td>${photoGrapher.sSno}</td>
                            <td>${photoGrapher.sName}</td>
                            <td>${photoGrapher.sSex}</td>
                            <td class="hidden-xs">
                                <span class="badge badge-warning mr10 fs11">${photoGrapher.sAge}</span>
                            </td>
                            <td>${photoGrapher.sPhone}</td>
                            <td>
                                <a href="<c:url value="/houtai/photographer/to_update?sSno=${photoGrapher.sSno}"/>">编辑</a>
                                <a onclick="return confirm('将要删除摄影师：${photoGrapher.sName}，是否继续？')" href="<c:url value="/houtai/photographer/remove?sSno=${photoGrapher.sSno}"/>">删除</a>
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>