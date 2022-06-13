

import 'dart:ffi';
import 'dart:html';
import 'dart:io';

void main(List<String> aguments){
  int? opcao;

  print('''Escolha uma opção
1 - calculo de valor de salario bruto
2 - calculo de salario com desconto INSS
3 - calculo de desconto de vales
4 - calculo de salario liquido
''');
String? resposta;

do{
  print('Aresposta não pode ser nula');
  resposta = stdin.readLineSync();
}while(resposta == null);
  opcao = int.parse(resposta);

  if(opcao <1 || opcao > 4){
    print('Essa opção não está disponivel');
  }
  else if(opcao == 1){
    double? horas;
    double? valorHora;
    calculaValorSalario(horas!, valorHora!);
  }else if(opcao == 2){
    double? valorSalarioBruto;
    descontoSalarioInss(valorSalarioBruto!);
  }else if(opcao == 3){

    double? valeAlimentacao;
    double? valerRefeicao;
    double? valeCultura;
    double? valeAcademia;
    double? valeCombustivel;
    double? valePresente;

    descontoVales(valeAlimentacao!, valerRefeicao!, valeCultura!, valeAcademia!, valeCombustivel!, valePresente!);
  }else if(opcao == 4){
    double? valorSalarioBruto;
    double? descontoInss;
    double? descontoVale;
    calculoSalarioLiquido(valorSalarioBruto!, descontoInss!, descontoVale!);
  }

}



double calculaValorSalario(double horas, double valorHora){
  double valorSarario = horas * valorHora;
  return valorSarario;
}

double descontoSalarioInss(double valorSalarioBruto){

  try{
    
    if(valorSalarioBruto <= 1212){
      double desconto = valorSalarioBruto * (7.5/100);

      double valorSalarioLiquido = valorSalarioBruto - desconto;

      return valorSalarioLiquido;

    }else if(valorSalarioBruto >= 1213 && valorSalarioBruto<=2427.35){

      double desconto = valorSalarioBruto * (9/100);

      double valorSalarioLiquido = valorSalarioBruto - desconto;

      return valorSalarioLiquido;

    }else if(valorSalarioBruto >= 2427.36 && valorSalarioBruto<=  3641.03){

      double desconto = valorSalarioBruto * (12/100);

      double valorSalarioLiquido = valorSalarioBruto - desconto;

      return valorSalarioLiquido;

    }else{

      double desconto = valorSalarioBruto * (14/100);

      double valorSalarioLiquido = valorSalarioBruto - desconto;

      return valorSalarioLiquido;
    }

  }catch(e){

    return 0;

  }

}


double descontoVales(double valeAlimentacao, double valerRefeicao,
double valeCultura, double valeAcademia, double valeCombustivel, double valePresente){

  double valorValeTotal = valeAlimentacao + valerRefeicao + valeCultura +
   valeAcademia + valeCombustivel + valePresente;

   return valorValeTotal;

}


double calculoSalarioLiquido(double valorSalarioBruto, double descontoSalarioInss, double descontoTickets)=> valorSalarioBruto + descontoSalarioInss + descontoTickets;