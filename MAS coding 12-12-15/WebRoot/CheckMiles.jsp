<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="com.mas.dto.JourneyDTO"%>
<%@page import="com.mas.dao.UserDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 JourneyDTO jdto=(JourneyDTO)session.getAttribute("flightdto");
  double miles=0;
 try{
     miles=miles+new UserDAO().getMyPoints((String)session.getAttribute("ownuser"));
 }catch(Exception e)
 {
   e.printStackTrace();
 }
 
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
 <script type="text/javascript">
  function ConfirmTicket()
  {
    var miles=document.getElementById("miles").value;
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
           var url="./ConfirmTickets?miles="+miles;         
           xmlHttpp.open("GET", url , true);
           xmlHttpp.send(null);   
  }
 </script>
 </head>
 <body>
   <table width="700" align="center">
    <tr bgcolor="#FFFFF">
     <td>
      <font face="verdana" size="4">Total points you have earned still now</font>
     </td>
    </tr>
    <tr>
     <td><c:out value="${jdto.miles }"></c:out><br>&nbsp;&nbsp; 
      <font face="verdana" size="2">allows Frequent Flyers to obtain flights with a combination of points and money 
       <br>&nbsp; the more points used, the less money paid!&nbsp;The minimum points is 100$. 
      </font>
     </td>
    </tr>
    <tr bgcolor="#FFFFF">
     <td>
      <font face="verdana" size="4">How Many points you are willing to redeem</font>
     </td>
    </tr>
    <tr>
    <td>
     <center><font size="2" face="verdana">choose how many points you want to redeem for your jounrey</font><br>
      <select name="miles" id="miles">
       <% double f=0; 
         for(f=0;f<=miles;f+=100){
         %>
          <option value="<%=f %>"><%=f %></option>
        <% }%>
      </select>$
     </center>
    </td>
    </tr>
    <tr>
     <td align="center">
      <a href="#" onclick="ConfirmTicket();" style="text-decoration: none">Confirm</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
      <a href="./BookAFlight.jsp" style="text-decoration: none">Cancel</a>
     </td>
    </tr>
   </table>
 </body>
</html>