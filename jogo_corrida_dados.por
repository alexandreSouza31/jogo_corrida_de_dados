  programa
  {
    inclua biblioteca Util
    inclua biblioteca Texto
    inclua biblioteca Tipos
    funcao inicio()
    {
        cadeia nomePrograma ="jogo Corrida de Dados", versaoPrograma="3.0",rolarDado=""
        inteiro tamanhoPista=30
        inteiro posicaoJogador=0
        inteiro posicaoComputador=0
	   logico avancoRecuo=falso
	   
        exibirCabecalho(nomePrograma, versaoPrograma)
      
        para(inteiro i=1;i<=tamanhoPista;i++){
        
          escreva("\n \n Rodada "+ i+"\n")
          
          inteiro numeroSorteadoJogador=Util.sorteia(1,6)
          posicaoJogador+=numeroSorteadoJogador
          inteiro pontosTotaisJogador=posicaoJogador
          
          inteiro numeroSorteadoComputador=Util.sorteia(1,6)
          posicaoComputador+=numeroSorteadoComputador
          inteiro pontosTotaisComputador=posicaoComputador
    
          IniciarRodadaJogador(rolarDado, numeroSorteadoJogador)

          escreva("\n"+"...rolando dado do computador...")
          escreva("Dado do Computador saiu: "+numeroSorteadoComputador+"\t")
            
      	escreva("\n \n")

      //■ Rodada extra: Se o competidor tirar 6 no dado, ele ganha uma rodada extra
      	inteiro rodadaExtra=tirouSeis(posicaoJogador,posicaoComputador, numeroSorteadoJogador, pontosTotaisJogador, pontosTotaisComputador, numeroSorteadoComputador)
         
     	se(numeroSorteadoJogador==6 e numeroSorteadoComputador==6){
      	escreva("\n \t \t Posição Jogador: "+pontosTotaisJogador+"\n"+"\t \t Posição Computador: "+pontosTotaisComputador+"\n \n")
     	  escreva("Os 2 tiraram 6! Vão rolar novamente o dado! \t")
        inteiro rodadaExtraJogador=Util.sorteia(1,6)

      	IniciarRodadaJogador(rolarDado,rodadaExtraJogador)
        avancoRecuo=falso
        posicaoJogador+=rodadaExtraJogador
        pontosTotaisJogador=posicaoJogador
      	escreva("Pontos do jogador: "+pontosTotaisJogador,"\n")

      	escreva("O computador vai rolar novamente o dado! \t")
          inteiro rodadaExtraComputador=Util.sorteia(1,6)
          posicaoComputador+=rodadaExtraComputador
         	pontosTotaisComputador=posicaoComputador
      	escreva("Dado rolado novamente do Computador saiu: "+rodadaExtraComputador+"\t \t \n")
      	escreva("Pontos do Computador: "+pontosTotaisComputador,"\n")

     	}senao se(numeroSorteadoComputador==6){
     		avancoRecuo=falso
         	posicaoComputador+=rodadaExtra
         	pontosTotaisComputador=posicaoComputador
     		
     	}senao se(numeroSorteadoJogador==6){
     		avancoRecuo=falso
          posicaoJogador+=rodadaExtra
          pontosTotaisJogador=posicaoJogador
     	}senao{
        rodadaExtra=0
      }

      //■ Avanço extra: Se o competidor parar em uma posição especíca (ex.: 5, 10, 15), ele avança +3 casas.
      //■ Recuo: Se o competidor parar em outra posição especíca (ex.: 7, 13, 20), ele recua -2 casas.
    inteiro avancos[] = {5, 10, 15}
		inteiro recuos[] = {7, 13, 20}

        //incremento usuário
		se (contemAvancoOuRecuo(avancos, pontosTotaisJogador)){
		    inteiro pontoAvanco = 4
		    pontosTotaisJogador += pontoAvanco
		    posicaoJogador += pontoAvanco
		    escreva("Casa "+avancos+" !Avanço extra para você! Avance 4 casas! Irá para casa " + pontosTotaisJogador + "\n.")
		}
        //decremento usuário
		se (contemAvancoOuRecuo(recuos, pontosTotaisJogador)){
		    inteiro pontoRecuo = 2
		    pontosTotaisJogador -= pontoRecuo
		    posicaoJogador -= pontoRecuo
		    escreva("Casa "+recuos+" ! Recue 2 casas! Irá para casa " + pontosTotaisJogador + "\n.")
		}
        //incremento computador
		se (contemAvancoOuRecuo(avancos, pontosTotaisComputador)){
		    inteiro pontoAvanco = 4
		    pontosTotaisComputador += pontoAvanco
		    posicaoComputador += pontoAvanco
		    escreva("Casa "+avancos+" !Avanço extra para o computador! Avançará 4 casas! Irá para casa " + pontosTotaisComputador + "\n.")
		}
        //decremento computador
    se (contemAvancoOuRecuo(recuos, pontosTotaisComputador)){
		    inteiro pontoRecuo = 2
		    pontosTotaisComputador -= pontoRecuo
		    posicaoComputador -= pontoRecuo
		    escreva("Casa "+recuos+" ! Recuo para o computador! Recuará 2 casas! Irá para casa " + pontosTotaisComputador + "\n.")
		}
      
        //tipo e hierarquia de mensagem de pontos exibida
          se(pontosTotaisJogador<pontosTotaisComputador e pontosTotaisComputador <= tamanhoPista){
            escreva("--------------------------------------------------------------","\n")
            escreva("\t Computador está a "+(pontosTotaisComputador-pontosTotaisJogador)+" casa(s) à frente! \n")
            escreva("\n \t \t Posição Computador: "+pontosTotaisComputador+"\n"+"\t \t Posição Jogador: "+pontosTotaisJogador+"\n \n")
            escreva("---------------------------------------------------------------")
          }senao se(pontosTotaisJogador>pontosTotaisComputador e pontosTotaisJogador <= tamanhoPista){
		  escreva("--------------------------------------------------------------","\n")
            escreva("\t você está a "+(pontosTotaisJogador-pontosTotaisComputador)+" casa(s) à frente! \n")
            escreva("\n \t \t Posição Jogador: "+pontosTotaisJogador+"\n"+"\t \t Posição Computador: "+pontosTotaisComputador+"\n \n")
            escreva("---------------------------------------------------------------")
            
          }senao se(pontosTotaisJogador==pontosTotaisComputador e pontosTotaisComputador <= tamanhoPista){
            escreva("--------------------------------------------------------------","\n")
            escreva("\t você está empatado com Computador na casa "+(pontosTotaisJogador)+"! \n")
            escreva("\n \t \t Posição Jogador: "+pontosTotaisJogador+"\t \t "+"Posição Computador: "+pontosTotaisComputador+"\n \n")
            escreva("---------------------------------------------------------------")
          }
          //tipo de mensagem de vencedor
          se(pontosTotaisJogador >= tamanhoPista e pontosTotaisJogador>pontosTotaisComputador e pontosTotaisJogador>=tamanhoPista){
            escreva("--------------------------------------------------------------","\n")
            escreva("\n VOCÊ venceu! Placar final:")
        	  escreva("\t Posição Jogador: "+pontosTotaisJogador+"\n"+"\t Posição Computador: "+pontosTotaisComputador+"\n \n")
        	  escreva("---------------------------------------------------------------")
            retorne
          }senao se(pontosTotaisComputador >= tamanhoPista ou pontosTotaisJogador<pontosTotaisComputador e pontosTotaisComputador>=tamanhoPista){
            escreva("--------------------------------------------------------------","\n")
            escreva("\n COMPUTADOR venceu! Placar final:")
            escreva("\n \t Posição Computador: "+pontosTotaisComputador+"\n"+"\t Posição Jogador: "+pontosTotaisJogador+"\n \n")
            escreva("---------------------------------------------------------------")
            retorne
          }
        }
    }

    funcao exibirCabecalho(cadeia nomeApp,cadeia versaoApp){
      limpa()
      escreva(nomeApp+" "+versaoApp+"\n \n")
    }

    funcao IniciarRodadaJogador(cadeia rolarDado, inteiro numeroSorteadoJogador){
    	 escreva("Quando estiver pronto digite [Enter] para rolar o dado: \n")
      leia(rolarDado)
      escreva("...rolando dado do jogador... \t")
	 escreva("Dado do Jogador saiu: "+numeroSorteadoJogador+"\t \t")
    }

    funcao inteiro tirouSeis(inteiro posicaoJogador,inteiro posicaoComputador,inteiro numeroSorteadoJogador,inteiro pontosTotaisJogador, inteiro pontosTotaisComputador, inteiro numeroSorteadoComputador){
    		inteiro rodadaExtra=0
        cadeia rolarDado=""

        se(numeroSorteadoComputador==6 e numeroSorteadoJogador!=6){
          escreva("\n \t \t Posição Jogador: "+pontosTotaisJogador+"\n"+"\t \t Posição Computador: "+pontosTotaisComputador+"\n \n")
            rodadaExtra=Util.sorteia(1,6)
            
          escreva("O computador vai rolar novamente o dado! \t")
          escreva("Dado rolado novamente do Computador saiu: "+rodadaExtra+"\t \t \n")
          pontosTotaisComputador=rodadaExtra+posicaoComputador
            
          escreva("Pontos do Computador: "+pontosTotaisComputador,"\n")
          numeroSorteadoComputador=pontosTotaisComputador
      		
       }senao se(numeroSorteadoJogador==6 e numeroSorteadoComputador!=6){
      	escreva("\n \t \t Posição Jogador: "+pontosTotaisJogador+"\n"+"\t \t Posição Computador: "+pontosTotaisComputador+"\n \n")
          rodadaExtra=Util.sorteia(1,6)
     
      	escreva("Role novamente o dado! \t")
          IniciarRodadaJogador(rolarDado,rodadaExtra)
      	pontosTotaisJogador=rodadaExtra+posicaoJogador
      		
      	escreva("Pontos do jogador: "+pontosTotaisJogador,"\n")
      	numeroSorteadoComputador=pontosTotaisComputador
      		
      }
    		retorne rodadaExtra
    }

	funcao logico contemAvancoOuRecuo(inteiro listaAvancoOuRecuo[], inteiro pontos){
	    para (inteiro i = 0; i < Util.numero_elementos(listaAvancoOuRecuo); i++){
	        se (listaAvancoOuRecuo[i] == pontos){
	            retorne verdadeiro
	        }
	    }
	    retorne falso
	}
    
}
