<!-- #include file="topo.asp" -->
<%
	// Libera atendente (ONLINE)
	SQL_STATUS_AT = "UPDATE Atendentes SET ONLINE = 1 WHERE ID_ATENDENTE = "& session("idString")
	Conn.Execute(SQL_STATUS_AT)
	
	// Coloca status finalizado no atendimento
	// 1- Aguardando 2- Em Chat, 3- Cancelado, 4- Finalizado
	SQL_ATENDIMENTO = "UPDATE Atendimentos SET CHAT = 4, FIM_ATENDIMENTO = '"& now() &"' WHERE COD_ATENDIMENTO = "& session("codString")
	Conn.Execute(SQL_ATENDIMENTO)
	
	Response.Redirect "atendente_inicial.asp?id="& session("idString") &"&att="& session("nomeString") &""
%>
<!-- #include file="rodape.asp" -->