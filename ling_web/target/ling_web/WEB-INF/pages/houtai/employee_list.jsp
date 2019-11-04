<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 员工列表 </h2>
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
                                <%--<button type="button" class="btn btn-default light">
                                    <i class="fa fa-trash"></i>
                                </button>--%>
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-plus" onclick="javascript:window.location.href='<c:url value='/houtai/employee/to_add'/>';"></i>
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
                            <th class="hidden-xs">工号</th>
                            <th class="hidden-xs">姓名</th>
                            <th class="hidden-xs">性别</th>
                            <th class="hidden-xs">年龄</th>
                            <th class="hidden-xs">家庭住址</th>
                            <th class="hidden-xs">联系电话</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="employee">
                        <tr class="message-unread">
                            <td class="hidden-xs">
                                <label class="option block mn">
                                    <input type="checkbox" name="mobileos" value="FR">
                                    <span class="checkbox mn"></span>
                                </label>
                            </td>
                            <td>${employee.eno}</td>
                            <td>${employee.eName}</td>
                            <td>${employee.eSex}</td>
                            <td class="hidden-xs">
                                <span class="badge badge-warning mr10 fs11">${employee.eAge}</span>
                            </td>
                            <td>${employee.eAddress}</td>
                            <td>${employee.ePhone}</td>
                            <td>
                                <a href="<c:url value="/houtai/employee/to_update?eno=${employee.eno}"/>">编辑</a>
                                <a onclick="return confirm('将要删除员工：${employee.eName}，是否继续？')" href="<c:url value="/houtai/employee/remove?eno=${employee.eno}"/>">删除</a>
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