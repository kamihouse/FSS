<!-- #include file="conexao_on.asp" -->
		<%
			codString = Request.QueryString("cod")
			idString = Request.QueryString("id")
			nomeString = Request.QueryString("att")
		
			SQL_Recusa = "UPDATE Atendimentos SET ID_ATENDENTE = "& idString &", MENSAGENS = '*** Atendimento Recusado pelo Atendente. (NÃO REALIZADO!)', FIM_ATENDIMENTO = '"& now() &"', CHAT = 3 WHERE COD_ATENDIMENTO = "& codString
			Set rs = Conn.Execute(SQL_Recusa)
			
			Response.Redirect ("atendente_inicial.asp?id="& idString &"&att="& nomeString &"")
		%>
<!-- #include file="conexao_off.asp" -->