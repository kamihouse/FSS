<!-- #include file="topo.asp" -->
<%
// Limpando todas sessoes abertas antes de iniciar os Processos
Session.Contents.RemoveAll()
%>
	<!-- Inicial -->
	<h1>FSS - Fast System Support <span>(On-Line)</span></h1>
	
	<div class="moldura bordas_modelo">
		<div class="quadro bordas_modelo">
			<h2>Dados Pessoais</h2>
			<div class="">» Dados Pessoais</div>
			<p>Informe seus dados pessoais para iniciar o atendimento.</p>
			
				<script type="text/javascript">
				function ValidaEmail()
				{
 					var obj = eval("document.forms[0].email");
 					var txt = obj.value;
 					if ((txt.length != 0) && ((txt.indexOf("@") < 1) || (txt.indexOf('.') < 7)))
 					{
  					  alert('Olá...\nSeu "E-mail" ainda não está completo. Informe-o antes de prosseguir');
						obj.focus();
					  }
				}
				</script>

			<form id="registrar" name="registrar" action="index_verifica.asp?acao=ok" method="post" >
				<input type="hidden" name="datahora_info" value="<%= now() %>" />
				<input type="hidden" name="navegador_info" value="Remoto: <%= request.ServerVariables("REMOTE_ADDR") %>, Local: <%= request.ServerVariables("REMOTE_HOST") %>" />
				
				<label for="nome_completo">Nome Completo</label>
				<div class="campos">
					<input type="text" name="nome_completo" value="" id="nome_completo" maxlength="40" />
				</div>
				
				<label for="email">E-mail</label>
				<div class="campos">
					<input type="text" name="email" value="" id="email" maxlength="40" onBlur="ValidaEmail();" />
				</div>
				
				<input class="botao" type="submit" value="Continuar" />
			</form>
			
			<br />
			<div id="atendimento_realizado"><a href="atendimento.asp">Histórico de Atendimento Realizado</a></div>
		</div>
	</div>
	
<!-- #include file="rodape.asp" -->