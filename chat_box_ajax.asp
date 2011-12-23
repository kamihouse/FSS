<% Response.Charset="ISO-8859-1" %>
<!-- #include file="conexao_on.asp" -->
<%
	// Recuperando dados do Atendimento
	SQL = "SELECT MENSAGENS, CHAT FROM Atendimentos WHERE COD_ATENDIMENTO = "& Session("codigo") &""
	Set rs = Conn.Execute(SQL)

	mensagem = rs("MENSAGENS")
	Response.Write mensagem
	
	If (rs("CHAT")=4) Then
		//Redirecionando janela fora do AJAX
		Response.Write "<script>window.open('index.asp?status=fim','_top');</script>"
	End If
%>
<!-- #include file="conexao_off.asp" -->