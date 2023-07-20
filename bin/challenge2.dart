void main() {
  
  //! Detalhe sobre a String
  //! A String é composta por 3 campos (Nome|Idade|Sexo)
  final pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Feminino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  //! Baseado na lista acima.
  //! 1 - Remova os pacientes duplicados e apresente a nova lista
  final semDuplicados = pessoas.toSet().toList();
  final pessoasUnicas = pessoasUnicasPorNome(semDuplicados);

  print('Pessoas únicas:');
  for (final pessoa in pessoasUnicas) {
    print('- $pessoa');
  }

  //! 2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas
  final pessoasSexo = pessoasPorSexo(semDuplicados);

  print('\nPessoas por sexo:');
  print("Masculino: ${pessoasSexo['Masculino']}");
  for (final pessoa in pessoasSexo['MasculinoLista']!) {
    print('- $pessoa');
  }
  print("Feminino: ${pessoasSexo['Feminino']}");
  for (final pessoa in pessoasSexo['FemininoLista']!) {
    print('- $pessoa');
  }
  
  //! 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e apresente essas pessoas pelo nome 
  final pessasMaiores18 = pessoasPorIdade(semDuplicados);

  print('\nPessoas maiores de 18:');
  for (final pessoa in pessasMaiores18) {
    print('- $pessoa');
  }

  //! 4 - Encontre a pessoa mais velha e apresente o nome dela.
  print('\nPessoa mais velha: ${pessoaMaisVelha(semDuplicados)}');
}

List<String> pessoasUnicasPorNome(List<String> pessoas) {
  return pessoas.map((e) {
    final dados = e.split('|');
    return dados[0];
  }).toList();
}

Map<String, dynamic> pessoasPorSexo(List<String> pessoas) {
  var masculino = [];
  var feminino = [];

  for (final pessoa in pessoas) {
    final dados = pessoa.split('|');
    if (dados[2] == 'Masculino') {
      masculino.add(dados[0]);
    } else {
      feminino.add(dados[0]);
    }
  }

  final pessoasPorSexo = {
    'Masculino': masculino.length,
    'Feminino': feminino.length,
    'MasculinoLista': masculino,
    'FemininoLista': feminino,
  };

  return pessoasPorSexo;
}

List<String> pessoasPorIdade(List<String> pessoas) {
  return pessoas.fold([], (previousValue, element) {
    final dados = element.split('|');
    if (int.parse(dados[1]) > 18) {
      return [...previousValue, dados[0]];
    }

    return previousValue;
  });
}

String pessoaMaisVelha(List<String> pessoas) {
  int? primeiro;
  String? pessoaSelecionada;

  for (final pessoa in pessoas) {
    final dados = pessoa.split('|');
    final idade = int.parse(dados[1]);

    if (primeiro == null || idade > primeiro) {
      primeiro = idade;
      pessoaSelecionada = dados[0];
    }
  }
  
  return pessoaSelecionada!;
}
