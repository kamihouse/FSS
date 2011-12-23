<!-- #include file="topo.asp" -->

	<!-- Histórico de Atendimento -->
	<h1>FSS - Fast System Support <span>(On-Line)</span></h1>
	
	<div class="moldura bordas_modelo">
		<div class="quadro bordas_modelo">
			<h2>Histórico Detalhado de Atendimento</h2>
			<div class="">» <a href="index.asp">Dados Pessoais</a> » <a href="atendimento.asp">Buscar Atendimento Realizado</a> » Histórico Detalhado de Atendimento</div>
			<p>Informamos abaixo os detalhes do seu atendimento.</p>
				<%
					If(Session("cod_atendimento1")="") Then
						Response.Redirect "index.asp?erro=sessao"
					Else
						SQL = "SELECT Atendimentos.ID_ATENDIMENTO, Atendimentos.COD_ATENDIMENTO, Atendimentos.NOME_COMPLETO, Atendimentos.EMAIL, Atendimentos.INICIO_ATENDIMENTO, Atendimentos.FIM_ATENDIMENTO, Atendimentos.INFO_EXTRA, Atendimentos.MENSAGENS, Atendentes.NOME_ATENDENTE FROM Atendimentos "&_
						"INNER JOIN Atendentes ON Atendimentos.ID_ATENDENTE = Atendentes.ID_ATENDENTE "&_
						"WHERE COD_ATENDIMENTO = "& Session("cod_atendimento1")
						Set rs = Conn.Execute(SQL)
					End If
				%>
				<label for="id_atendimento">#COD Atendimento</label>
				<div class="campos">
					<input type="text" name="id_atendimento" value="<%= rs("COD_ATENDIMENTO") %>" id="id_atendimento" readonly="true" />
				</div>
				
				<label for="nome">Cliente</label>
				<div class="campos">
					<input type="text" name="nome" value="<%= rs("NOME_COMPLETO") %>" id="nome" readonly="true" />
				</div>
				
				<label for="nome1">Atendente</label>
				<div class="campos">
					<input type="text" name="nome1" value="<%= rs("NOME_ATENDENTE") %>" id="nome1" readonly="true" />
				</div>
				
				<label for="email">E-Mail</label>
				<div class="campos">
					<input type="text" name="email" value="<%= rs("EMAIL") %>" id="email" readonly="true" />
				</div>
				
				<label for="data">Data do Atendimento</label>
				<div class="campos">
					<input type="text" name="data" value="<%= rs("INICIO_ATENDIMENTO") %> até <%= rs("FIM_ATENDIMENTO") %>" id="data" readonly="true" />
				</div>
				
				<label for="extra">Informações de Acesso</label>
				<div class="campos">
					<input type="text" name="extra" value="<%= rs("INFO_EXTRA") %>" id="extra" readonly="true" />
				</div>
				
				<label for="conversa">Diálogo (Atendimento)</label>
				<div class="campos">
					<div id="conversa"><%= rs("MENSAGENS") %></div>
				</div>
				
				<input class="botao" type="button" value="Sair" onclick="window.location.href='index.asp?erro=nao'" />				
		</div>
	</div>
	
<!-- #include file="rodape.asp" -->