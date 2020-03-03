<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <script language="JavaScript" type="text/javascript" src="scripts/ts_picker.js"></script>
   <script type="text/javascript">
    function getAppicationForm(){
     var country=document.getElementById("country").value;   
     if(country==null || country==""){
       alert("Enter country name");
       return false;
     }
     var ajaxobj=null;
      try{
              if(window.XMLHttpRequest){
                ajaxobj=new XMLHttpRequest();
            }else{
                 ajaxobj=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                   ajaxobj.onreadystatechange=function()
                   {  
                     if(ajaxobj.readyState==4){                       
                        document.getElementById("result").innerHTML = ajaxobj.responseText;                      
                        ajaxobj.responseText=null;
                        ajaxobj.abort();
                        }
                    }
           var url="./GetApplication.jsp?country="+country;         
           ajaxobj.open("GET", url , true);
           ajaxobj.send(null);   
    }
     function checkUserId(){
       var userid=document.getElementById("userid").value;
       var obj=null;
      try{
              if(window.XMLHttpRequest){
                obj=new XMLHttpRequest();
            }else{
                 obj=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                   obj.onreadystatechange=function()
                   {  
                     if(obj.readyState==4){                       
                        document.getElementById("avail").innerHTML = obj.responseText;                      
                        obj.responseText=null;
                        obj.abort();
                        }
                    }
           var url="./CheckUseriDAvail?userid="+userid;         
           obj.open("GET", url , true);
           obj.send(null); 
           
      }
   </script>
  </head>  
  <body>
    <table border="0" >
     <tr>
      <td colspan="2" width="980" height="170" align="center" valign="top">
         <jsp:include page="./HomeHeader.jsp"></jsp:include>
      </td>
     </tr>
     <tr bgcolor="skyblue">
      <td width="980" colspan="2" height="40" valign="top" align="center">
       <jsp:include page="./FlyerOptions.jsp"></jsp:include>
      </td>
     </tr>
     <tr>
      <td width="780" height="150" align="center">
        <table width="700">
         <tr bgcolor="lightgray">
          <td align="center">
           <font face="verdana" size="4">Application Form</font>&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
           <font color="red">*</font>=requiered
          </td>
         </tr>
         <tr>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
           <font face=verdana size="2">You can become a Frequent Flyer of our airlines and 
           you can create your Frequent Flyer ID and Password. Start earning 
           Frequent Flyer points by completing the online application form.</font>
          </td>
         </tr>
         <tr bgcolor="lightgray">
          <td></td>
         </tr>
         <tr>
          <td>
           <font face=verdana size="3"><strong>What is your country of residence?</strong></font>
           <input type="text" id="country" name="country" size="20">&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
           <a href="#" style="text-decoration: none" onclick="return getAppicationForm();">Next</a>
          </td>
         </tr>
         <tr>
          <td align="center">
           <div id="result">           
           </div>
          </td>
         </tr>
        </table>
      </td>   
     </tr>
     <tr>
      <td width="50" align="center" colspan="2">
       <jsp:include page="./Footer.jsp"></jsp:include>
      </td>
     </tr>
    </table>
  </body>
</html>
