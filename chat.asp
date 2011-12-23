<!-- #include file="topo.asp" -->

	<!-- Histórico de Atendimento -->
	<h1>FSS - Fast Support System <span>(On-Line)</span></h1>
	
	<%
		If(Session("codigo")="") Then
			Response.Redirect "index.asp?erro=sessao"
		End If
	
		SQL = "SELECT Atendimentos.ID_ATENDENTE, Atendimentos.NOME_COMPLETO, Atendimentos.EMAIL, Atendimentos.INICIO_ATENDIMENTO, Atendimentos.COD_ATENDIMENTO, "&_
				"Atendentes.ID_ATENDENTE, Atendentes.NOME_ATENDENTE, Atendentes.DEPTO "&_
				"FROM Atendimentos INNER JOIN Atendentes ON Atendimentos.ID_ATENDENTE = Atendentes.ID_ATENDENTE WHERE Atendimentos.COD_ATENDIMENTO = "& Session("codigo") &""
		Set rs = Conn.Execute(SQL)
	%>
	
	<div class="moldura bordas_modelo">
		<div class="quadro bordas_modelo">
			<h2>Chat com <%= rs("NOME_ATENDENTE") %></h2>
			<div class="">» <a href="index.asp">Dados Pessoais</a>  » <a href="atendentes.asp">Selecionar Atendente</a> » Chat com Atendente</div>
			<p>#ID Atendimento: <strong><%= rs("COD_ATENDIMENTO") %></strong> - Data/Hora: <%= rs("INICIO_ATENDIMENTO") %> <br />
			<strong>Cliente: <%= rs("NOME_COMPLETO") %> </strong>(<%= rs("EMAIL") %>)</p>
			
				<!-- Atualizando via AJAX -->
				<script type="text/javascript"> 
					function atualizaA() { 
						$.get('chat_box_ajax.asp', function(data) { 
							$('div#escreverA').html(data); 
						});
					}				
					setInterval('atualizaA()',1500); 
				</script>
				
				<div class="campos" style="height: 150px; overflow: auto">
					<div id="escreverA"></div>
				</div>
				
				<script type="text/javascript">
					function loadXMLDoc()
					{
					var xmlhttp;
					if (window.XMLHttpRequest)
					  {
					  xmlhttp=new XMLHttpRequest();
					  }
					else
					  {
					  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
					  }
					xmlhttp.onreadystatechange=function()
					  {
					  if (xmlhttp.readyState==4 && xmlhttp.status==200)
					    {
					    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
					    }
					  }
					xmlhttp.open("GET","chat_post.asp?mensagem="+document.getElementById('mensagem').value,true);
					xmlhttp.send();
					//Limpando o campo para digitar novamente...
					document.getElementById('mensagem').value = "";
					}
					
					function pEnter()
				    {
				        if (window.event.keyCode == '13'){
				            loadXMLDoc();
				        }
				    }
				</script>
				
				<!-- Formulario AJAX INICIO -->
				<label for="mensagem">Sua mensagem</label>
				<div id="myDiv"></div>
				<div class="campos">
					<input type="text" name="mensagem" value="" id="mensagem" maxlength="150" onkeydown="pEnter()" />
				</div>
					
				<input class="botao" type="button" value="Enviar" onclick="loadXMLDoc()" />
				<!-- Formulario FIM -->
		</div>
	</div>
	
<!-- #include file="rodape.asp" -->