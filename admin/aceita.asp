<!-- #include file="conexao_on.asp" -->
		<%
			session("codString") = Request.QueryString("cod")
			session("idString") = Request.QueryString("id")
			session("nomeString") = Request.QueryString("att")
			
			// Preparando para o inicio do chat 
			SQL_Aceita = "UPDATE Atendimentos SET MENSAGENS = '« <strong>Atendente: </strong>Olá, em que posso ajudar?', CHAT = 2 WHERE COD_ATENDIMENTO = "& session("codString")
			
			// Confirmando o status de ocupado do atendente.
			SQL_ATOcupa = "UPDATE Atendentes SET ONLINE = 2 WHERE ID_ATENDENTE = "& session("idString")
			
			Conn.Execute(SQL_Aceita)
			Conn.Execute(SQL_ATOcupa)
			
			Response.Redirect ("chat.asp")
		%>
<!-- #include file="conexao_off.asp" -->