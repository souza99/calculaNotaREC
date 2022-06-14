import 'dart:io';

void main(List<String> aguments) {
  int? opcao;
  double? comprimentoDoPacote;
  double? larguraDoPacote;
  double? alturaDoPacote;
  double? precoDoProduto;
  double? valorDoDescontoProduto;

  print('''Escolha uma das opções:
  1 - calcular o valor total da compra
  2 - calcular o valor do frete
  3 - calcular o valor do produto com desconto
  4 - calcular o valor descontado do produto
  ''');
  String? respostaUsuario;
  do {
    print("A escolha não pode ser nula");
    respostaUsuario = stdin.readLineSync();
  } while (respostaUsuario == null);
  opcao = int.parse(respostaUsuario);

  if (opcao < 1 || opcao > 4)
    throw 'Opção invalida, escolha destre as informadas';

  if (opcao == 1) print("Qual o comprimento do pacote ?");
  String? RespostaComprimentoDoPacote = stdin.readLineSync();
  comprimentoDoPacote = double.parse(RespostaComprimentoDoPacote!);

  print("Qual a largura do pacote ?");
  String? RespostaLarguraDoPacote = stdin.readLineSync();
  comprimentoDoPacote = double.parse(RespostaLarguraDoPacote!);


  print("Qual a altura do pacote ?");
  String? RespostaAlturaDoPacote = stdin.readLineSync();
  alturaDoPacote = double.parse(RespostaAlturaDoPacote!);
}





calculaValorTotalDaCompra(
    double comprimentoDoPacote,
    double larguraDoPacote,
    double alturaDoPacote,
    double precoDoProduto,
    double valorDoDescontoProduto) {
  double valorFrete =
      calculaFrete(comprimentoDoPacote, larguraDoPacote, alturaDoPacote);

  double valorProdutoComDesconto =
      calculaValorProdutoComDesconto(precoDoProduto, valorDoDescontoProduto);

  double valorTotalCompra = valorFrete + valorProdutoComDesconto;
}







double calculaFrete(
    double comprimentoDoPacote, double larguraDoPacote, double alturaDoPacote) {
  if (comprimentoDoPacote <= 0 || larguraDoPacote <= 0 || alturaDoPacote <= 0)
    throw '''Impossivel de realizar o calculo do frete, valide as informações inseridas''';

  double precoFrete =
      (comprimentoDoPacote * larguraDoPacote) * alturaDoPacote / 6000;

  return precoFrete;
}






calculaValorProdutoComDesconto(
    double precoDoProduto, double valorDoDescontoProduto) {
  if (precoDoProduto <= 0.0)
    throw 'O preço do produto tem que ser maior que 0 reais';

  if (valorDoDescontoProduto >= 100)
    throw 'O desconto não pode ser superior ao valor total do produto';

  double descontoNoProduto = precoDoProduto * (valorDoDescontoProduto / 100);
  double valorDoProdutoComDesconto = precoDoProduto - descontoNoProduto;

  return valorDoProdutoComDesconto;
}






calculaValorDescontadoDoProduto(double precoDoProduto, double valorDoDescontoProduto) =>precoDoProduto * (valorDoDescontoProduto / 100);
