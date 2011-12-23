<% Response.Charset="ISO-8859-1" %>
<!-- #include file="conexao_on.asp" -->

		<%
			idString = Request.QueryString("id")
			nomeString = Request.QueryString("att")
		
			SQL_Atendente = "SELECT NOME_COMPLETO, EMAIL, INICIO_ATENDIMENTO, COD_ATENDIMENTO, INFO_EXTRA FROM Atendimentos WHERE ID_ATENDENTE = "& idString &" AND CHAT = 1"
			Set rs = Conn.Execute(SQL_Atendente)
			
			While not rs.EOF
				Response.Write	"<a href='aceita.asp?id="& idString &"&cod="& rs("COD_ATENDIMENTO") &"&att="& nomeString &"'>Aceitar</a> | <a href='recusa.asp?id="& idString &"&cod="& rs("COD_ATENDIMENTO") &"&att="& nomeString &"'>Recusar</a> [Cod: "& rs("COD_ATENDIMENTO") &"] - <strong>"& rs("NOME_COMPLETO") &"</strong> - "& rs("EMAIL") &" ("& rs("INICIO_ATENDIMENTO") &") - "& rs("INFO_EXTRA") &" <bgsound src='alerta.mp3'><br />"
				rs.moveNext
			Wend
		%>
<!-- #include file="conexao_off.asp" -->