<% Response.Charset="ISO-8859-1" %>
<!-- #include file="conexao_on.asp" -->
		<%
			SQL_Atendente = "SELECT ID_ATENDENTE,ONLINE, NOME_ATENDENTE FROM Atendentes WHERE ONLINE = 1 OR ONLINE = 2"
			Set rs = Conn.Execute(SQL_Atendente)
			
			While not rs.EOF
				If (rs("ONLINE") = 1) Then
					Response.Write "<img src='../imagens/atendON1.png' alt='OnLine' width='14px' /> "
				ElseIf (rs("ONLINE") = 2) Then
					Response.Write "<img src='../imagens/atendCH1.png' alt='OffLine' width='14px' /> "
				Else
					Response.Write "<img src='../imagens/atendOFF1.png' alt='OffLine' width='14px' /> "
				End If
				Response.Write	""& rs("NOME_ATENDENTE") &" | "
				rs.moveNext
			Wend
		%>
<!-- #include file="conexao_off.asp" -->