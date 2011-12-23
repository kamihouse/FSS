<%
	Dim Conn, Caminho
	Caminho = Server.MapPath("fss_database.mdb")
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Caminho & ";"
%>