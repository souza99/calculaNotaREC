

import 'dart:ffi';
import 'dart:html';

void main(List<String> aguments){

  print('''Escolha uma opção
1 - calculo de valor de salario bruto
2 - calculo de desconto INSS
3 - calculo de desconto ticket alimentação
4 - calculo de salario liquido
''');
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