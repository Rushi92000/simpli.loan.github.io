<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
</head>
<style>
   div {
        box-sizing: border-box;
            width: 100%;
            border: 10px solid black;
            float: left;
            align-content: center;
            align-items: center;
        }
 
        form {
              margin: 0 auto;
              width: 600px;
            }
            
          p{
            color:blue;
             font-size: 25px;         
          }
           input{
            color:black;
             font-size: 20px;         
          }  
          span{
            color:red;
             font-size: 20px;         
          }    
</style>
</head>
<body>
<!-- Form Start -->
<h1 style="text-align: center; color:red;">SIMPLE LOAN REGISTRATION FORM</h1>

<form id="form" name="RegForm" onsubmit="return validation()" action="confirm.jsp" method="post">

<div>
<!-- Paramenter -->
<p> Full Name: <input type="text" size="30" id="name" class="form-control name-valid"/></p>
 <span id="username"></span>
            <br />
             
<p>E-mail: <input type="text" size="30" id="email" /></p>
<span id="email2"></span> 
            <br />
            
 <p>Pan: <input type="text" size="30" id="pan" />
 <span id="pan2"></span>
        </p>
 
            <br />
             
<p>Loan Amount: <input type="text" size="30" id="amt" /></p>
<span id="amt2"></span>
            <br />
     
   </div>
   <p>
<input name="submit" type="submit" value="Submit" style="background-color: green;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px">
   </p>
 </form>
 <!-- Form END -->
 <script type="text/javascript">
 function validation(){
	 //get a value from form using id
	 var user=document.getElementById('name').value;
	 var email=document.getElementById('email').value;
	 var pan=document.getElementById('pan').value;
	 var amt=document.getElementById('amt').value;
	 const form=document.getElementById('form').value;
	 //store value in local storage for a Export to another page
	 localStorage.setItem("NAME", user);
	 localStorage.setItem("EMAIL", email);
	 //Pattern for pan validation
	 var patt=/^([A-Z]){5}([0-9]){4}([A-Z]){1}$/;
	 //Pattern for Name validation
	 var regName = /^[a-zA-Z]+ [a-zA-Z]+$/;
	 //if user NaN
	 if(user==""){
		 document.getElementById('username').innerHTML="Please Enter Full Name";
		 return false;
	 }
	 //if username less than 2 char
	 if(user.length <=2){
		 document.getElementById('username').innerHTML="Please Enter Name more than 2 digit";
		 return false;
		 //User validation
	 }else if(!regName.test(user)){
		 document.getElementById('username').innerHTML="Please Enter name like a John Smith";
		 return false;
	 }
	 //validation user is not a Num
	 if(!isNaN(user)){
		 document.getElementById('username').innerHTML="Only Character is allowed";
		 return false;
	 }
	 //email validation if its empty
	 if(email==""){
		 document.getElementById('email2').innerHTML="Please Enter Email";
		 return false;
	 }
	 //email validation regarding @ sign
	 if(email.indexOf('@')<=0){
		 document.getElementById('email2').innerHTML="Invalid @ position";
		 return false;
	 }
	 //pan validation if empty
	 if(pan==""){
		 document.getElementById('pan2').innerHTML="Please Enter PanNo";
		 return false;
	 }
	 //pan validation digit of pan <10
	 if(pan.length!=10){
		 document.getElementById('pan2').innerHTML="Please Enter 10 Digit Pan Number";
		 return false;
	 }//pan validation according pattern ABCDE1234F
	 else if(pan.match(patt)){
		 document.getElementById('pan2').innerHTML="Valid";
	 }else{
		 document.getElementById('pan2').innerHTML="Invalid Pan Number"; 
	 }
	 
	 if(amt==""){
		 document.getElementById('amt2').innerHTML="Please Enter Amount";
		 return false;
		 //Validation regarding amount is less than 10
	 }else if(amt.length>=10){
		 document.getElementById('amt2').innerHTML="Enter Loan Amount should be 9 digit and Number Only";
		 return false;
	 }else{//calculation of EMI
	 const interest = (amt * (8.5 * 0.01)) / 15;
	 let emi = ((amt / 15) + interest).toFixed(2);
	 emi = emi.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
     document.getElementById("amt2").innerHTML="Estimated EMI’, based on the loan amount, interest rate of 8.5% and tenure of 15 years is equal to "+emi;
     return true;
	 }
	  
	   
 }
 </script>
 </body>
</html>

