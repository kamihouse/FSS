<!-- #include file="topo.asp" -->
<%
	idString = Request.QueryString("id")
	// Libera atendente (ONLINE)
	SQL_STATUS_AT = "UPDATE Atendentes SET ONLINE = 0 WHERE ID_ATENDENTE = "& idString
	Conn.Execute(SQL_STATUS_AT)
	
	
	Response.Redirect "index.asp"
%>
<!-- #include file="rodape.asp" -->