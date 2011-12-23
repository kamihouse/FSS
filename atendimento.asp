<!-- #include file="topo.asp" -->

	<!-- Histórico de Atendimento -->
	<h1>FSS - Fast System Support <span>(On-Line)</span></h1>
	
	<div class="moldura bordas_modelo">
		<div class="quadro bordas_modelo">
			<h2>Buscar Atendimento Realizado</h2>
			<div class="">» <a href="index.asp">Dados Pessoais</a> » Buscar Atendimento Realizado</div>
			<p>Informe #ID do atendimento realizado.</p>
			
			<form id="teste" action="atendimento.asp?acao=buscar" method="post">
				
				<label for="id_atendimento">#ID</label>
				<div class="campos">
					<input type="text" name="id_atendimento" value="" id="id_atendimento" maxlength="40" onkeyup="javascript:this.value = this.value.replace(/[^0-9]/g, '');" />
				</div>
				
				<input class="botao" type="submit" value="Continuar" />
			</form>
			
			<%
				acao = Replace(Request.QueryString("acao"),"'","")
				acaoAtendente = Replace(Request.QueryString("acaoATendente"),"'","")
				
				If(acao = "buscarAten1")Then
				
					SQL = "SELECT * FROM Atendimentos WHERE COD_ATENDIMENTO = "&acaoAtendente
					Set rs = Conn.Execute(SQL)
					
					Session("cod_atendimento1") = acaoAtendente
					Response.Redirect ("atendimento_hist.asp")
				End If
				
				If(acao = "buscar") Then
					codigo1 = Request.Form("id_atendimento")
					
					If(codigo1="") Then
						Response.Write "<br /> <strong>*Por favor, preencha o campo #ID, antes de clicar em Enviar...</strong>"
					Else
						SQL = "SELECT * FROM Atendimentos WHERE COD_ATENDIMENTO = "&codigo1
						Set rs = Conn.Execute(SQL)
						
						If (rs.EOF) Then
							Response.Write "<br /> <strong>*Nenhum Registro encontrado...</strong><br />Por favor, confirme o #ID informado e efetue a consulta novamente."
						Else
							Session("cod_atendimento1") = codigo1
							Response.Redirect "atendimento_hist.asp"
						End If
					End If
				Else
					//sem acao
				End if
				
			%>
		</div>
	</div>
	
<!-- #include file="rodape.asp" -->