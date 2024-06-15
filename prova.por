programa {
  inclua biblioteca Util
  inclua biblioteca Matematica

   const inteiro total=25
   cadeia data[total],nome[total],equipamento[total],problema[total],enter,equipamento_consert[total],data_consert[total],nome_consert[total],problema_consert[total],busca
   inteiro quant,opcao,ponteiro=0,n=0,ponteiro_consert=0
   caracter sn
   real valor[total],porcentagem,porcentagem2,ap,apc,total2=0
   logico encontrado

  funcao inicio() {
    limpa()

    escreva("Quantos equipamentos deseja cadastrar?(MÁX:25)\t")
    leia(quant)
    limpa()
    se(quant>total){
      escreva("A quantidade ultrapassou o limite!Informe novamente.")
      Util.aguarde(2000)
      inicio()
    }
    senao se(quant<=0){
      escreva("Favor informar uma quantidade maior que 0!")
      Util.aguarde(2000)
      inicio()
    }
    senao{
    menu()
    }
    
  }

  funcao menu(){
    limpa()

    escreva("                     Menu de equipamentos da Geeks Tech\n\n")
    escreva("             Escolha uma das opções abaixo e escreva seu dígito:\n\n")
    escreva("1-Cadastrar novo equipamento","                           5-Buscar equipamento\n")
    escreva("2-Executar manutenção do próximo equipamento","           6-Exibir status da fila\n")
    escreva("3-Apresentar fila de equipamentos para atendimento","     7-Apresentar os equipamentos consertados\n")
    escreva("4-Consultar o próximo equipamento a ser atendido","       8-Buscar equipamentos consertados\n\n")
    escreva("                                      9-Sair do sistema                                \n")
    leia(opcao)
    limpa()
    escolha(opcao){

      caso 1:
       cadastro()
       pare

       caso 2:
       manutencao()
       pare

       caso 3:
       lista()
       pare

       caso 4:
       consultar()
       pare

       caso 5:
       busca()
       pare

       caso 6:
       status()
       pare

       caso 7:
       lista_consert()
       pare

       caso 8:
       busca_consert()
       pare

       caso 9:
       sair()
       pare

       caso contrario:
       escreva("informe um dígito válido!")
       Util.aguarde(2000)
       menu()
       pare
    }

  }
   funcao cadastro(){
    limpa()
    se(ponteiro>=quant){
      escreva("Quantidade limite atingida!")
      Util.aguarde(2000)
      menu()
    }
    senao{
    escreva("Qual a data de entrada?(Ex:15 de agosto de 1998)\n\n")
    leia(data[ponteiro])
    limpa()
    escreva("Qual o nome do proprietário?\n\n")
    leia(nome[ponteiro])
    limpa()
    escreva("Qual o equipamento?\n\n")
    leia(equipamento[ponteiro])
    limpa()
    escreva("Qual problema relatado?\n\n")
    leia(problema[ponteiro])
    limpa()
    escreva("Os dados abaixo estão corretos?(S/N)\n\n")
    escreva(nome[ponteiro],", data:",data[ponteiro],"\nEquipamento:",equipamento[ponteiro]," - ",problema[ponteiro],"\n\n")
    leia(sn)
    limpa()
    se(sn=="s" ou sn=="S"){
      escreva("Equipamento registrado!")
    ponteiro++
    total2++
    retornar()
    }
    se(sn=="n" ou sn=="N"){
      escreva("Equipamento não registrado!")
      retornar()
    }
    senao{
      escreva("Resposta inválida!Equipamento não registrado.")
      retornar()
    }
    
    }
   }

   funcao manutencao(){
    limpa()
    se(ponteiro==0){
      escreva("Ainda não foi adicionado nenhum equipamento!")
      retornar()
    }

    senao{
    escreva("Equipamento:",equipamento[0]," foi consertado")
    nome_consert[ponteiro_consert]=nome[0]
    problema_consert[ponteiro_consert]=problema[0]
    equipamento_consert[ponteiro_consert]=equipamento[0]
    data_consert[ponteiro_consert]=data[0]
    limpa()
    escreva("Qual foi o valor cobrado pelo reparo?\n")
    leia(valor[ponteiro_consert])
    ponteiro_consert++
    para(n=0;n<ponteiro-1;n++){

      nome[n]=nome[n+1]
      data[n]=data[n+1]
      equipamento[n]=equipamento[n+1]
      problema[n]=problema[n+1]
      
    }
    ponteiro--
    retornar()
    }
   }

   funcao lista(){
    limpa()
    se(ponteiro==0){
      escreva("Ainda não foi adicionado nenhum equipamento!")
      retornar()
      }
      senao{
    escreva("Esta é a lista dos equipamentos que ainda serão consertados:\n\n")
    para(n=0;n<ponteiro;n++)
    escreva(nome[n],",data: ",data[n],"\nEquipamento:",equipamento[n]," - ",problema[n],"\n\n")
    retornar()
      }
   }

   funcao retornar(){
    escreva("\n\npressione a tecla [ENTER] para retornar ao menu.")
    leia(enter)
    menu()
   }

   funcao consultar(){
    limpa()
    se(ponteiro==0){
      escreva("Ainda não foi adicionado nenhum equipamento!")
      retornar()
    }
    senao{
    escreva("Esse é o próximo item a ser consertado:\n\n")
    escreva(nome[0],",data:",data[0],"\nequipamento:",equipamento[0]," - ",problema[0],"\n")
    retornar()
    }
   }

   funcao busca(){
    limpa()
    encontrado==falso
    se(ponteiro==0){
      escreva("Ainda não foi adicionado nenhum equipamento!")
      retornar()
    }
    senao{
    escreva("Qual equipamento deseja procurar?")
    leia(busca)
    limpa()
    para(n=0;n<ponteiro;n++){
      se(equipamento[n]==busca){
        escreva("Aqui está o equipamento:\n")
        escreva(nome[n],",data: ",data[n],"\nEquipamento:",equipamento[n]," - ",problema[n],"\n")
        encontrado==verdadeiro
        retornar()
      }
        }
        se(encontrado==falso){
          escreva("Esse equipamento não foi cadastrado!")
        retornar()

        }
    }
   }
   funcao status(){
    limpa()
    porcentagem=(ponteiro/total2)*100
    porcentagem2=(ponteiro_consert/total2)*100
    ap=Matematica.arredondar(porcentagem,2)
    apc=Matematica.arredondar(porcentagem2,2)
    escreva("Esse é o total de equipamentos aguardando manutenção:\t",ponteiro," - ",ap,"%")      
    escreva("\nEsse é o total de equipamentos reparados:\t",ponteiro_consert," - ",apc,"%")
     
    retornar()
   }

   funcao lista_consert(){
    limpa()
    se(ponteiro_consert==0){
      escreva("Ainda não foi consertado nenhum equipamento!")
      retornar()
    }
    senao{
    escreva("Esse é o total de manutenções feitas: ",ponteiro_consert,"\n\n")
    escreva("Essa é a lista de equipamentos consertados:\n\n")
    para(n=0;n<ponteiro_consert;n++){
      escreva(nome_consert[n],",data: ",data_consert[n],"\nEquipamento:",equipamento_consert[n]," - ",problema_consert[n],"\n\n")
    }
    retornar()
    }
   }

   funcao busca_consert(){
     limpa()
     encontrado==falso
     se(ponteiro_consert==0){
      escreva("Ainda não foi adicionado nenhum equipamento!")
      retornar()
     }
     senao{
    escreva("Qual equipamento deseja procurar?\n")
    leia(busca)
    limpa()
    para(n=0;n<ponteiro_consert;n++)
      se(equipamento_consert[n]==busca){
        escreva("Aqui está o equipamento:\n\n")
        escreva(nome_consert[n],",data: ",data_consert[n],"\nEquipamento:",equipamento_consert[n]," - ",problema_consert[n],"\nValor do conserto:",valor[n],"\n\n")
        encontrado==verdadeiro
        retornar()
      }
      se(encontrado==falso){
        escreva("Esse equipamento não foi cadastrado!")
        retornar()
      }
      }

   }

   funcao sair(){
    escreva("Deseja realmente sair do sistema?(S/N)\n")
    leia(sn)
    limpa()
    se(sn=="s" ou sn=="S"){
      inicio()
    }
    senao{
      menu()
    }

   }
}
