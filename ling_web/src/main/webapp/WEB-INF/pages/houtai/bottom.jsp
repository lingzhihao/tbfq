<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</section>
</div>
<style>
    /* demo page styles */
    body { min-height: 2300px; }

    .content-header b,
    .admin-form .panel.heading-border:before,
    .admin-form .panel .heading-border:before {
        transition: all 0.7s ease;
    }
    /* responsive demo styles */
    @media (max-width: 800px) {
        .admin-form .panel-body { padding: 18px 12px; }
    }
</style>

<style>
    .ui-datepicker select.ui-datepicker-month,
    .ui-datepicker select.ui-datepicker-year {
        width: 48%;
        margin-top: 0;
        margin-bottom: 0;

        line-height: 25px;
        text-indent: 3px;

        color: #888;
        border-color: #DDD;
        background-color: #FDFDFD;

        -webkit-appearance: none; /*Optionally disable dropdown arrow*/
    }
</style>
<script src="<c:url value="/vendor/jquery/jquery-1.11.1.min.js"/>"></script>
<script src="<c:url value="/vendor/jquery/jquery_ui/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/assets/admin-tools/admin-forms/js/jquery.validate.min.js"/>"></script>
<script src="<c:url value="/assets/admin-tools/admin-forms/js/additional-methods.min.js"/>"></script>
<script src="<c:url value="/assets/admin-tools/admin-forms/js/jquery-ui-datepicker.min.js"/>"></script>
<script src="<c:url value="/assets/js/utility/utility.js"/>"></script>
<script src="<c:url value="/assets/js/demo/demo.js"/>"></script>
<script src="<c:url value="/assets/js/main.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/pages.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/items.js"/>"></script>

</body>
</html>


