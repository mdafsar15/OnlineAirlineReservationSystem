<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="com.mas.dto.FlyersDTO"%>
<%@page import="com.mas.dao.MasterDAO"%>
<%@page import="com.mas.dto.FlightDTO"%>
<%@page import="com.mas.dao.UserDAO"%>
<%@page import="com.mas.dto.ServicesDTO"%>
<%@page import="com.mas.dto.JourneyDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String user1=(String)session.getAttribute("ownuser");
	if (user1==null) {
		response.sendRedirect("/Logout.jsp");
	}
%>
<%
 String user=(String)session.getAttribute("ownuser");
 int adults=Integer.parseInt(request.getParameter("adults"));
 int chills=Integer.parseInt(request.getParameter("chills"));
 String fnum=request.getParameter("fnumber");
 double amount=Double.parseDouble(request.getParameter("amount"));
 String doj=request.getParameter("jdate");
 String jtype=request.getParameter("jtype");
   FlyersDTO fdto=null;
   JourneyDTO dto=null;
 try{
     fdto=new UserDAO().getUserDetails(user);
     fdto.setUserid(user);
     dto=new UserDAO().getFlightDetails(fnum);
     
    }catch(Exception e){
      e.printStackTrace();
    }
    System.out.println("================="+dto.getDistance());
   
    double miles=dto.getDistance()*(0.02);
    System.out.println("in confirm flight.jsp miles======"+miles);
    if(jtype.equalsIgnoreCase("return"))
    {
      miles=miles*2;
    }
    JourneyDTO sdto=new JourneyDTO();
    sdto.setFnumber(fnum);
    sdto.setMiles(miles);
    sdto.setFrom(dto.getFrom());
    sdto.setTo(dto.getTo());
    sdto.setDistance(dto.getDistance());
    sdto.setDtime(doj);
    sdto.setAdults(adults);
    sdto.setChills(chills);
    sdto.setAmount(amount);
    sdto.setDoj(doj);
    session.setAttribute("userdto",fdto);
    session.setAttribute("flightdto",sdto);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 <script language="JavaScript" type="text/javascript" src="scripts/ts_picker.js"></script> 
  <script type="text/javascript">
     
     function HowManyPointNeed()
    {     
          var xmlHttp1=null;
          try{
              if(window.XMLHttpRequest){
                xmlHttp1=new XMLHttpRequest();
            }else{
                 xmlHttp1=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                   xmlHttp1.onreadystatechange=function()
                   {  
                     if(xmlHttp1.readyState==4){                       
                        document.getElementById("result").innerHTML = xmlHttp1.responseText;                      
                        xmlHttp1.responseText=null;
                        xmlHttp1.abort();
                        }
                    }
           var url="./HowManyPointsINeed.jsp"         
           xmlHttp1.open("GET", url , true);
           xmlHttp1.send(null);   
    }
    function CheckPointsNeed(){
	       var from=document.getElementById("from").value;
	       alert(from);
	       var to=document.getElementById("to").value;
	       var xmlHttpcp=null;
           try{
              if(window.XMLHttpRequest){
                xmlHttpcp=new XMLHttpRequest();
            }else{
                 xmlHttpcp=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                xmlHttpcp.onreadystatechange=function()
                 {  
                    if(xmlHttpcp.readyState==4){                       
                    document.getElementById("result").innerHTML = xmlHttpcp.responseText;                      
                    xmlHttpcp.responseText=null;
                    xmlHttpcp.abort();
                     }
                  }
           var url="./HowManyPointsINeed?from="+from+"&to="+to;         
           xmlHttpcp.open("GET", url , true);
           xmlHttpcp.send(null);
           xmlHttpcp.abort();   
	  }
     function ChangePass()
    {     
          var xmlHttpb=null;
          try{
              if(window.XMLHttpRequest){
                xmlHttpb=new XMLHttpRequest();
            }else{
                 xmlHttpb=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                   xmlHttpb.onreadystatechange=function()
                   {  
                     if(xmlHttpb.readyState==4){                       
                        document.getElementById("result").innerHTML = xmlHttpb.responseText;                      
                        xmlHttpb.responseText=null;
                        xmlHttpb.abort();
                        }
                    }
           var url="./ChangePassword.jsp"         
           xmlHttpb.open("GET", url , true);
           xmlHttpb.send(null);   
    }
    function UpdateNewPass()
    {
    alert("dskkldskjf");
    var uid=document.getElementById("userid").value;
    var pwd=document.getElementById("pwd").value;
    var newpwd=document.getElementById("newpwd").value;
    if(pwd==""){
      alert("please enter new password");
      document.forms.password.pwd.focus();
      return false;
    }
    if(pwd!=newpwd){
      alert("password not matched");
      document.forms.password.newpwd.focus();
      return false;
    }
     var xmlHttp=null;
          try{
              if(window.XMLHttpRequest){
                xmlHttp=new XMLHttpRequest();
            }else{
                 xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                   xmlHttp.onreadystatechange=function()
                   {  
                     if(xmlHttp.readyState==4){                       
                        document.getElementById("success").innerHTML = xmlHttp.responseText;                      
                        xmlHttp.responseText=null;
                        xmlHttp.abort();
                        }
                    }
           var url="./ChangeUserPass?pwd="+pwd;         
           xmlHttp.open("GET", url , true);
           xmlHttp.send(null);   
    }
    function CheckPonts(){
       var xmlHttpc=null;
          try{
              if(window.XMLHttpRequest){
                xmlHttpc=new XMLHttpRequest();
            }else{
                 xmlHttpc=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                   xmlHttpc.onreadystatechange=function()
                   {  
                     if(xmlHttpc.readyState==4){                       
                        document.getElementById("result").innerHTML = xmlHttpc.responseText;                      
                        xmlHttpc.responseText=null;
                        xmlHttpc.abort();
                        }
                    }
           var url="./CheckMiles.jsp"         
           xmlHttpc.open("GET", url , true);
           xmlHttpc.send(null);   
    }
    function ConfirmTicket()
    {
    var miles=document.getElementById("miles").value;
    var xmlHttpd=null;
          try{
              if(window.XMLHttpRequest){
                xmlHttpd=new XMLHttpRequest();
            }else{
                 xmlHttpd=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                   xmlHttpd.onreadystatechange=function()
                   {  
                     if(xmlHttpd.readyState==4){                       
                        document.getElementById("result").innerHTML = xmlHttpd.responseText;                      
                        xmlHttpd.responseText=null;
                        xmlHttpd.abort();
                        }
                    }
           var url="./ConfirmTickets?miles="+miles;         
           xmlHttpd.open("GET", url , true);
           xmlHttpd.send(null);   
     }
      function ShowPoints(){
	       var xmlHttpp=null;
           try{
              if(window.XMLHttpRequest){
                xmlHttpp=new XMLHttpRequest();
            }else{
                 xmlHttpp=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                xmlHttpp.onreadystatechange=function()
                 {  
                    if(xmlHttpp.readyState==4){                       
                    document.getElementById("result").innerHTML = xmlHttpp.responseText;                      
                    xmlHttpp.responseText=null;
                    xmlHttpp.abort();
                     }
                  }
           var url="./ShowMyPoints";         
           xmlHttpp.open("GET", url , true);
           xmlHttpp.send(null); 
	  }
	 
	
  </script>
 </head>
  <body bgcolor="#ff0ffff">
   <table width="960">
   <tr>
    <td colspan="3">
     <jsp:include page="./FlyerHeader.jsp"></jsp:include>
    </td>
   </tr>
   <tr>
    <td colspan="3"></td>
   </tr>
   <tr>
    <td colspan="3" bgcolor="pink"></td>
   </tr>
    <tr>
     <td colspan="3" height="240" valign="top">
      <table width="960">
       <tr>
        <td width="100" valign="top">
         <table width="100">
          <tr>
           <td>
             <a href="./GetUserProfile" onmouseover="javascript:document.img1.src='images/icon_myaccount1.gif' " 
                onmouseout="javascript:document.img1.src='images/icon-myaccount-trans.png' ">
                <img src="images/icon_myaccount1.gif" width="120" height="40" name="img1" border="0">
            </a>
           </td>
          </tr>
          <tr>
           <td></td>
          </tr>
          <tr>
           <td>
             <a href="FlyerChangePass.jsp" onmousemove="javascript:document.img2.src='images/changepass_2.jpg'"
                                 onmouseout="javascript:document.img2.src='images/change_pass_on.gif' " onclick="ChangePass();">
                                 <img width="100" height="30" src="images/changepass_2.jpg" name="img2" border="0">
            </a>
           </td>         
          </tr>
          						  <tr>
           <td align="center">
            <a href="./ShowMyPoints"
				style="text-decoration: none">MyPoints</a>
           </td>
          </tr>
          <tr>
										<td align="center">
											<a href="./GetUserMails" style="text-decoration: none">Inbox</a>
										</td>
									</tr>
									<tr>
										<td align="center">
											<a href="./MailBox.jsp" style="text-decoration: none">ComposeMail</a>
										</td>
									</tr>
          <tr>
           <td align="center">
            <a href="./LogoutAction" style="text-decoration: none">Logout</a>
           </td>
          </tr>
         </table>
        </td>
        <td width="700" bgcolor="#ff0ffff" align="left" valign="top"> 
        <table width="700">
         <tr>
          <td align="right">
           <font color="gray" size="4">
             Welcome To <c:out value='${sessionScope.ownuser}'></c:out>
           </font>
          </td>
         </tr>
         <tr>
          <td>
              <a href="./BookAFlight.jsp" style="font-weight: 150; text-decoration: none ">Book A Flight Now</a><br> 
          </td>
         </tr>
         <tr>
           <td>
              <a href="#" style="font-weight: 150; text-decoration: none " onclick="HowManyPointNeed();">How many points do you need?</a>
           </td>
         </tr>
         <tr>
          <td bgcolor="#FFFFFF">
          </td>
         </tr>        
         <tr>
          <td align="center">
           <div id="result">
             <table width="700">
               <tr bgcolor="#FFFFFF">
                <td align="left">
                 <font face="verdana" size="3">Frequent Flyer Points Earned</font>
                </td>
               </tr>
               <tr>
                <td><font face="verdana" size="2">Frequent Flyers could earn <%=miles%> points for this booking.</font></td>                
               </tr><br>
               <tr bgcolor="#FFFFFF">
                <td>
                 <font face="verdana" size="3">TotalPrice</font>                
                </td>
               </tr>
               <tr>
                <td align="center">
                 <font face="verdana" size="2">=:</font>
                 <font color="red">
                  adults=<%=adults %> + childrens=<%=chills %><br>                
                 </font>
                  =<%=amount %>$
                </td>
               </tr><br>
              <tr bgcolor="#FFFFFF">
                <td>
                 <font face="verdana" size="3">Fare Conditions</font>                                 
                </td>
               </tr>
               <tr>
                <td>
                 <font face="verdana" size="2">
                  <b>Booking Changes</b>  :Changes can be made by calling your local my office.<br>&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                     <b>Before and after departure</b> 
 
    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Changes permitted subject to fee of INR500 per change and local service fee.<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; * Additional charges and taxes may apply, plus any fare difference. 
                <br><b>Name Changes &nbsp; &nbsp; &nbsp;&nbsp; </b>		 Not permitted<br>
                <b> Cancellations&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</b><b> Before departure:</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cancellations permitted at INR2000 per person, subject to a local service fee.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>After departure :</b>
                <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ticket is non refundable in case of Cancellation / No Show /Partly used.
                 </font>
                </td>
               </tr>
               <tr>
                <td>
                 click here if you want to <a href="#" onclick="CheckPonts();">pay points plus pay</a>
                </td>
               </tr>
             </table>
           </div>
          </td>
         </tr>
        </table>                                           
        </td>
        <td width="180">
         <marquee behavior="scroll" direction="up" style="padding: 200px 0pt; " scrollamount="10" >
          <img width="140" src="images/flier2.jpg"><br>
          <img width="140" src="images/f7.jpg" height="140"><br>
          <img width="140" src="images/f3.gif">
         </marquee>
        </td>
       </tr>
      </table>
     </td>    
    </tr>   
    <tr>
     <td colspan="3" width="960">
      <jsp:include page="./Footer.jsp"></jsp:include>
     </td>
    </tr>
   </table>
  </body>
</html>
