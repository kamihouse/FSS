<!-- #include file="conexao_on.asp" -->
<%
		nome = Replace(Request.Form("nome_completo"), "'", "")
		email = Replace(Request.Form("email"), "'", "")
		
		If (nome = "" Or email = "") Then
			Response.Redirect "index.asp?erro=Campos"
		Else
			data = Request.Form("datahora_info")
			info = Request.Form("navegador_info")
			Randomize
			Session("codigo") = Int(Rnd * 653825234) + 1
			
			//Gravando dados na base de dados
			SQL_Insert = "INSERT INTO Atendimentos (NOME_COMPLETO, EMAIL, INICIO_ATENDIMENTO, INFO_EXTRA, COD_ATENDIMENTO) VALUES ('"& nome &"', '"& email &"', '"& data &"', '"& info &"', '"& Session("codigo") &"')"
			Conn.Execute(SQL_Insert)
			
			Response.Redirect ("atendentes.asp")
		End If
	%>
<!-- #include file="conexao_off.asp" -->