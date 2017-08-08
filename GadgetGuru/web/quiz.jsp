
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<link rel="stylesheet" href="pics/styling.css"/> 
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="pics/css/bootstrap.min.css">
  <script src="pics/js/jquery.min.js"></script>
  <script src="pics/js/bootstrap.min.js"></script>
<% String u = (String) session.getAttribute("uname"); %>


    <script>
function startTimer(duration, display) {
    var timer = duration, minutes, seconds;
    setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        if (--timer < 0) {
            window.location.href = "result.jsp";
        }
    }, 1000);
}

window.onload = function () {
    var fiveMinutes = 60 * 20,
        display = document.querySelector('#time');
    startTimer(fiveMinutes, display);
};
function fetch(q){
    var qid=q;
    var aj=window.XMLHttpRequest? new XMLHttpRequest() : new ActiveXObject("Microsoft.XMLHTTP");
    aj.onreadystatechange = function(){
        if(aj.readyState == 4 && aj.status == 200){
            
            var res=aj.responseText;
            var data=res.split("#");
            console.log(data);
            document.getElementById("qs").innerHTML=data[0];
            document.getElementById("o1").innerHTML=data[1];
            document.getElementById("o2").innerHTML=data[2];
            document.getElementById("o3").innerHTML=data[3];
            document.getElementById("o4").innerHTML=data[4];
            document.getElementById("a").value=qid;
        }
    };
    aj.open("POST","fetchData.jsp",true);
    aj.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    
    var param="qid="+qid;
    aj.send(param);
}

function lockbtn(){
    var lockno=document.getElementById("a");
    console.log(lockno.value);
    document.getElementById(lockno.value).disabled=true;
    if(document.getElementById('r1').checked) {
        
        update(document.getElementById('r1').value,lockno.value);
    }
    else if(document.getElementById('r2').checked) {
        
        update(document.getElementById('r2').value,lockno.value);
    }
    else if(document.getElementById('r3').checked) {
        
        update(document.getElementById('r3').value,lockno.value);
    }
    else if(document.getElementById('r4').checked) {
        
        update(document.getElementById('r4').value,lockno.value);
    }
    
    var btn = document.getElementById(lockno.value);
    btn.style.background="red";
    //console.log(btn);
    
}

function update(op,qno){
    //alert(op);
    //alert(qno);
   var aj=window.XMLHttpRequest? new XMLHttpRequest() : new ActiveXObject("Microsoft.XMLHTTP");
    aj.onreadystatechange = function(){
        if(aj.readyState == 4 && aj.status == 200){
            
            var res=aj.responseText;
            if(res == 2)
                alert("NotUpdated");
        }
    };
    aj.open("POST","lock.jsp",true);
    aj.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    
    var param="opno="+op;
    param+="&qid="+qno;
    aj.send(param); 
    
}

</script>


<style>

    .tp {
        font-family: Raleway;
        opacity: .5;
        filter: alpha(opacity=80); 
        height:500px;
        width: 100px;
        text-align: center;
    }
    
    input[type=submit]:hover {
        background-color: #ff0066;
    }
 
</style>
<%
    
    
    HttpSession s1 = request.getSession(false);
    if (s1 != null && u != null) {
        u = u.toUpperCase();
        HttpSession sess = request.getSession();
        sess.setAttribute("uname", u);

%>
<body background="pics/map.jpg">
    
            <div class="img1"><a href="pics/name.png">
        <div class="nm">
        
        WELCOME,<br> <%=u%>
       
        
    </div>
        </a></div>
    
        <div class="cd1"> 
             TIME LEFT
        </div>
        <br>
            <div id="time" class="countDown tm">
                20:00
            </div>

    <form>
<%
            String q = "select * from isLocked where uname='" + u + "'";
            ResultSet r1 = jdbc.DAOLayer.selectData(q);
            r1.last();
%>
  

<button type="button" class="button btn1 grey" style="background: #008CBA" data-toggle="modal" data-target="#myModal" onclick="fetch(1)" id="1">1</button>
<button type="button" class="button btn2 grey" style="background: #008CBA;" data-toggle="modal" data-target="#myModal" onclick="fetch(2)" id="2">2</button>
<button type="button" class="button btn3 grey" style="background: #008CBA" data-toggle="modal" data-target="#myModal" onclick="fetch(3)" id="3">3</button>
<button type="button" class="button btn4 grey" style="background: #008CBA" data-toggle="modal" data-target="#myModal" onclick="fetch(4)" id="4">4</button>
<button type="button" class="button btn5 grey" style="background: #008CBA" data-toggle="modal" data-target="#myModal" onclick="fetch(5)" id="5">5</button>
<button type="button" class="button btn6 grey" style="background: #008CBA" data-toggle="modal" data-target="#myModal" onclick="fetch(6)" id="6">6</button>
<button type="button" class="button btn7 grey" style="background: #008CBA" data-toggle="modal" data-target="#myModal" onclick="fetch(7)" id="7">7</button>
<button type="button" class="button btn8 grey" style="background: #008CBA" data-toggle="modal" data-target="#myModal" onclick="fetch(8)" id="8">8</button>
<button type="button" class="button btn9 grey" style="background: #008CBA" data-toggle="modal" data-target="#myModal" onclick="fetch(9)" id="9">9</button>
<button type="button" class="button btn10 grey" style="background: #008CBA" data-toggle="modal" data-target="#myModal" onclick="fetch(10)" id="10">10</button>
<button type="button" class="button btn11 grey" style="background: #008CBA" data-toggle="modal" data-target="#myModal" onclick="fetch(11)" id="11">11</button>
<button type="button" class="button btn12 grey" style="background: #008CBA" data-toggle="modal" data-target="#myModal" onclick="fetch(12)" id="12">12</button>
<button type="button" class="button btn13 grey" style="background: #008CBA" data-toggle="modal" data-target="#myModal" onclick="fetch(13)" id="13">13</button>
<button type="button" class="button btn14 grey" style="background: #008CBA" data-toggle="modal" data-target="#myModal" onclick="fetch(14)" id="14">14</button>
<button type="button" class="button btn15 grey" style="background: #008CBA" data-toggle="modal" data-target="#myModal" onclick="fetch(15)" id="15">15</button>
<button type="button" class="button btn16 grey" style="background: #008CBA" data-toggle="modal" data-target="#myModal" onclick="fetch(16)" id="16">16</button>
<button type="button" class="button btn17 grey" style="background: #008CBA" data-toggle="modal" data-target="#myModal" onclick="fetch(17)" id="17">17</button>
<button type="button" class="button btn18 grey" style="background: #008CBA" data-toggle="modal" data-target="#myModal" onclick="fetch(18)" id="18">18</button>
<button type="button" class="button btn19 grey" style="background: #008CBA" data-toggle="modal" data-target="#myModal" onclick="fetch(19)" id="19">19</button>
<button type="button" class="button btn20 grey" style="background: #008CBA" data-toggle="modal" data-target="#myModal" onclick="fetch(20)" id="20">20</button>
       <!--%  
        if (r1.getInt(2) == 0) {
        %> <button type="button" class="button btn1 grey" data-toggle="modal" data-target="#myModal" onclick="fetch()">1</button> 
            <!--%} 
        else if (r1.getString(2).equals("99")) {
            %><button type="button" class="button btn1 red" data-toggle="modal" data-target="#myModal">1</button>  
            <!--%} 
        else {
            %><button type="button" class="button btn1 green" data-toggle="modal" data-target="#myModal">1</button>
            <!--%
        }
            %-->
           
<div class="modal fade" id="myModal" role="dialog" style="display:none">
    <div class="modal-dialog">
        <div class="qsModal">
            <div class="modHeader">
                <button type="button" style="outline: none" class="close" data-dismiss="modal">
                    <font size="6">&times;</font>
        </button>
            </div><br>
           <div class="row" id="question">
               <div id="qs" class="getQs col-lg-12 col-md-12">
                   <center>
                   </center>
               </div>
           </div>
            <br><br>
               <div class="getOp row">
                   <div class="col-lg-6">
                       
                       <input type="radio" name="op1" value="1" id="r1"><span id="o1"></span>
                   </div>
                   <div class="col-lg-6">
                   <input type="radio" name="op1" value="2" id="r2"><span id="o2"></span>
                   </div>
               </div><br>
                <div class="getOp row">
                    <div class="col-lg-6">
                   <input type="radio" name="op1" value="3" id="r3"><span id="o3"></span>
                    </div>
                    <div class="col-lg-6">
                   <input type="radio" name="op1" value="4" id="r4"><span id="o4"></span>
                    </div>
               
                </div><br><br>
               <div id="a" value=""></div>
               <div class="col-sm-6 col-sm-offset-3">
                   <input type="button" name="lock" id="lock" class="form-control btn btn-success bttn" value="LOCK" onclick="lockbtn()" data-dismiss="modal">
               </div>
            </div>    
         </div>
    </div>
 
      
                    
  
           

             


    </form>
<form method="POST" action="result.jsp">
            <input type="submit" class="submit bttn btn btn-danger getOp" value="SUBMIT">
</form> 
<img id="logo" src="pics/logo_1.jpg"/>
<img id="final" src="pics/finish1.png"/>
</body>

<!form method="POST" action="result.jsp">
<!input type="submit" value="SUBMIT"/>
<!--/form-->
<%
    } else {
        request.setAttribute("msg", "PLEASE LOGIN TO CONTINUE!!");
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }
%>