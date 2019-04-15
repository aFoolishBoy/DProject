<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>

<%
String path = request.getContextPath();
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
	*{
		FONT-SIZE: 12px; COLOR: white
	}
	#logo {
		COLOR: white
	}
	#logo A {
		COLOR: white
	}
	FORM {
		MARGIN: 0px
	}
	</STYLE>
	<SCRIPT src="<%=path %>/js/Clock.js" type=text/javascript></SCRIPT>
	<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
	
    <script type="text/javascript">
       function out()
       {
           window.parent.location.href="<%=path %>/login.jsp";
       }
       
       <c:if test="${sessionScope.userType==1}">
       //window.setInterval(tixing,10*1000);
       </c:if>      
       
        function tixing()
        {
            loginService.huiyitixing(callBackHello);
        }
        function callBackHello(data)
        {
           if(data!=0)
           {
                var MSG1 = new CLASS_MSN_MESSAGE();  
			    MSG1.rect(null,null,null,screen.height-50);
			    MSG1.id="id1";
			    MSG1.width="200";
			    MSG1.height="120";
			    MSG1.caption="消息提示";
			    MSG1.title="您有1封提示消息";
			    MSG1.message="请查看";
			    MSG1.action="/hysyd/yuding?type=yudingDetail&id="+data;
			    MSG1.speed    = 10; 
			    MSG1.step    = 5; 
			    MSG1.show(); 
           }
        }
        
        
        
        function CLASS_MSN_MESSAGE(id,width,height,caption,title,message,target,action)
		{  
		    this.id     = id;  
		    this.title  = title;  
		    this.caption= caption;  
		    this.message= message;  
		    this.target = target;  
		    this.action = action;  
		    this.width    = width?width:200;  
		    this.height = height?height:120;  
		    this.timeout= 850;  
		    this.speed    = 20; 
		    this.step    = 1; 
		    this.right    = screen.width -1;  
		    this.bottom = screen.height; 
		    this.left    = this.right - this.width; 
		    this.top    = this.bottom - this.height; 
		    this.timer    = 0; 
		    this.pause    = false;
		    this.close    = false;
		    this.autoHide    = true;
		}  
  
		CLASS_MSN_MESSAGE.prototype.hide = function()
		{  
		    if(this.onunload())
		    {  
		
		        var offset  = this.height>this.bottom-this.top?this.height:this.bottom-this.top; 
		        var me  = this;  
		 
		        if(this.timer>0)
		        {   
		            window.clearInterval(me.timer);  
		        }  
		 
		        var fun = function()
		        {  
		            if(me.pause==false||me.close){
		                var x  = me.left; 
		                var y  = 0; 
		                var width = me.width; 
		                var height = 0; 
		                if(me.offset>0)
		                { 
		                    height = me.offset; 
		                } 
		     
		                y  = me.bottom - height; 
		     
		                if(y>=me.bottom)
		                { 
		                    window.clearInterval(me.timer);  
		                    me.Pop.hide();  
		                } else 
		                { 
		                    me.offset = me.offset - me.step;  
		                } 
		                me.Pop.show(x,y,width,height);    
		            }             
		        }  
		 
		        this.timer = window.setInterval(fun,this.speed)      
		    }  
		}  
  



		CLASS_MSN_MESSAGE.prototype.onunload = function() 
		{  
		    return true;  
		}  




		CLASS_MSN_MESSAGE.prototype.oncommand = function()
		{  
		    this.close = true;
		    this.hide(); 
		    
		    var targetWinUrl=this.action;
		    var targetWinName="newWin";
		    var features="dialogWidth=700px;dialogHeight=200px"
		    var new_win=window.showModalDialog(targetWinUrl,targetWinName,features);
		}  
  



		CLASS_MSN_MESSAGE.prototype.show = function()
		{  
		
		    var oPopup = window.createPopup(); 
		    this.Pop = oPopup;  
		  
		    var w = this.width;  
		    var h = this.height;  
		  
		    var str = "<DIV style='BORDER-RIGHT: #455690 1px solid; BORDER-TOP: #a6b4cf 1px solid; Z-INDEX: 99999; LEFT: 0px; BORDER-LEFT: #a6b4cf 1px solid; WIDTH: " + w + "px; BORDER-BOTTOM: #455690 1px solid; POSITION: absolute; TOP: 0px; HEIGHT: " + h + "px; BACKGROUND-COLOR: #c9d3f3'>"  
		    str += "<TABLE style='BORDER-TOP: #ffffff 1px solid; BORDER-LEFT: #ffffff 1px solid' cellSpacing=0 cellPadding=0 width='100%' bgColor=#cfdef4 border=0>"  
		    str += "<TR>"  
		    str += "<TD style='FONT-SIZE: 12px;COLOR: #0f2c8c' width=30 height=24></TD>"  
		    str += "<TD style='PADDING-LEFT: 4px; FONT-WEIGHT: normal; FONT-SIZE: 12px; COLOR: #1f336b; PADDING-TOP: 4px' vAlign=center width='100%'>" + this.caption + "</TD>"  
		    str += "<TD style='PADDING-RIGHT: 2px; PADDING-TOP: 2px' vAlign=center align=right width=19>"  
		    str += "<SPAN title=关闭 style='FONT-WEIGHT: bold; FONT-SIZE: 12px; CURSOR: hand; COLOR: red; MARGIN-RIGHT: 4px' id='btSysClose' >×</SPAN></TD>"  
		    str += "</TR>"  
		    str += "<TR>"  
		    str += "<TD style='PADDING-RIGHT: 1px;PADDING-BOTTOM: 1px' colSpan=3 height=" + (h-28) + ">"  
		    str += "<DIV style='BORDER-RIGHT: #b9c9ef 1px solid; PADDING-RIGHT: 8px; BORDER-TOP: #728eb8 1px solid; PADDING-LEFT: 8px; FONT-SIZE: 12px; PADDING-BOTTOM: 8px; BORDER-LEFT: #728eb8 1px solid; WIDTH: 100%; COLOR: #1f336b; PADDING-TOP: 8px; BORDER-BOTTOM: #b9c9ef 1px solid; HEIGHT: 100%'>" + this.title + "<BR><BR>"  
		    str += "<DIV style='WORD-BREAK: break-all' align=left><A href='javascript:void(0)' hidefocus=true id='btCommand'><FONT color=#ff0000>" + this.message + "</FONT></A></DIV>"  
		    str += "</DIV>"  
		    str += "</TD>"  
		    str += "</TR>"  
		    str += "</TABLE>"  
		    str += "</DIV>"  
		  
		    oPopup.document.body.innerHTML = str; 
		    
		  
		    this.offset  = 0; 
		    var me  = this;  
		
		    oPopup.document.body.onmouseover = function(){me.pause=true;}
		    oPopup.document.body.onmouseout = function(){me.pause=false;}
		
		    var fun = function()
		    {  
		        var x  = me.left; 
		        var y  = 0; 
		        var width    = me.width; 
		        var height    = me.height; 
		 
		        if(me.offset>me.height)
		        { 
		            height = me.height; 
		        } else { 
		            height = me.offset; 
		        } 
		 
		        y  = me.bottom - me.offset; 
		        if(y<=me.top)
		        { 
		            me.timeout--; 
		            if(me.timeout==0)
		            { 
		                window.clearInterval(me.timer);  
		                if(me.autoHide)
		                {
		                    me.hide(); 
		                }
		            } 
		        } 
		        else 
		        { 
		            me.offset = me.offset + me.step; 
		        } 
		        me.Pop.show(x,y,width,height);    
		    }  
		  
		    this.timer = window.setInterval(fun,this.speed)      
		    var btClose = oPopup.document.getElementById("btSysClose");  
		  
		    btClose.onclick = function()
		    {  
		        me.close = true;
		        me.hide();  
		    }  
		  
		    var btCommand = oPopup.document.getElementById("btCommand");  
		    btCommand.onclick = function()
		    {  
		        me.oncommand();  
		    }    
		}  





		CLASS_MSN_MESSAGE.prototype.speed = function(s)
		{ 
		    var t = 20; 
		    try 
		    { 
		        t = praseInt(s); 
		    } 
		    catch(e){} 
		    this.speed = t; 
		} 




		CLASS_MSN_MESSAGE.prototype.step = function(s)
		{ 
		    var t = 1; 
		    try { 
		        t = praseInt(s); 
		    } catch(e){} 
		    this.step = t; 
		} 
		  
		CLASS_MSN_MESSAGE.prototype.rect = function(left,right,top,bottom)
		{ 
		    try
		     { 
		        this.left        = left    !=null?left:this.right-this.width; 
		        this.right        = right    !=null?right:this.left +this.width; 
		        this.bottom        = bottom!=null?(bottom>screen.height?screen.height:bottom):screen.height; 
		        this.top        = top    !=null?top:this.bottom - this.height; 
		     } 
		    catch(e){} 
		} 
    </script>
  </head>
  
  <BODY leftmargin="0" topmargin="0">
        <DIV style="BACKGROUND-IMAGE: url(<%=path %>/img/logo.png); HEIGHT: 111px">
	       <TABLE cellSpacing=0 cellPadding=0 width="100%">
	          <TR>
	            <TD align=left width="30%">
	               	<font style="font-size: 30px;color: white;font-weight: bolder;">
	               	    <br/><br/><br/>
	               	    &nbsp;
	               	    系统功能不全，需要本程序的朋友，请加我QQ联系获取。 QQ：31600328
	               	</font>
	            </TD>
	            <TD align=right width="70%">
	                 <br/><br/><br/>
		             <SPAN style="PADDING-RIGHT: 20px;">
		                 <font style="font-size: 20px;">
		                 <c:if test="${sessionScope.userType==0}">
						      欢迎您：系统管理员
						 </c:if>
						 </font>
			             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			             <SPAN id=clock style="font-size: 20px;"></SPAN>
			             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			             <a href="#" onclick="out()" style="text-decoration: none" style="font-size: 20px;">退出系统</A> 
			         </SPAN>
	            </TD>
	          </TR>
	       </TABLE>
        <DIV>
	    <SCRIPT type=text/javascript>
	       var clock = new Clock();clock.display(document.getElementById("clock"));
	    </SCRIPT>
</BODY>
</html>
