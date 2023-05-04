programa
{
	inclua biblioteca Arquivos -->a
	inclua biblioteca ServicosWeb -->WS
	inclua biblioteca Texto --> TXT
	inclua biblioteca Matematica --> MAT
	
	cadeia simular = "S"
	inteiro opcao_escolhida
	
	

	
	funcao inicio()
	{
	     menu()
		
		leia(opcao_escolhida)
		limpa()
		se (opcao_escolhida > 14 ou opcao_escolhida < 1 ){
			escreva("OPÇÃO INVALIDA TENTE NOVAMENTE!")
			linha()
			inicio()
		}

		seletor_programa(opcao_escolhida)
		
	}
	funcao seletor_programa(inteiro opcao)
	{
		
		
		escolha(opcao)
		{
			
			caso 1:
			limpa()
			simulador_inss()
			pare
			caso 2:
			limpa()
				simulador_imposto_de_renda()
			pare
			caso 3:
			limpa()
				simulador_ferias()
			pare 
			caso 4:
			limpa()
				simulador_fgtss()
			pare
			caso 5:
			limpa()
				simulador_multa_fgts()
			pare
			caso 6:
			limpa()
				simulador_seguro_desemprego()
			pare
			caso 7:
			limpa()
				simulador_vale_transporte()
			pare
			caso 8:
			limpa()
				simulador_pis()
			pare
			caso 9:
			limpa()
				simulador_adicional_noturno()
			pare
			caso 10:
			limpa()
				simulador_periculosidade()
		     pare
		     caso 11:
		     limpa()
		          simulador_hora_extra()
		     pare
		     caso 12:
		     limpa()
		     	simulador_dados_pessoais()
		     pare
		     caso 13:
		     limpa()
		     simulador_final()
		     pare
			caso 14:
			limpa()
			escreva("OBRIGADO VOLTE SEMPRE!")
			pare
		}
		
	} 
	funcao menu()
	{
	     escreva("                  --SISTEMA RH--      \n")
	     escreva("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
	     escreva("\n")
		escreva("[1]-DESCONTO INSS.        [2]-DESCONTO IMPOSTO IRRF.\n")
		escreva(" \n")
		escreva("[3]-CALCULO DE FERIAS.    [4]-CALCULO MENSAL FGTS.\n")
		escreva(" \n")
		escreva("[5]-MULTA FGTS.           [6]-BENEFÍCIO SEGURO-DESEMPREGO\n")
		escreva(" \n")
		escreva("[7]-VALE TRANSPORTE       [8]-PIS\n")
		escreva(" \n")
		escreva("[9]-ADICIONAL NOTURNO     [10]-ADICIONAL PERICULOSIDADE\n")
		escreva(" \n")
		escreva("[11]-HORAS EXTRAS         [12]-CADASTRAR FUNCIONÁRIO\n")
		escreva(" \n")
		escreva("[13]-CONTRACHEQUE         [14]-SAIR DO PROGRAMA\n")
		escreva("\n")
		escreva("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		
		escreva("DIGITE A OPÇÃO QUE VOCÊ DESEJA EXECUTAR: ")
	}
	funcao real calculo_adicional_noturno(real salario,real hora_noturnas_feitas_no_mes)
	{
		const real HORAS_DE_TRABALHO = 220.00
		real valor_por_hora,valor_do_adicional, salario_com_adicional
		
		valor_por_hora = salario / HORAS_DE_TRABALHO
		valor_do_adicional = valor_por_hora * 0.20
		salario_com_adicional = hora_noturnas_feitas_no_mes * (valor_por_hora + valor_do_adicional)
		retorne salario_com_adicional
	}
	funcao real calculo_vale_transporte(real salario )
	{
		real desconto_vale_transporte
		
		
		desconto_vale_transporte = salario  * 0.06
		desconto_vale_transporte = MAT.arredondar(desconto_vale_transporte, 2)
		retorne desconto_vale_transporte
	}
	funcao real calculo_periculosidade( real salario,real horas_periculosidade)
	{
		
		real adicional_periculosidade = 0.0
			
		adicional_periculosidade = (salario / 200) * 0.30 * horas_periculosidade
				
		retorne adicional_periculosidade
		
			
		
	}
	funcao real calculo_hora_extra(real salario, real horas_feitas)
	{ 
		real total_a_receber, valor_da_hora_extra, valor_da_hora_trabalhada
		valor_da_hora_trabalhada = (salario / 220)
		valor_da_hora_extra = valor_da_hora_trabalhada * 0.20
		total_a_receber = (valor_da_hora_extra + valor_da_hora_trabalhada) * horas_feitas
		retorne total_a_receber
	}
	funcao real calculo_ferias(real salario, real venda_ferias)
{
	real valor_do_dia = salario / 30
	real valor_ferias = 0.0

	se(venda_ferias > 10){
		limpa()
		escreva("ERRO! O NÚMERO MÁXIMO DE DIAS QUE PODEM SER VENDIDOS É 10.\n")
		escreva("TENTE NOVAMENTE!\n")
		simulador_ferias()
	}
	
	valor_ferias = (venda_ferias * valor_do_dia) + (salario / 3) + (venda_ferias * valor_do_dia) / 3
	retorne valor_ferias
	}
	funcao real calcula_inss(real salario)
	{
		real salario_restante, valor_do_desconto = 0.0, calculo_do_imposto
		se(salario <= 1302.00){
			calculo_do_imposto = (salario / 100)* 7.5
			calculo_do_imposto = MAT.arredondar(calculo_do_imposto, 2)
			valor_do_desconto = calculo_do_imposto + valor_do_desconto
			retorne valor_do_desconto
		}
		senao se(salario < 2571.29){
			valor_do_desconto = valor_do_desconto + 97.65
			calculo_do_imposto = ((salario - 1302.01) / 100)* 9
			calculo_do_imposto = MAT.arredondar(calculo_do_imposto, 2)
			valor_do_desconto = calculo_do_imposto + valor_do_desconto
			retorne valor_do_desconto
		}
		senao se(salario < 3856.94 ou salario < 5507.49){
			valor_do_desconto = valor_do_desconto + 97.65 + 114.23
			calculo_do_imposto = ((salario - 2571.30) / 100)* 12
			calculo_do_imposto = MAT.arredondar(calculo_do_imposto, 2)
			valor_do_desconto = calculo_do_imposto + valor_do_desconto
			retorne valor_do_desconto
		}

		senao se(salario > 7507.49){
			valor_do_desconto = valor_do_desconto + 97.65 + 114.24 + 154.28
			calculo_do_imposto = ((7507.49 - 3856.95) / 100)* 14
			calculo_do_imposto = MAT.arredondar(calculo_do_imposto, 2)
			valor_do_desconto = calculo_do_imposto + valor_do_desconto
			retorne valor_do_desconto
		}
	retorne valor_do_desconto
	}
	funcao real calcula_imposto_de_renda (real salario)
	{
		real desconto_inss,desconto_imposto_de_renda = 0.0
		
		
		se(salario <= 1903.98){
			escreva("SUA FAIXA SALÁRIAL ESTÁ ISENTA DO IMPOSTO DE RENDA! (IRRF)\n")
		}
		senao se (salario <= 2826.65){
			desconto_imposto_de_renda = (salario / 100) * 7.5 - 142.80
			desconto_imposto_de_renda = MAT.arredondar(desconto_imposto_de_renda, 2)
			retorne desconto_imposto_de_renda
		}
		senao se (salario <=  3751.05){
			desconto_imposto_de_renda = (salario / 100) * 15 - 354.80
			desconto_imposto_de_renda = MAT.arredondar(desconto_imposto_de_renda, 2)
			retorne desconto_imposto_de_renda
			
		}
		senao se (salario <= 4664.68 ){
			desconto_imposto_de_renda = (salario / 100) * 22.5 - 636.13
			desconto_imposto_de_renda = MAT.arredondar(desconto_imposto_de_renda, 2)
			retorne desconto_imposto_de_renda
			
		}
		senao se (salario > 4664.68 ){
			desconto_imposto_de_renda = (salario / 100) * 27.5 - 869.36
			desconto_imposto_de_renda = MAT.arredondar(desconto_imposto_de_renda, 2)
			retorne desconto_imposto_de_renda
		}
		retorne desconto_imposto_de_renda
	}
	funcao calculo_pis(real salario,real meses_trabalhando,real anos_de_carteira)
	{
		const real SALARIO_MINIMO = 1320.00
		real media_salario, valor_para_receber
		media_salario = (salario * meses_trabalhando)/meses_trabalhando
		limpa()
		se(anos_de_carteira < 5){
			linha()
			escreva("INFELIZ MENTE NÃO TEM DIREITO A RECEBER O AUXILIO\n")
			escreva("\n")
			escreva("SOMENTE PESSOAS COM NO MINIMO 5 ANOS DE CARTEIRA ASSINADA!\n")		
		}
		senao se (media_salario > SALARIO_MINIMO){
			linha()
			escreva("INFELIZ MENTE NÃO TEM DIREITO A RECEBER O AUXILIO\n") 
			escreva("\n")
			escreva("SUA FAIXA SALARIAL ULTRAPASSOU O LIMITE PERMITIDO!!\n")
		}

		senao
		{
			linha()
			valor_para_receber = (SALARIO_MINIMO / meses_trabalhando) * meses_trabalhando
			escreva("VOCÊ TEM DIREITO DE RECEBER!\n")
			escreva("\n")
			escreva("O VALOR DE: ",valor_para_receber,"R$\n")
		}
	}
	funcao  calculo_seguro_desemprego(inteiro meses_trabalhados, inteiro vezes_solicitado)
	{
		
		
		se(vezes_solicitado == 0)
			{
			  se(meses_trabalhados < 12)
			  {
			  	linha()
			  	escreva("NÃO ESTÁ APTO A RECEBER O BENEFÍCIO")
			  }
			  se(meses_trabalhados > 11 e meses_trabalhados < 24)
			  {
			  	linha()
			     escreva("ESTÁ APTO A RECEBER 4 PARCELAS")
			  }
			  se(meses_trabalhados > 24)
			  {
			  	linha()
			  	escreva("ESTÁ APTO A RECEBER 5 PARCELAS")
			  }
			}
			se(vezes_solicitado == 1)
			{
				se(meses_trabalhados < 9)
				{
					linha()
					escreva("VOCÊ NÃO ESTÁ APTO A RECEBER O BENEFICIO!")
				}
				se(meses_trabalhados > 8 e meses_trabalhados < 12)
				{
					linha()
					escreva("ESTÁ APTO A RECEBER 3 PARCELAS")
				}
				se(meses_trabalhados > 11 e meses_trabalhados < 24)
				{
					linha()
					escreva("ESTÁ APTO A RECEBER 3 PARCELAS") 
				}
				se (meses_trabalhados > 23)
				{
					linha()
					escreva("ESTÁ APTO A RECEBER 5 PARCELAS")
				}
			}
			se (vezes_solicitado >= 2)
			{
				se(meses_trabalhados < 6)
				{
					linha()
					escreva("NÃO! ESTÁ APTO A RECEBER O BENEFÍCIO")
				}
				se(meses_trabalhados < 12 e meses_trabalhados > 5)
				{
					linha()
					escreva("ESTÁ APTO A RECEBER 3 PARCELAS")
				}
				se(meses_trabalhados > 11 e meses_trabalhados < 24)
				{
					linha()
					escreva("ESTÁ APTO A RECEBER 4 PARCELAS")
				}
				se(meses_trabalhados > 23)
				{
					linha()
					escreva("ESTÁ APTO A RECEBER 5 PARCELAS")
				}
			}
		
	}
	funcao real calculo_fgts(real valor_em_conta)
	{    
		real multa
		multa = valor_em_conta * 40.00 / 100.00
		multa = MAT.arredondar(multa, 2)
		retorne multa
	}
	funcao simulador_imposto_de_renda()
	{
		real salario,desconto_imposto_de_renda,desconto_inss
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n         -=-=-=- DESCONTO IRRF -=-=-=-=\n")
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n")
		escreva("\n")
		escreva("INFORME O SEU SALÁRIO → R$")
		leia(salario)
		desconto_inss = salario - calcula_inss(salario)
		desconto_imposto_de_renda = calcula_imposto_de_renda (desconto_inss)
		linha()
		escreva ("O VALOR DO SEU DESCONTO FOI DE: R$",desconto_imposto_de_renda)
		repetidor()
		
	}
	funcao simulador_inss()
	{
		
		real desconto, salario
		limpa()
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n       -=-=-=- DESCONTO INSS -=-=-=-=\n")
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n")
		escreva("\n")
		escreva("INFORME O SEU SALÁRIO: → R$")
		leia(salario)
		desconto = calcula_inss(salario)
		linha()
		escreva("O VALOR DO SEU DESCONTO FOI DE : R$",desconto)
		repetidor()
		
	}
	funcao linha()
	{
	escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\n")
	}
	funcao repetidor()
	{
		linha()
		escreva("\n")
		escreva("DESEJA REPETIR A OPERAÇÃO ? SIM → [S] / NÃO → [N] : ")
		leia(simular)
		simular = TXT.caixa_alta(simular)
		se(simular != "S")
		{
			limpa()
			inicio()
		}
		se(simular == "S")
		{
			limpa()
			seletor_programa(opcao_escolhida)
		}
	}
	funcao simulador_dados_pessoais()
	{	
		inteiro cep, arquivo
		cadeia nome,email,resultado_cep,numero_telefone
		logico verificar_se_existe_arquivo
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n      -=-=-=- CADASTRAR FUNCIONÁRIO -=-=-=-=\n")
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n")
		escreva("\n")
		verificar_se_existe_arquivo = a.arquivo_existe("/banco_dados.txt")
		escreva("INFORME O SEU NOME COMPLETO: → ")
		leia(nome)
		nome = TXT.caixa_alta(nome)
		escreva("INFORME O SEU NÚMERO DE TELEFONE FORMATO [99-9 9999 9999]: → ")
		leia(numero_telefone)
		numero_telefone = TXT.caixa_alta(numero_telefone)
		escreva("INFORME O SEU E-MAIL: → ")
		leia(email)
		email = TXT.caixa_alta(email)
		escreva("INFORME O SEU CEP: → ")
		leia(cep)
		resultado_cep = captura_de_dados_pessoais(cep)
		resultado_cep = TXT.caixa_alta(resultado_cep)
		
		se(verificar_se_existe_arquivo == verdadeiro)
		{
		arquivo = a.abrir_arquivo("/banco_dados.txt", a.MODO_ACRESCENTAR)
		a.escrever_linha(nome, arquivo)
		a.escrever_linha(numero_telefone, arquivo)
		a.escrever_linha(email, arquivo)
		a.escrever_linha(resultado_cep, arquivo)
		
		a.fechar_arquivo(arquivo)
		}
		senao{
		arquivo = a.abrir_arquivo("/banco_dados.txt", a.MODO_ESCRITA)
		a.escrever_linha(nome, arquivo)
		a.escrever_linha(numero_telefone, arquivo)
		a.escrever_linha(email, arquivo)
		a.escrever_linha(resultado_cep, arquivo)
		
		a.fechar_arquivo(arquivo)

		}
		repetidor()

	}
	funcao cadeia captura_de_dados_pessoais(inteiro cep)
	{
		cadeia resultado,endereco_real
		inteiro numero = 0,posicao_txt
		resultado = WS.obter_dados("https://viacep.com.br/ws/"+ cep +"/json/")
		posicao_txt = TXT.posicao_texto("ibge", resultado, 0)
		endereco_real = TXT.extrair_subtexto(resultado, 0 ,posicao_txt)
		retorne endereco_real
	}
	funcao simulador_final()
	{
		real vale_transporte = 0.0 ,desconto_inss,imposto_irrf,calculo_irrf,valor_adicional_noturno,desconto_fgts, valor_para_calcular_desconto_fgts,adicionais,descontos
		real salario ,hora_ex , noturno = 0.0,resposta_pericul, fgts,horas_em_periculosidade,valor_da_passagem = 0.0,quantidade_de_passagem_gasta_no_dia = 0.0
		cadeia  vale_trans
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n        -=-=-=- CONTRACHEQUE -=-=-=-=\n")
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n")
		escreva("\n")
		escreva("INFORME SEU SALÁRIO BRUTO: → ")
		leia(salario)
		escreva("QUANTAS HORAS EXTRAS FEZ ESSE MÊS : → ")
		leia(hora_ex)
		hora_ex = calculo_hora_extra(salario, hora_ex)
		escreva("QUANTAS HORAS NOTURNAS FEZ ESSE MÊS: → ")
		leia(noturno)
		valor_adicional_noturno = calculo_adicional_noturno(salario, noturno )
		escreva("QUANTAS HORAS VOCÊ FEZ EM PERICULOSIDADE ESSE MÊS: →")
		leia(horas_em_periculosidade)
		horas_em_periculosidade = calculo_periculosidade(salario, horas_em_periculosidade)
		escreva("VOCÊ RECEBE VALE-TRANSPORTE? : [S]/[N] → ")
		leia(vale_trans)
		vale_trans = TXT.caixa_alta(vale_trans)
		se(vale_trans == "S"){
			vale_transporte = calculo_vale_transporte(salario)
		}
		
		desconto_inss = calcula_inss(salario)
		calculo_irrf = salario + hora_ex + valor_adicional_noturno
		imposto_irrf = calcula_imposto_de_renda(calculo_irrf)
		desconto_fgts = calculo_desconto_mensal_fgts(salario)
		adicionais = hora_ex + valor_adicional_noturno + horas_em_periculosidade
		descontos = vale_transporte + desconto_inss + imposto_irrf + desconto_fgts
		
		
		limpa()
		escreva("=-=-=-=-=-=-=-=--DETALHAMENTO=-=-=-=-=-=-=-=-=-=- \n")
		escreva("\n")
		salario = MAT.arredondar(salario, 2)
		escreva("SALÁRIO BASE: R$",salario,"\n")
		escreva("\n")
		hora_ex = MAT.arredondar(hora_ex, 2)
	     escreva("HORAS EXTRAS: + R$", hora_ex ,"\n")
	     escreva("\n")
	     valor_adicional_noturno = MAT.arredondar(valor_adicional_noturno, 2)
          escreva("ADICIONAL NOTURNO: + R$",valor_adicional_noturno,"\n")
          escreva("\n")
          
          horas_em_periculosidade = MAT.arredondar(horas_em_periculosidade, 2)
          escreva("ADICIONAL PERICULOSIDADE : + R$",horas_em_periculosidade,"\n")
          escreva("\n")
          vale_transporte = MAT.arredondar(vale_transporte, 2)
          escreva("VALE-TRANSPORTE: R$ - ",vale_transporte,"\n")
          escreva("\n")
          desconto_inss = MAT.arredondar(desconto_inss, 2)
          escreva("DESCONTO INSS : - R$",desconto_inss,"\n")
          escreva("\n")
          imposto_irrf = MAT.arredondar(imposto_irrf, 2)
          escreva("DESCONTO IRRF: - R$",imposto_irrf,"\n")
          escreva("\n")
          desconto_fgts = MAT.arredondar(desconto_fgts, 2)
          escreva("DESCONTO FGTS: - R$",desconto_fgts,"\n")
          escreva("\n")
          escreva("=-=-=-=-=-=-=-=--=-=RESULTADO-=-=-=-=-=-=-=-=-=-=- \n")
          escreva("\n")
          adicionais = MAT.arredondar(adicionais, 2)
          escreva("TOTAL ADICIONAIS + : R$",adicionais,"\n")
          escreva("\n")
          descontos = MAT.arredondar(descontos, 2)
          escreva("TOTAL DESCONTOS - : R$",descontos,"\n")
          escreva("\n")
          escreva("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
          escreva("\n")
          escreva("SALÁRIO LIQUIDO: R$",(salario + adicionais) - descontos)
          escreva("\n")

          repetidor()
           
	}
	funcao simulador_fgtss()
	{
		
		real salario, valor_total = 0.0, todos_adicionais_para_calcular_fgts, desconto_fgts
		cadeia pericul, adicional_n, hora_ex
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n     -=-=-=- CALCULO MENSAL FGTS -=-=-=-=\n")
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n")
		escreva("\n")
		escreva("INFORME SEU SALÁRIO: → R$")
		leia(salario)
          escreva("\n")
		desconto_fgts = calculo_desconto_mensal_fgts(salario)
		escreva("\n")
		linha()
		escreva("SEU FGTS DEPOSITADO MENSALMENTE E DE: R$",desconto_fgts)
	repetidor()
	}
     funcao real calculo_desconto_mensal_fgts(real salario)
     {
       real valor_total = 0.0
		valor_total = (salario / 100) * 8
		retorne valor_total
		
		
     }
	funcao simulador_adicional_noturno()
	{
		const real HORAS_DE_TRABALHO = 220.00
		real salario, salario_com_adicional, hora_noturnas_feitas_no_mes, valor_do_adicional_noturno
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n     -=-=-=- ADICIONAL NOTURNO -=-=-=-=\n")
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n")
		escreva("\n")
		

		escreva("INFORME O SEU SALÁRIO → R$")
		leia(salario)
		escreva("\n")
		escreva("INFORME QUANTAS HORAS NOTURNAS VOCÊ FEZ ESSE MÊS : ")
		leia(hora_noturnas_feitas_no_mes)
		escreva("\n")
		valor_do_adicional_noturno = calculo_adicional_noturno(salario,hora_noturnas_feitas_no_mes)
		MAT.arredondar(valor_do_adicional_noturno, 2)
		valor_do_adicional_noturno = MAT.arredondar(valor_do_adicional_noturno, 2)
		escreva("\n")
		linha()
		escreva("O VALOR DO ADICIONAL SERÁ DE: R$",valor_do_adicional_noturno)
		repetidor()
		
	}	
	funcao simulador_vale_transporte()
	{
		real salario, desconto_vale_transporte, gasto_do_vale_transporte, valor_da_passagem, quantidade_de_passagem_gasta_no_dia, valor_vale_transporte
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n     -=-=-=- VALE TRANSPORTE -=-=-=-=\n")
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n")
		escreva("\n")
		escreva("INFORME O SEU SALÁRIO → R$ ")
		leia(salario)
		escreva("\n")
		escreva("QUAL O VALOR DA PASSAGEM → R$ ")
		leia(valor_da_passagem)
		escreva("\n")
		escreva("QUANTAS PASSAGENS VOCÊ GASTA NO DIA? ")
		leia(quantidade_de_passagem_gasta_no_dia)
		escreva("\n")
		desconto_vale_transporte =  calculo_vale_transporte(salario)
		gasto_do_vale_transporte = (valor_da_passagem * quantidade_de_passagem_gasta_no_dia) * 20 
		se(desconto_vale_transporte > gasto_do_vale_transporte){
			linha()
			escreva("O VALOR DO DESCONTO SERÁ DE : R$",desconto_vale_transporte,"\n")
			escreva("\n")
			escreva("NÃO VALE A PENA VOCÊ UTILIZAR O BENEFICIO\n")
		}
		senao{
			linha()
			escreva("O VALOR DO DESCONTO SERÁ DE : R$",desconto_vale_transporte,"\n")
			escreva("\n")
			escreva("\nVALE A PENA UTILIZAR O BENEFÍCIO\n")
		}
		
		repetidor()
	}
	funcao simulador_periculosidade()
	{
		cadeia funcao_de_trabalho
		real salario,adicional_periculosidade = 0.0 ,adicional_de_hora_extra, adicional_horas_noturnas = 0.0,horas_noturnas
		real horas_extras_feitas,horas_periculosidade, salario_com_adicionais
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n     -=-=-=- ADICIONAL PERICULOSIDADE -=-=-=-=\n")
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n")
		escreva("\n")
		escreva("INFORME O SEU SALÁRIO → R$")
		leia(salario)
		escreva("\n")
		escreva ("QUAL A SUA FUNÇÃO DE TRABALHO:")
		escreva("\n")
		escreva("\n[E] → ELETRICITÁRIO: |QUEM TRABALHA COM ENERGIA ELETRICA!\n")
		escreva("[O] → OUTROS:  |NÃO TRABALHA COM ENERGIA ELETRICA!\n")
		escreva("\n")
		escreva("SELECIONE A OPÇÃO DESEJADA : ")
		leia (funcao_de_trabalho)
		escreva("\n")
		funcao_de_trabalho = TXT.caixa_alta(funcao_de_trabalho)
		
		se (funcao_de_trabalho == "E"){
			escreva("INFORME QUANTAS HORAS EXTRAS VOCÊ FEZ ESSE MÊS: ")
			leia(horas_extras_feitas)
			escreva("\n")
			adicional_de_hora_extra = calculo_hora_extra(salario, horas_extras_feitas)
			escreva("INFORME QUANTAS HORAS NOTURNAS FEZ ESSE MÊS ")
			leia(horas_noturnas)
			escreva("\n")
			adicional_horas_noturnas = calculo_adicional_noturno(salario, horas_noturnas)
			adicional_horas_noturnas = adicional_horas_noturnas - salario
			escreva("INFORME QUANTAS HORAS VOCÊ FEZ EM PERICULOSIDADE:: ")
			leia(horas_periculosidade)
			escreva("\n")
			salario_com_adicionais = adicional_horas_noturnas + adicional_de_hora_extra + salario
			adicional_periculosidade = calculo_periculosidade(salario_com_adicionais,horas_periculosidade)
			linha()
			adicional_periculosidade = MAT.arredondar(adicional_periculosidade, 2)
			escreva("O VALOR SERÁ DE : R$", adicional_periculosidade)
			escreva("\n")
		}
		senao{
			
			escreva("INFORME QUANTAS HORAS VOCÊ FEZ EM PERICULOSIDADE: ")
			leia(horas_periculosidade)
			escreva("\n")
			adicional_periculosidade = calculo_periculosidade(salario,horas_periculosidade)
			adicional_periculosidade = MAT.arredondar(adicional_periculosidade, 2)
			linha()
			escreva ("O VALOR DO SEU ADICIONAL SERÁ DE : R$",adicional_periculosidade)
			
		}
		
		repetidor()
	}
	funcao simulador_ferias()
	{
	real salario,venda_ferias,valor_ferias_bruto, salario_com_desconto_inss, valor_ferias_com_salario, desconto_inss
	real desconto_irrf, desconto_irrf_com_salario

	escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
	escreva("\n     -=-=-=- CALCULO FERIAS -=-=-=-=\n")
	escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
	escreva("\n")
	escreva("\n")
	escreva("INFORME O SEU SALÁRIO → R$")
	leia(salario)
	escreva("QUANTOS DIAS VOCÊ VAI VENDER DE FÉRIAS? (LIMITE MÁXIMO DE 10 DIAS): ")
	leia(venda_ferias)
	
	valor_ferias_bruto = calculo_ferias(salario, venda_ferias)
	
	valor_ferias_com_salario = valor_ferias_bruto + salario
	
	desconto_inss = calcula_inss(valor_ferias_com_salario)
	
	salario_com_desconto_inss = valor_ferias_com_salario - desconto_inss
	
	desconto_irrf = calcula_imposto_de_renda(salario_com_desconto_inss)

	salario = (valor_ferias_com_salario - desconto_inss) - desconto_irrf
	
	valor_ferias_com_salario = MAT.arredondar(valor_ferias_com_salario, 2)
	salario = MAT.arredondar(salario, 2)
	
	linha()
	escreva("VOCÊ VAI RECEBER: R$", salario)
	repetidor()
}
	funcao simulador_hora_extra()
	{
		real salario, horas_feitas,total_a_receber
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n     -=-=-=- ADICIONAL DE HORAS EXTRAS -=-=-=-=\n")
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n")
		escreva("\n")
		escreva("INFORME O SEU SALÁRIO → R$")
		leia(salario)
		escreva("\n")
		escreva("INFORME QUANTAS HORAS EXTRAS VOCÊ FEZ ESSE MÊS: ")
		leia(horas_feitas)
		escreva("\n")
		total_a_receber = calculo_hora_extra(salario, horas_feitas)
		total_a_receber = MAT.arredondar(total_a_receber, 2)
		linha()
		escreva ("O VALOR DO ADICIONAL SERÁ DE: R$", total_a_receber )
		repetidor()
	}
	funcao simulador_pis()
	
	{
		
	real salario, meses_trabalhando, resultado, anos_de_carteira,media_salario, valor_para_receber
	    escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n             -=-=-=- PIS -=-=-=-= \n")
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n")
		escreva("\n")
		escreva("INFORME O SEU SALÁRIO → R$")
		leia(salario)
		escreva("\n")
		escreva("QUANTOS ANOS VOCÊ TEM DE CARTEIRA ASSINADA? : ")
		leia(anos_de_carteira)
		escreva("\n")
		escreva("QUANTOS MESES VOCÊ ESTÁ TRABALHANDO DE CARTEIRA ASSINADA NO ANO ATUAL ? : ")
		leia(meses_trabalhando)
		escreva("\n")
		calculo_pis(salario,meses_trabalhando,anos_de_carteira)
		repetidor()
	}
	funcao simulador_multa_fgts()
	{
		real valor_total_em_conta, multa_fgts
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n         -=-=-=- MULTA FGTS -=-=-=-=\n")
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n")
		escreva("\n")
		escreva("INFORME O VALOR TOTAL EM CONTA DO FGTS → R$")
		leia(valor_total_em_conta)
		multa_fgts = calculo_fgts(valor_total_em_conta)
		multa_fgts = MAT.arredondar(multa_fgts, 2)
		linha()
		escreva("O VALOR DA MULTA É DE: R$",multa_fgts)
		repetidor()
	}
	funcao simulador_seguro_desemprego()
	{
		inteiro meses_trabalhados, vezes_solicitado, resultado
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n     -=-=-=- SEGURO DESEMPREGO -=-=-=-=\n")
		escreva("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= \n")
		escreva("\n")
		escreva("\n")
		escreva(" \n INFORME QUANTAS VEZES JÁ SOLICITOU O BENEFICIO?: ")
		leia(vezes_solicitado)
		escreva(" \n FAVOR INFORMAR MESES DE CARTEIRA ASSINADA NO EMPREGO ATUAL: ")
		leia(meses_trabalhados)
		calculo_seguro_desemprego(meses_trabalhados,vezes_solicitado)
		repetidor()
	}

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 24780; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 24776; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */