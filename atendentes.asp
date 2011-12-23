<!-- #include file="topo.asp" -->

	<!-- Escolher Atendentes -->
	
	<h1>FSS - Fast System Support <span>(On-Line)</span></h1>
	
	<div class="moldura bordas_modelo">
		<div class="quadro bordas_modelo">
			<h2>Selecionar Atendente</h2>
			<div class="">» <a href="index.asp">Dados Pessoais</a> » Selecionar Atendente</div>
			<p>Clique no Atendente para iniciar o atendimento.</p>
			
			<!-- Atualizando Atendentes via AJAX -->
			<script type="text/javascript"> 
				function atualizaAtendente() { 
					$.get('atendentes_ajax.asp', function(data) { 
						$('div#escreverAtendente').html(data); 
					});
				}				
				setInterval('atualizaAtendente()',2000); 
			</script> 
			<div id="escreverAtendente"></div>
		</div>
	</div>
	
<!-- #include file="rodape.asp" -->