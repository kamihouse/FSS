<% Response.Charset="ISO-8859-1" %>
<!-- #include file="conexao_on.asp" -->
	<!-- Escolher Atendentes AJAX -->
			<div class="atendentes_foto">
				<ul id="fisheye_menu">
					<%
						//Verificando sessao antes de proseguir
						If(Session("codigo")="") Then
							Response.Write "<script>window.open('index.asp?erro=sessao','_top');</script>"
						End If
					
						SQL_Select = "SELECT ID_ATENDENTE, NOME_ATENDENTE, DEPTO, FOTO FROM Atendentes WHERE ONLINE = 1"
						Set rs = Conn.Execute(SQL_Select)
						
						x = 0
						FOR x = 1 to 5
							If rs.EOF Then
								Response.Write "<br /><br /><br /><br />Infelizmente não há nenhum atendente disponivel no momento... <br />Tente novamente mais tarde, ou <strong>aguarde</strong>."
								Exit FOR								
							Else
					%>
					<li><a href="aguardando.asp?atendente=<%= rs("ID_ATENDENTE")%>"><img src="imagens/<%= rs("FOTO")%>" alt="<%= rs("NOME_ATENDENTE")%>" width="130px" height="130px" /><span><strong>At:</strong> <%= rs("NOME_ATENDENTE")%><br /><strong>Dept:</strong> <%= rs("DEPTO")%></span></a></li>
					<%
								rs.MoveNext
							End If
						Next
					%>
				</ul>
			</div>
<!-- #include file="conexao_off.asp" -->