import 'dart:io';

void main(List<String> arguments) {
  int opcao;
  double nota1;
  double nota2;
  print('''
    Escolha uma das opções:
    1 - definição da nota pela média;
    2 - definição da nota pela maior nota;
    3 - definição da nota pela menor nota.
  ''');
  String? resposta;
  do {
    print('A entrada não pode ser nula');
    resposta = stdin.readLineSync();
  } while (resposta == null);
  opcao = int.parse(resposta);

  print('Informe a primeira nota:');
  resposta = null;
  do {
    print('A entrada não pode ser nula');
    resposta = stdin.readLineSync();
  } while (resposta == null);
  nota1 = double.parse(resposta);

  print('Informe a segunda nota:');
  resposta = null;
  do {
    print('A entrada não pode ser nula');
    resposta = stdin.readLineSync();
  } while (resposta == null);
  nota2 = double.parse(resposta);

  if (opcao == 1) verificarAprovacao(nota1, nota2, calcularMedia);

  if (opcao == 2) verificarAprovacao(nota1, nota2, calcularMaiorNota);

  if (opcao == 3) verificarAprovacao(nota1, nota2, calcularMenorNota);

  if (opcao == 4)
    verificarAprovacao(nota1, nota2, () {
      var media = ((nota1 * 2) + nota2) / 3;
      return media;
    });
}

String verificarAprovacao(double nota1, double nota2, Function definirMedia) {
  double media = definirMedia(nota1, nota2);
  if (media >= 6) {
    return 'aprovado';
  } else {
    return 'reprovado';
  }
}

double calcularMedia(double nota1, double nota2) {
  if (nota1 < 0 || nota2 < 0)
    throw Exception('A nota não pode ser negativa');
  else if (nota1 > 10 || nota2 > 10)
    throw Exception('A nota não pode ser maior que 10');
  var mediaNota = (nota1 + nota2) / 2;
  return mediaNota;
}

double calcularMaiorNota(double nota1, double nota2) {
  if (nota1 < 0 || nota2 < 0)
    throw Exception('A nota não pode ser negativa');
  else if (nota1 > 10 || nota2 > 10)
    throw Exception('A nota não pode ser maior que 10');
  var maiorNota = nota1;
  if (nota2 > nota1) {
    maiorNota = nota2;
  }
  return maiorNota;
}

double calcularMenorNota(double nota1, double nota2) {
  if (nota1 < 0 || nota2 < 0)
    throw Exception('A nota não pode ser negativa');
  else if (nota1 > 10 || nota2 > 10)
    throw Exception('A nota não pode ser maior que 10');
  var menorNota = nota1;
  if (nota2 < nota1) {
    menorNota = nota2;
  }
  return menorNota;
}

/*
Legibilidade → Os nomes estão claros e compreensíveis? 
Acoplamento → Esta função roda em qualquer plataforma?
Coesão, unidade lógica, modularização → Esta função tem qual objetivo? 
	Para realizar o objetivo, realiza quantas tarefas?
	Estas tarefas podem ser reaproveitadas? 
	Quais são as tarefas/funções?
	→ distância do código em relação ao começo da linha

Parameter Function → e se tiver outras formas de definir nota? 
Anonymous Function → funções sem nome; 
Arroy Function 
Tratamento de erros
*/	
