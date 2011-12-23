<!-- #include file="topo.asp" -->
<div>
		<h1>Administrador - Relatorios (Just-in-time)</h1>
<h3>Atendentes Online</h3>
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
		
		<br />
	
			<!-- Atualizando Atendimentos via AJAX -->
		<script type="text/javascript"> 
			function atualizaRelatorio() { 
				$.get('relatorios_ajax.asp', function(data) { 
					$('div#escreverRelatorios').html(data); 
				});
			}				
			setInterval('atualizaRelatorio()',2000); 
		</script> 
		<div id="escreverRelatorios"></div>


			
<!-- #include file="rodape.asp" -->