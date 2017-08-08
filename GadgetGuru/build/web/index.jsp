<title>Login</title>

<style>
.tp {
	
    opacity: 0.8;
        width: 650px;
	height:400px;
        
}
.t1 {
	
        opacity: 0.8;
        width: 1290px;
	height:60px;
        float: right;
}
h2 {
      font-size: 30px;
      text-transform: uppercase;
      color: #cc0052;
      font-weight: 600;
      margin-bottom: 30px;
  }
  h3 {
	  font-size: 25px;
    color: #cc0052;
}
  h4 {
      font-size: 22px;
      line-height: 1.375em;
      color: #4d0017;
      font-weight: 400;
      margin-bottom: 30px;
  } 
 h5 {
      font-size: 17px;
      line-height: 1.375em;
      color: #800028;
      font-weight: 400;
      margin-bottom: 30px;
  }   

.menu_nav {
	margin:0 auto;
	padding:0;
	height:59px;
}
.menu_nav ul {
	list-style:none;
	padding:23px 0 0;
	height:36px;
	float:left;
}
.menu_nav ul li {
	margin:0;
	padding:0 13px;
	float:left;
}
.menu_nav ul li a {
	display:block;
	margin:0;
	padding:10px 20px;
	font-size:12px;
	line-height:16px;
	font-weight:normal;
	color:#747474;
	text-decoration:none;
	text-align:center;
	text-transform:uppercase;
	background:none;
}


textarea:focus, input:focus, input[type]:focus, .uneditable-input:focus {   
    outline: none !important;
    border-color: #cc0052;
    box-shadow: 0 0 15px #719ECE;
}
input[type=text], select {
    width: 20%;
    padding: 5px 5px;
    margin: 8px 0;
    display: inline-block;
    border: 2px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=password], select {
    width: 20%;
    padding: 5px 5px;
    margin: 8px 0;
    display: inline-block;
    border: 2px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

 
input[type=submit] {
    width: 15%;
    background-color: #ff0066;
    color: white;
    padding: 5px 5px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #b30047;
}

div {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 25px;
}
</style>
<body background="pics/abc.jpg">
    
<center>
    
    <br><br><br><br>
    <form action="register.jsp" method="POST">
    <pre><h3><b>                                          
                                          
                                          
                                          <input type='text' name='name' placeholder="NAME" id='name' required="true"/>
                                          <input type='password' name='pass' placeholder="PASSWORD" required="true"/>
                                          <input type='password' name='cpass' placeholder="CONFIRM PASSWORD" required="true"/></b></h3>
                                                                                  <font size="4" color="red">${requestScope.errmsg}</font>
                                                                                  <input type="submit" class="btn btn-lg btn-danger" name="btn_register" value="REGISTER"/>

</pre>
      </form>


</center>

<form action="login.jsp" method="POST">
    <pre>   
           
                                                                                                                    <input type="text" name="user" size="10" placeholder="USER NAME" required="true"/>
                                                                                                                    <input type="password" name="password" size="10" placeholder="PASSWORD" required="true"/>
                                                                                                                        <a href="inst.jsp"/><input name="btn_login" type="submit" class="btn btn-danger" value="LOGIN"/></a>
                                                                                                                    <font size="4" color="red">${requestScope.msg}</font>
    </pre>
<br>



</form>

 </body>