class Client {
  final int cnpj;
  final String nome;
  final int telefone;
  final String cidade;
  final String gerente;
  final bool situacao;
  final DateTime dataRegistro;

  Client({
    required this.cnpj,
    required this.nome,
    required this.telefone,
    required this.cidade,
    required this.gerente,
    required this.situacao,
    required this.dataRegistro,
  });
}
