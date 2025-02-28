  programa
  {
    inclua biblioteca Util
    inclua biblioteca Texto
    inclua biblioteca Tipos
    funcao inicio()
    {
        cadeia nomePrograma ="jogo Corrida de Dados", versaoPrograma="2.0",rolarDado=""
        inteiro tamanhoPista=30
        inteiro posicaoJogador=0
        inteiro posicaoComputador=0
      
        para(inteiro i=1;i<=tamanhoPista;i++){
        
          escreva("\n \n Rodada "+ i+"\n")
          escreva("Quando estiver pronto digite [Enter] para rolar o dado: \n")
          leia(rolarDado)
    
          inteiro numeroSorteadoJogador=Util.sorteia(1,6)
          posicaoJogador+=numeroSorteadoJogador
          inteiro pontosTotaisJogador=posicaoJogador
          
          inteiro numeroSorteadoComputador=Util.sorteia(1,6)
          posicaoComputador+=numeroSorteadoComputador
          inteiro pontosTotaisComputador=posicaoComputador
    
          escreva("...rolando dado do jogador... \t")
          escreva("Dado do Jogador saiu: "+numeroSorteadoJogador+"\t \t")
    
          escreva("\n"+"...rolando dado do computador...")
          escreva("Dado do Computador saiu: "+numeroSorteadoComputador+"\t")
            
      	escreva("\n \n")
    
      //■ Avanço extra: Se o competidor parar em uma posição especíca (ex.: 5, 10, 15), ele avança +3 casas.
      //■ Recuo: Se o competidor parar em outra posição especíca (ex.: 7, 13, 20), ele recua -2 casas.
            //incremento usuário
        se(pontosTotaisJogador==5 ou pontosTotaisJogador==10 ou pontosTotaisJogador ==15){
            inteiro pontoAvanco=4
            pontosTotaisJogador+=pontoAvanco
            posicaoJogador+=pontoAvanco
            escreva("Avanço extra para você! Avance 4 casas! Irá para casa "+pontosTotaisJogador+"\n.")
            //descremento usuário
          } se(pontosTotaisJogador ==7 ou pontosTotaisJogador==13 ou pontosTotaisJogador==20){
            inteiro pontoRecuo=2
            pontosTotaisJogador-=pontoRecuo
            posicaoJogador-=pontoRecuo
            escreva("Recuo para você! Recue 2 casas! Irá para casa "+pontosTotaisJogador+"\n.")
            //icremento pc
          } se(pontosTotaisComputador ==5 ou pontosTotaisComputador==10 ou pontosTotaisComputador==15){
            inteiro pontoAvanco=4
            pontosTotaisComputador+=pontoAvanco
            posicaoComputador+=pontoAvanco
            escreva("Avanço extra para o Computador! Avançará 4 casas! Irá para casa "+pontosTotaisComputador+"\n.")
            //decremento pc
          } se(pontosTotaisComputador==7 ou pontosTotaisComputador==13 ou pontosTotaisComputador==20){
            inteiro pontoRecuo=2
            pontosTotaisComputador-=pontoRecuo
            posicaoComputador-=pontoRecuo
            escreva("Recuo para o Computador! Recuará 2 casas! Irá para casa "+pontosTotaisComputador+"\n.")
            //incremento ambos
          } se(pontosTotaisJogador==5 ou pontosTotaisJogador==10 ou pontosTotaisJogador ==15 e pontosTotaisJogador==pontosTotaisComputador){
            inteiro pontoAvanco=4
            pontosTotaisJogador+=pontoAvanco
            posicaoJogador+=pontoAvanco
            pontosTotaisComputador+=pontoAvanco
            posicaoComputador+=pontoAvanco
            escreva("Ambos avançam! Irá para casa "+pontosTotaisComputador+"\n.")
            //decremento ambos
          } se(pontosTotaisComputador==7 ou pontosTotaisComputador==13 ou pontosTotaisComputador==20 e pontosTotaisJogador==pontosTotaisComputador){
            inteiro pontoRecuo=2
             pontosTotaisJogador-=pontoRecuo
             posicaoJogador-=pontoRecuo
             pontosTotaisComputador-=pontoRecuo
             posicaoComputador-=pontoRecuo
             escreva("Ambos recuam! Irá para casa "+pontosTotaisJogador+"\n.")
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
          se(pontosTotaisJogador >= 30 e pontosTotaisJogador>pontosTotaisComputador e pontosTotaisJogador>=30){
            escreva("--------------------------------------------------------------","\n")
            escreva("\n VOCÊ venceu! Placar final:")
        	  escreva("\t Posição Jogador: "+pontosTotaisJogador+"\n"+"\t Posição Computador: "+pontosTotaisComputador+"\n \n")
        	  escreva("---------------------------------------------------------------")
            retorne
          }senao se(pontosTotaisComputador >= 30 ou pontosTotaisJogador<pontosTotaisComputador e pontosTotaisComputador>=30){
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
  }
