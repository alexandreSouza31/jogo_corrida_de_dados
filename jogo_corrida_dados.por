programa
{
	inclua biblioteca Util

	funcao inicio()
	{
    cadeia nomePrograma ="jogo Corrida de Dados", versaoPrograma="1.0"
	// objetivo: O jogador e o computador competem em uma corrida virtual. Cada um rola um dado virtual (geração de
	// números aleatórios) para avançar em uma pista. O primeiro a alcançar ou ultrapassar a linha de chegada
	// vence.
    exibirCabecalho(nomePrograma,versaoPrograma)

  //   1. Pista:
  // ○ A pista é representada por uma linha numérica (ex.: de 0 a 30).
    cadeia tamanhoPista[30]
    
  // ○ O jogador e o computador começam na posição 0.
    inteiro posicaoJogador=0
    inteiro posicaoComputador=0

  //   2. Turnos:
  // ○ O jogador e o computador alternam turnos para rolar um dado (gerar um número aleatório
  // entre 1 e 6).
  
    cadeia rolarDado=""

    para(inteiro i=1;i<=30;i++){
    	
    	// ○ O número gerado é somado à posição atual do competidor.
    	inteiro numeroSorteadoJogador=Util.sorteia(1,6)
    	
    	posicaoJogador+=numeroSorteadoJogador
    	escreva("Rodada "+ i+"\n")
    	escreva("Quando estiver pronto digite [Enter] para rolar o dado: \n")

    	leia(rolarDado)
 	
    	escreva("...rolando dado do jogador... \t")
    	escreva("Dado do Jogador saiu: "+numeroSorteadoJogador+"\t \t")
  
    	escreva("\n"+"...rolando dado do computador...")
    	inteiro numeroSorteadoComputador=Util.sorteia(1,6)
    	escreva("Dado do Computador saiu: "+numeroSorteadoComputador+"\t")
    	posicaoComputador+=numeroSorteadoComputador
	      
	escreva("\n \n")
	se(posicaoJogador>posicaoComputador e posicaoJogador <= 30){
		escreva("Jogador está "+(posicaoJogador-posicaoComputador)+" casa(s) à frente! \n")
      // ○ O jogo exibe a posição atual do jogador e do computador após cada rodada.
		escreva("\t Posição Jogador: "+posicaoJogador+"\n"+"\t Posição Computador: "+posicaoComputador+"\n \n")
		
	}senao se(posicaoJogador<posicaoComputador e posicaoComputador <= 30){
		escreva("Computador está "+(posicaoComputador-posicaoJogador)+" casa(s) à frente! \n")
		escreva("\n \t Posição Computador: "+posicaoComputador+"\n"+"\t Posição Jogador: "+posicaoJogador+"\n \n")
	}senao se(posicaoJogador==posicaoComputador e posicaoJogador <= 30){
		escreva("Jogador está empatado com Computador na casa "+(posicaoJogador)+"! \n")
      // ○ O jogo exibe a posição atual do jogador e do computador após cada rodada.
		escreva("\t Posição Jogador: "+posicaoJogador+"\t"+"Posição Computador: "+posicaoComputador+"\n \n")
	}
    	se(posicaoJogador >= 30 e posicaoJogador>posicaoComputador e posicaoJogador>=30){
    		escreva("Jogador venceu!")
    		retorne
    	}senao se(posicaoComputador >= 30 ou posicaoJogador<posicaoComputador e posicaoComputador>=30){
    		escreva("Computador venceu!")
    		retorne
    	}
    }
	}

  funcao exibirCabecalho(cadeia nomeApp,cadeia versaoApp){
    limpa()
	  escreva(nomeApp+" "+versaoApp+"\n \n")
  }
}
