<!-- #include file="topo.asp" -->
	<div>
		<h1>Administrador - <%= session("nomeString")%> - Chat</h1>
		
		<%
			If (Session("codString") = "") Then
				Response.Redirect "atendente_inicial.asp"
			Else
				// Recuperando dados do Atendimento
				SQL = "SELECT NOME_COMPLETO, EMAIL, INICIO_ATENDIMENTO, COD_ATENDIMENTO, INFO_EXTRA, MENSAGENS FROM Atendimentos WHERE COD_ATENDIMENTO = "& Session("codString") &""
				Set rs = Conn.Execute(SQL)
			End If
		%>
		
		<p><strong>#ID Atendimento: <%= Session("codString") %></strong></p>
		<hr />
		<p><strong>Início do Atendimento: </strong> <%= rs("INICIO_ATENDIMENTO") %><br />
		<strong>Cliente: </strong> <%= rs("NOME_COMPLETO") %> - <strong>Email: </strong><%= rs("EMAIL") %> - (Info: <%= rs("INFO_EXTRA") %>)</p>
		<hr />
		
		<!-- Atualizando chat via AJAX -->
		<script type="text/javascript"> 
			function atualizaChat() { 
				$.get('chat_ajax.asp', function(data) { 
					$('div#escreveChat').html(data); 
				});
			}				
			setInterval('atualizaChat()',2000); 
		</script>
		<div id="escreveChat" style="border: 1px solid #ccc; height:250px; overflow: auto;"></div>

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
		        if (window.event.keyCode == 13)
		        {
		            loadXMLDoc();
		        }
		    }
		</script>
		
		<p align="center"><input type="text" name="mensagem" id="mensagem" style="height: 25px; width: 90%; font-size:15px" onkeydown="pEnter()" maxlength="150" /><br>
		<input class="botao" type="image" src="../imagens/botao-enviar.png" value="Enviar" onclick="loadXMLDoc()" /></p>

		<p align="center"><a href="encerrar.asp" title="Clique para encerrar este atendimento">--> Encerrar Atendimento <--</a></p>
<!-- #include file="rodape.asp" -->