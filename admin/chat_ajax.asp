<% Response.Charset="ISO-8859-1" %>
<!-- #include file="conexao_on.asp" -->
<%
	// Recuperando dados do Atendimento
	SQL = "SELECT MENSAGENS FROM Atendimentos WHERE COD_ATENDIMENTO = "& Session("codString") &""
	Set rs = Conn.Execute(SQL)

	Response.Write rs("MENSAGENS")
%>
<!-- #include file="conexao_off.asp" -->