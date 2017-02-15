<%@include file="template/header.inc" %>

<% String str = session.getAttribute("email").toString(); %>

Bienvenue <%=str%> !

<%@include file="template/footer.inc" %>