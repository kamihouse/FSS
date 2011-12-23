<!-- #include file="topo.asp" -->
<%

// Limpando todas sessoes abertas antes de iniciar os Processos
//Session.Contents.RemoveAll()

	idString = Request.QueryString("id")
	nomeString = Request.QueryString("att")
	
	// Disponibilizando Atendente para Suporte
	SQL_STATUS_AT = "UPDATE Atendentes SET ONLINE = 1 WHERE ID_ATENDENTE = "& idString
	Conn.Execute(SQL_STATUS_AT)
%>
	<div>
		<h1><img src="../imagens/atendON.png" alt="OnLine" />Administrador - Tela Inicial</h1>
		
		<p align="center"><strong><%= nomeString %> - <a href="logof.asp?id=<%= idString %>">Encerrar Sessão</a><br /></strong></p>
		
		<hr />
		<h3>Aceitar ou Recusar Atendimento(s).........:</h3>
		<!-- Atualizando Atendentes via AJAX -->
		<script type="text/javascript"> 
			function atualizaChamado() { 
				$.get('atendente_aceita_ajax.asp?id=<%= idString%>&att=<%= nomeString%>', function(data) { 
					$('div#escreverChamado').html(data); 
				});
			}				
			setInterval('atualizaChamado()',3000); 
		</script> 
		<div id="escreverChamado"></div>
		
		
		<br /><hr />
		<h3>Atendente(s) OnLine................................:</h3>
		<!-- Atualizando Atendentes via AJAX -->
		<script type="text/javascript"> 
			function atualizaAtendente() { 
				$.get('atendentes_on_ajax.asp', function(data) { 
					$('div#escreverAtendente').html(data); 
				});
			}				
			setInterval('atualizaAtendente()',2000); 
		</script> 
		<div id="escreverAtendente"></div>
		
		
		<br /><hr />
		<h3>Histórico de (7) Atendimento(s)...............:</h3>
		<%
			SQL_Atendimentos = "SELECT TOP 7 ID_ATENDIMENTO, COD_ATENDIMENTO, NOME_COMPLETO, EMAIL, INICIO_ATENDIMENTO FROM Atendimentos WHERE ID_ATENDENTE = "& idString &" AND CHAT = 4 ORDER BY ID_ATENDIMENTO DESC"
			Set rs = Conn.Execute(SQL_Atendimentos)
			
			While not rs.EOF
				Response.Write	"#COD: "& rs("COD_ATENDIMENTO") &" <br />» <strong>"& rs("NOME_COMPLETO") &"</strong> ("& rs("EMAIL") &" - "& rs("INICIO_ATENDIMENTO") &") -- -- <a href='../atendimento.asp?acao=buscarAten1&acaoAtendente="& rs("COD_ATENDIMENTO") &"' target='_blank'>Ver Detalhes</a><br /><br />"
				rs.moveNext
			Wend
		%>
	</div>
	<!-- #include file="rodape.asp" -->