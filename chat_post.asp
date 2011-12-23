<% Response.Charset="ISO-8859-1" %>
<!-- #include file="conexao_on.asp" -->
<%
	mensagem = Replace(Request("mensagem"), "'", "")
	
	If(mensagem = "") Then
		Response.Write "*Por favor, preencha o campo antes de clicar em Enviar..."
	Else	
		SQL = "UPDATE Atendimentos SET MENSAGENS = '» <strong>Cliente: </strong>' + '"& mensagem &"' + '<br />' + MENSAGENS  WHERE COD_ATENDIMENTO = "& Session("codigo")
		Conn.Execute(SQL)
	End If
%>
<!-- #include file="conexao_off.asp" -->