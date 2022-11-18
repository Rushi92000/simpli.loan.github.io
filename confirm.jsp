<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmation Page</title>
</head>
<style>
         p{
            color:blue;
             font-size: 19px;         
          }
</style>
<body><form onsubmit="return otpvrf()" action="http://pixel6.co/" >
<h2>Dear <label id="name3"></label>,</h2><br>
<h3>Thank you for your inquiry. A 4 digit verification number has been sent to your email:<p><label id="email3"></label></p><br>
please enter it in the following box and submit for confirmation:</h3><input type="text" size="30" id="otp" />
<span id="dsp"></span>
<input name="submit" type="submit" value="Submit" style="background-color: green;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px">
  </form>
  
 <script>
   //value inport from index.jsp using localstorage
    document.getElementById('name3').innerHTML = localStorage.getItem("NAME");
    document.getElementById('email3').innerHTML = localStorage.getItem("EMAIL");
    let count=0;
   //function for opt validation
    function otpvrf(){
    	var otp=document.getElementById("otp").value;
    	//random created otp=1234
    	var sotp="1234";
    	console.log(sotp);
    	//if otp is valid then its redirect to the Pixel6 Home page
    	if(otp==sotp){
    		console.log(sotp);
    		 document.getElementById('dsp').innerHTML = "Valid";
    		 //window.open("http://pixel6.co/");
    		 return true;
    	}else{//if otp is not valid its redirect to 404 error page
    		 count++;
    		 console.log(count);
    		 document.getElementById('dsp').innerHTML = "InValid Please Re-Enter OTP";
    		 while(count==3){
    			 document.getElementById('dsp').innerHTML = "Validation Failed!'";
    			 window.open("https://atlassianblog.wpengine.com/wp-content/uploads/2017/12/44-incredible-404-error-pages@3x-1560x760.png");
    		 count++;
    		 }
    		 return false;
    		 }
    		 
    	}
</script>
</body>
</html>