<%@ page import="java.util.List" %>
<%@ page import="codeu.model.data.Conversation" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.store.basic.UserStore" %>
<%
Conversation conversation = (Conversation) request.getAttribute("conversation");
List<Message> messages = (List<Message>) request.getAttribute("messages");
%>

<!DOCTYPE html>
<html>
<head>
  <title>Profile Page</title>
  <link rel="stylesheet" href="/css/main.css">
 <style>
   label {
     display: inline-block;
     width: 100px;
   }
 </style>
 <!-- Import JQuery-->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>
  <nav>
    <a id="navTitle" href="/">CodeU Chat App</a>
    <a href="/conversations">Conversations</a>
      <% if (request.getSession().getAttribute("user") != null) { %>
        <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
        <a href="/users/<%=request.getSession().getAttribute("user")%>">Profile</a>
        <% } else { %>
      <a href="/login">Login</a>
      <a href="/register">Register</a>
    <% } %>
    <a href="/about.jsp">About</a>
  </nav>

  <!-- gets profile page owner's username-->
  <script>
    var url = window.location.pathname;
    var profileName = url.substring(url.lastIndexOf('/')+1);
  </script>

  <div id="container">
    <h1><script>
      document.write(profileName)
      </script>'s Profile Page</h1>
  </div>

  <div class="own_page"><center>
    Edit your About Me (only you can see this)
    <input type="text" id="aboutMe"></center>
  </div>

  <script>
  if (isSameUser(profileName) == true){
    $(".own_page").show();
  }
  </script>

</body>
</html>
