<% Response.Charset="ISO-8859-1" %>
<!-- #include file="conexao_on.asp" -->
					<% 
						SQL_Select = "SELECT * FROM Atendimentos WHERE ID_ATENDENTE = "& Session("atendString") &" AND COD_ATENDIMENTO = "& Session("codigo") &""
						Set rs = Conn.Execute(SQL_Select)
						
						if (rs("CHAT") = 1) then
							response.write "<p><img src='imagens/carregando.gif' /><br />Contactando Atendente... <br />Por favor, aguarde resposta (pode demorar um pouco)...</p>"
						End If
						if (rs("CHAT") = 2) then
							response.write "<p><img src='imagens/ok.png' /><br />O Atendente está <strong>pronto para atende-lo</strong>...<br />Agora estamos preparando para redirecionar para o Chat.</p>"
							//Redirecionando janela fora do AJAX
							Response.Write "<script>window.open('chat.asp','_top');</script>"
						End If
						if (rs("CHAT") = 3) then
							response.write "<p><img src='imagens/atencao.png' /><br />Lamentamos informar, mas o atendente <strong>não pode atender sua solicitação</strong>...<br />Por favor, <a href='javascript:history.back();' title='Selecionar outro Atendente'>Clique Aqui</a> para selecionar outro atendente.<br /></p>"
						End If
						if (rs("CHAT") = 4) then
							response.write "<p><strong>Este atendimento foi Finalizado...</strong></p>"
						End If
					%>
<!-- #include file="conexao_off.asp" -->