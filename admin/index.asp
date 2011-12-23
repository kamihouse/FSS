<!-- #include file="topo.asp" -->
	<div>
		<h1>Administrador - Login</h1>
		
		<strong>Selecione seu Usuário abaixo:</strong>
		<hr /><br />
		<%
			SQL_Atendente = "SELECT ID_ATENDENTE, ONLINE, NOME_ATENDENTE FROM Atendentes"
			Set rs = Conn.Execute(SQL_Atendente)
			
			While not rs.EOF
				If (rs("ONLINE") = 1) Then
					Response.Write "<img src='../imagens/atendON1.png' alt='OnLine' width='14px' />"
				ElseIf (rs("ONLINE") = 2) Then
					Response.Write "<img src='../imagens/atendCH1.png' alt='OffLine' width='14px' />"
				Else
					Response.Write "<img src='../imagens/atendOFF1.png' alt='OffLine' width='14px' />"
				End If
				Response.Write	" <a href='atendente_inicial.asp?id="& rs("ID_ATENDENTE") &"&att="& rs("NOME_ATENDENTE") &"'>"& rs("NOME_ATENDENTE") &"</a> <br /><br />"
				rs.moveNext
			Wend
		%>
		
		<hr />
		<p align="center"><a href="relatorios.asp">Relatórios de Atendimento</a></p>
	</div>
	<!-- #include file="rodape.asp" -->