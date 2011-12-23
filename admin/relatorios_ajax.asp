<% Response.Charset="ISO-8859-1" %>
<!-- #include file="conexao_on.asp" -->
	<table border="1" width="99%">
<tr>
				<td width="33%" valign="top"><H3>Atendimentos Concluidos:</H3>
				<%
					SQL_Atendimentos = "SELECT Atendimentos.ID_ATENDIMENTO, Atendimentos.COD_ATENDIMENTO, Atendimentos.NOME_COMPLETO, Atendimentos.EMAIL, Atendimentos.INICIO_ATENDIMENTO, Atendimentos.ID_ATENDENTE, Atendimentos.FIM_ATENDIMENTO, Atendentes.NOME_ATENDENTE FROM Atendimentos INNER JOIN Atendentes ON Atendentes.ID_ATENDENTE = Atendimentos.ID_ATENDENTE WHERE Atendimentos.CHAT = 4 ORDER BY ID_ATENDIMENTO DESC"
					Set rs = Conn.Execute(SQL_Atendimentos)
					
					While not rs.EOF
						Response.Write	"Atendente: <strong>"& rs("NOME_ATENDENTE") &"</strong> <br />#COD: "& rs("COD_ATENDIMENTO") &" - <a href='../atendimento.asp?acao=buscarAten1&acaoAtendente="& rs("COD_ATENDIMENTO") &"' target='_blank'>Ver Detalhes</a> <br />» <strong>"& rs("NOME_COMPLETO") &"</strong> - "& rs("EMAIL") &"<br />(Inicio: "& rs("INICIO_ATENDIMENTO") &" Fim: "& rs("FIM_ATENDIMENTO") &") <hr />"
						rs.moveNext
					Wend
				%>
				</td>
				<td width="33%" valign="top"><h3>Atendimentos Cancelados pelo Atendente:</h3>
				<%
					SQL_Atendimentos = "SELECT Atendimentos.ID_ATENDIMENTO, Atendimentos.COD_ATENDIMENTO, Atendimentos.NOME_COMPLETO, Atendimentos.EMAIL, Atendimentos.INICIO_ATENDIMENTO, Atendimentos.ID_ATENDENTE, Atendimentos.FIM_ATENDIMENTO, Atendentes.NOME_ATENDENTE FROM Atendimentos INNER JOIN Atendentes ON Atendentes.ID_ATENDENTE = Atendimentos.ID_ATENDENTE WHERE Atendimentos.CHAT = 3 ORDER BY ID_ATENDIMENTO DESC"
					Set rs = Conn.Execute(SQL_Atendimentos)
					
					While not rs.EOF
						Response.Write	"Atendente: <strong>"& rs("NOME_ATENDENTE") &"</strong> <br />#COD: "& rs("COD_ATENDIMENTO") &" - <a href='../atendimento.asp?acao=buscarAten1&acaoAtendente="& rs("COD_ATENDIMENTO") &"' target='_blank'>Ver Detalhes</a> <br />» <strong>"& rs("NOME_COMPLETO") &"</strong> - "& rs("EMAIL") &"<br />(Inicio: "& rs("INICIO_ATENDIMENTO") &" Fim: "& rs("FIM_ATENDIMENTO") &") <hr />"
						rs.moveNext
					Wend
				%>
				</td>
				<td width="33%" valign="top"><h3>Atendimentos neste momento:</h3>
				<%
					SQL_AtendimentosMomento = "SELECT Atendimentos.ID_ATENDIMENTO, Atendimentos.COD_ATENDIMENTO, Atendimentos.NOME_COMPLETO, Atendimentos.EMAIL, Atendimentos.INICIO_ATENDIMENTO, Atendimentos.ID_ATENDENTE, Atendimentos.FIM_ATENDIMENTO, Atendentes.NOME_ATENDENTE FROM Atendimentos INNER JOIN Atendentes ON Atendentes.ID_ATENDENTE = Atendimentos.ID_ATENDENTE WHERE Atendimentos.CHAT = 2 ORDER BY ID_ATENDIMENTO DESC"
					Set rs = Conn.Execute(SQL_AtendimentosMomento)
					
					While not rs.EOF
						Response.Write	"Atendente: <strong>"& rs("NOME_ATENDENTE") &"</strong> <br />#COD: "& rs("COD_ATENDIMENTO") &" - <a href='../atendimento.asp?acao=buscarAten1&acaoAtendente="& rs("COD_ATENDIMENTO") &"' target='_blank'>Ver Detalhes</a> <br />» <strong>"& rs("NOME_COMPLETO") &"</strong> - "& rs("EMAIL") &"<br />(Inicio: "& rs("INICIO_ATENDIMENTO") &" "& rs("FIM_ATENDIMENTO") &") <hr />"
						rs.moveNext
					Wend
				%>
				</td>
			</tr>
</table>	
<!-- #include file="conexao_off.asp" -->
