<!-- #include file="topo.asp" -->

	<!-- Escolher Atendentes -->
	<%
		Session("atendString") = Request.QueryString("atendente")
		codString = Session("codigo")
		
		If (Session("atendString") = "") Then
			Response.Redirect "index.asp?erro=Atendente"
		else
			//1 - Gravando dados na base de dados - AVISANDO ATENDENTE
			SQL_SAtendente = "UPDATE Atendimentos SET ID_ATENDENTE = "& Session("atendString") &", CHAT = 1 WHERE COD_ATENDIMENTO = "& Session("codigo")
			Conn.Execute(SQL_SAtendente)
			
			//2 - Gravando dados na base de dados - INDISPONIBILIZANO ATENDENTE
			SQL_INAtendente = "UPDATE Atendentes SET ONLINE = 2 WHERE ID_ATENDENTE = "& Session("atendString")
			Conn.Execute(SQL_INAtendente)
		End If
	%>
	
	<h1>FSS - Fast System Support <span>(On-Line)</span></h1>
	<div class="moldura bordas_modelo">
		<div class="quadro bordas_modelo">
			<h2>Aguardando Atendente</h2>
			<div class="">» <a href="index.asp">Dados Pessoais</a> » <a href="#">Selecionar Atendente</a>  » Aguardando Atendente</div>
			<p>A partir de agora você deve aguardar o atendente responder, assim que a resposta acontecer, você será informado e em seguida direcionado para tela de Chat.</p>
			
			<!-- Atualizando via AJAX -->
			<script type="text/javascript"> 
				function atualizaA() { 
					$.get('aguardando_ajax.asp', function(data) { 
						$('div#escreverA').html(data); 
					});
				}				
				setInterval('atualizaA()',2000); 
			</script> 
			<div id="escreverA"></div>
			
			<script type="text/javascript">
			<!--
			var sHors = "0"+0; 
			var sMins = "0"+0;
			var sSecs = -1;
			function getSecs(){
				sSecs++;
				if(sSecs==60){
					sSecs=0;sMins++;
			    	if(sMins<=9)sMins="0"+sMins;
			    }
				if(sMins==60){sMins="0"+0;sHors++;
			    	if(sHors<=9)sHors="0"+sHors;
				}
				if(sSecs<=9)sSecs="0"+sSecs;
					document.getElementById("tempo").innerHTML = sHors+':'+sMins+':'+sSecs;
			    setTimeout("getSecs()",1000);
			}
			//-->
			</script>
			<p>Tempo em espera: [<span id="tempo"><script type="text/javascript">setTimeout("getSecs()",1000);</script></span>]</p>
		</div>
	</div>
	
<!-- #include file="rodape.asp" -->