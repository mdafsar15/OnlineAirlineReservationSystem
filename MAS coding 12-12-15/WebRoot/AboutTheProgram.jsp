<%@page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String user=(String)session.getAttribute("ownuser");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
  </head>
  
  <body>
    <table width="980">
     <tr>
      <td colspan="2" width="980" height="170" align="center" valign="top">
         <jsp:include page="./HomeHeader.jsp"></jsp:include>
      </td>
     </tr>
     <tr>
      <td width="980" height="30" align="center" bgcolor="skyblue" colspan="3">
       <jsp:include page="/FlyerOptions.jsp"></jsp:include>
      </td>     
     </tr>
     <tr>
      <td width="750" align="center" valign="top" height="200" colspan="1">
       <table width="600" align="center">
        <tr bgcolor="#fffff">
         <td align="left">
          <font color="blue" size="4">What is Frequent Flyer Program?</font>
         </td>
        </tr>
        <tr>
         <td>
          <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
           <font face="verdana" size="2">A frequent flyer program (FFP) is a loyalty
           program offered by many airlines. 
          Typically, airline customers enrolled&nbsp; in the&nbsp; program&nbsp; accumulate&nbsp; frequent flyer miles&nbsp; (kilometers,&nbsp; points,&nbsp; segments)&nbsp;&nbsp; 
          corresponding to the distance flown on that airline or its partners. <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          &nbsp;&nbsp;&nbsp;&nbsp; There are other ways to accumulate miles.  
          In recent years, more miles were awarded for using co-branded credit&nbsp; and debit cards than for air travel.&nbsp; 
           Acquired&nbsp; miles can be&nbsp; redeemed for free air travel;&nbsp; for other goods or services; or for increased benefits,  
           such as travel class upgrades, airport lounge access or priority bookings.  </font>        
          </p>
         </td>        
        </tr>
       </table>
      </td>   
      <td align="right">
         <img src="./images/flier.jpg" width="300" height="180">
      </td>    
     </tr>
     <tr>
      <td width="980" height="50" align="center" valign="bottom" colspan="3">
       <jsp:include page="/Footer.jsp"></jsp:include>
      </td>
     </tr>
    </table>
  </body>
</html>
