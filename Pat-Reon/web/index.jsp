<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial;}

/* Style the tab */
.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;

}

/* Style the buttons inside the tab */
.tab button {
    background-color: inherit;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
  text-align:center;
  float: right;
  
}

/* Change background color of buttons on hover */
.tab button:hover {
    background-color: #ddd;

}

/* Create an active/current tablink class */
.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;

}

.tab input{
  background: #fff;
  border-radius: 5px;
  display: inline-block;
  height: 25px;
  margin: 0;
  padding: 2.5px;
  position: relative;
  transform: translateY(25%);
  width: 250px;
}
</style>
</head>
<body>
<div class="tab" > <a href="index.html">
        <button class="tablinks" onclick="openCity(event, 'London')" style="float: left;">PAT-REON</button></a>
  <%
      Cookie cookies[] = request.getCookies();
      boolean isLogged = false;
      int x = -1;
      for(int i = 0; i < cookies.length; i++)
        if(cookies[i].getName().equals("loggedIn") && cookies[i].getValue() != null){
            isLogged = true;
            x = i;
            break;
        }
            
      if(isLogged){
          out.println("<a href=\"profile.html\"><button class=\"tablinks\" onclick=\"\">"+cookies[x].getValue()+"</button></a>"
                  + "<a href=\"signOut.jsp\"><button class=\"tablinks\" onclick=\"\">Sign out</button></a>");
      }else{
          out.println("<a href=\"login.html\"><button class=\"tablinks\" onclick=\"\">log In</button></a>"
                  + "<a href=\"signup.html\"><button class=\"tablinks\" onclick=\"\">Sign Up</button></a>");
      }
  %>
  <a href="categories.html"><button class="tablinks" onclick="">Explore Creators</button></a>
  <div style="float: right; box-sizing: border-box;">
   <form action="/action_page.php">
     <input type="text" placeholder="Search.." name="search">
     <button type="submit">search</button>
   </form>
  </div>


</div>

<h1 style="font-size: 100px;">What is Pat-Reon?</h1>
<hr>
<p style="font-size: 30px">
  &nbsp;&nbsp;&nbsp;&nbsp;Pat-Reon is an online community for content creators. Pat-reon allows other people to pat them for their quality content. Patting is how content creators get income from Pat-Reon. <br><br>So don't just sit there, look up your favorite content creators and pat! :)
</p>

<script>
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>
     
</body>
</html> 
