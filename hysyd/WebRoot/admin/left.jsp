<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<STYLE type=text/css> 
		{
			FONT-SIZE: 12px
		}
		#menuTree A {
			COLOR: #566984; TEXT-DECORATION: none
		}
		</STYLE>

		<SCRIPT src="<%=path%>/js/TreeNode.js" type=text/javascript></SCRIPT>
		<SCRIPT src="<%=path%>/js/Tree.js" type=text/javascript></SCRIPT>
	</head>

	<BODY style="BACKGROUND-POSITION-Y: -120px;  BACKGROUND-REPEAT: repeat-x" topmargin="5">
		<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%">
				<TR>
					<TD width=10 height=29>
						<IMG src="<%=path %>/img/bg_left_tl.gif">
					</TD>
					<TD
						style="FONT-SIZE: 18px; BACKGROUND-IMAGE: url(<%=path %>/img/bg_left_tc.gif); COLOR: white; FONT-FAMILY: system">
						Main Menu
					</TD>
					<TD width=10>
						<IMG src="<%=path %>/img/bg_left_tr.gif">
					</TD>
				</TR>
				<TR>
					<TD style="BACKGROUND-IMAGE: url(<%=path %>/img/bg_left_ls.gif)"></TD>
					<TD id=menuTree style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; HEIGHT: 100%; BACKGROUND-COLOR: white" vAlign=top></TD>
					<TD style="BACKGROUND-IMAGE: url(<%=path %>/img/bg_left_rs.gif)"></TD>
				</TR>
		</TABLE>
		<SCRIPT type=text/javascript>
                var tree = null;
	            var root = new TreeNode('系统菜单');
	            
	            <c:if test="${sessionScope.userType==0}"> 
	            var fun2 = new TreeNode('修改个人密码');
	            var fun21 = new TreeNode('修改个人密码', '<%=path %>/admin/userinfo/userPw.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun2.add(fun21);
	            root.add(fun2);
	            
	            
	            var fun3 = new TreeNode('部门信息管理');
	            var fun31 = new TreeNode('部门信息管理', '<%=path %>/org?type=orgMana', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun3.add(fun31);
	            root.add(fun3);
	            
	            var fun4 = new TreeNode('员工信息管理');
	            var fun41 = new TreeNode('员工信息管理', '<%=path %>/yuangong?type=yuangongMana', 'tree_node.gif', null, 'tree_node.gif', null);
	            var fun42 = new TreeNode('员工信息录入', '<%=path %>/admin/yuangong/yuangongAdd.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun4.add(fun41);
	            fun4.add(fun42);
	            root.add(fun4);
	            
	            
	            var fun5 = new TreeNode('系统公告管理');
	            var fun51 = new TreeNode('系统公告管理', '<%=path %>/gonggao?type=gonggaoMana', 'tree_node.gif', null, 'tree_node.gif', null);
	            var fun52 = new TreeNode('系统公告录入', '<%=path %>/admin/gonggao/gonggaoAdd.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun5.add(fun51);
	            fun5.add(fun52);
	            root.add(fun5);
	            
	            
	            
	            var fun5 = new TreeNode('会议室---管理');
	            var fun51 = new TreeNode('会议室---管理', '<%=path %>/huiyishi?type=huiyishiMana', 'tree_node.gif', null, 'tree_node.gif', null);
	            var fun52 = new TreeNode('会议室---添加', '<%=path %>/admin/huiyishi/huiyishiAdd.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun5.add(fun51);
	            fun5.add(fun52);
	            root.add(fun5);
	            
	            
	            </c:if>
	            
	            <c:if test="${sessionScope.userType==1}"> 
	            
	            var fun2 = new TreeNode('修改个人密码');
	            var fun21 = new TreeNode('修改个人密码', '<%=path %>/admin/userinfo/userPw_yuangong.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun2.add(fun21);
	            root.add(fun2);
	            
	            
	            var fun2 = new TreeNode('系统公告信息');
	            var fun21 = new TreeNode('系统公告信息', '<%=path %>/gonggao?type=gonggaoAll', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun2.add(fun21);
	            root.add(fun2);
	            
	            
	            
	            var fun5 = new TreeNode('会议室---预订');
	            var fun51 = new TreeNode('我的预订信息', '<%=path %>/yuding?type=yudingMana', 'tree_node.gif', null, 'tree_node.gif', null);
	            var fun52 = new TreeNode('预订信息查询', '<%=path %>/admin/yuding/yudingSea.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
	            var fun53 = new TreeNode('添加新的预订', '<%=path %>/admin/yuding/yudingAdd.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun5.add(fun51);
	            fun5.add(fun52);
	            fun5.add(fun53);
	            root.add(fun5);
	            </c:if>
	            
	            tree = new Tree(root);
	            tree.show('menuTree')
        </SCRIPT>
	</BODY>
</html>
