import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Curriculo(), debugShowCheckedModeBanner: false));
}

class Curriculo extends StatefulWidget {
  @override
  State<Curriculo> createState() => _CurriculoState();
}

class _CurriculoState extends State<Curriculo> {
  List<Informacoes> informacoes = [];

  List<String> titulosEscolaridade = ["Ensino Médio", "Técnico em Informática para internet"];
  List<String> descricoesEscolaridade = ["Instituto Federal Catarinense", "Instituto Federal Catarinense"];

  List<String> titulosProjetos = ["App de Gerenciamento de gastos energéticos", "App de Incentivo ao transporte público"];
  List<String> descricoesProjetos = [ "Aplicativo realizado em um projeto escolar para controle de gastos energéticos",
    "Aplicativo realizado em um hackathon para incentivar o uso do transporte público.",
  ];

  List<String> titulosRecomendacoes = ["Prof. Heitor Scalco Neto", "Prof. Danimar Veriato"];
  List<String> descricoesRecomendacoes = ["\"Excelente aluno, dedicado e sempre disposto a aprender, com ótimas habilidades de trabalho em equipe e resoluções de problemas.\"",
    "\"Yuri é um profissional talentoso e dedicado, com uma paixão por tecnologia e inovação. Ele tem habilidades técnicas impressionantes e é um excelente colaborador em equipe.\"",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Currículo"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 46, 57, 124),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormularioCadastro()),
              ).then((info) {
                if (info != null) {
                  setState(() {
                    informacoes.add(info);
                  });
                }
              });
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('images/foto_yuri.jpeg'),
            ),
          ),
          SizedBox(height: 12),
          Center(
            child: Text(
              "Yuri",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: SizedBox(
              width: 600,
              child: Text(
                "Olá, me chamo Yuri, sou uma pessoa dedicada e apaixonada por tecnologia.",
              ),
            ),
          ),
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: Icon(Icons.school),
              title: Text("Escolaridade"),
              trailing: Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Escolaridade(
                          informacoes: informacoes,
                          titulos: titulosEscolaridade,
                          descricoes: descricoesEscolaridade,
                          onDeletar: (index) {
                            setState(() {
                              informacoes.removeAt(index);
                            });
                          },
                        )),
              ).then((_) {
                setState(() {});
              }),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.work),
              title: Text("Projetos"),
              trailing: Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Projetos(
                          informacoes: informacoes,
                          titulos: titulosProjetos,
                          descricoes: descricoesProjetos,
                          onDeletar: (index) {
                            setState(() {
                              informacoes.removeAt(index);
                            });
                          },
                        )),
              ).then((_) {
                setState(() {});
              }),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.star),
              title: Text("Recomendações"),
              trailing: Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Recomendacoes(
                          informacoes: informacoes,
                          titulos: titulosRecomendacoes,
                          descricoes: descricoesRecomendacoes,
                          onDeletar: (index) {
                            setState(() {
                              informacoes.removeAt(index);
                            });
                          },
                        )),
              ).then((_) {
                setState(() {});
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class Informacoes {
  String tituloEscolaridade;
  String descricaoEscolaridade;
  String tituloProjeto;
  String descricaoProjeto;
  String tituloRecomendacao;
  String descricaoRecomendacao;

  Informacoes(
    this.tituloEscolaridade,
    this.descricaoEscolaridade,
    this.tituloProjeto,
    this.descricaoProjeto,
    this.tituloRecomendacao,
    this.descricaoRecomendacao,
  );
}

class FormularioCadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController tituloEscolaridade = TextEditingController();
    TextEditingController descricaoEscolaridade = TextEditingController();
    TextEditingController tituloProjeto = TextEditingController();
    TextEditingController descricaoProjeto = TextEditingController();
    TextEditingController tituloRecomendacao = TextEditingController();
    TextEditingController descricaoRecomendacao = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário de Cadastro"),
        backgroundColor: const Color.fromARGB(255, 46, 57, 124),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          Text("Escolaridade - Título:"),
          TextField(controller: tituloEscolaridade),
          Text("Escolaridade - Descrição:"),
          TextField(controller: descricaoEscolaridade),
          ElevatedButton(
            onPressed: () {
              Informacoes info = Informacoes(
                tituloEscolaridade.text,
                descricaoEscolaridade.text,
                '',
                '',
                '',
                '',
              );
              Navigator.pop(context, info);
            },
            child: Text("Salvar Escolaridade"),
          ),
          SizedBox(height: 10),
          Text("Projeto - Título:"),
          TextField(controller: tituloProjeto),
          Text("Projeto - Descrição:"),
          TextField(controller: descricaoProjeto),
          ElevatedButton(
            onPressed: () {
              Informacoes info = Informacoes(
                '',
                '',
                tituloProjeto.text,
                descricaoProjeto.text,
                '',
                '',
              );
              Navigator.pop(context, info);
            },
            child: Text("Salvar Projeto"),
          ),
          SizedBox(height: 10),
          Text("Recomendação - Título:"),
          TextField(controller: tituloRecomendacao),
          Text("Recomendação - Descrição:"),
          TextField(controller: descricaoRecomendacao),
          ElevatedButton(
            onPressed: () {
              Informacoes info = Informacoes(
                '',
                '',
                '',
                '',
                tituloRecomendacao.text,
                descricaoRecomendacao.text,
              );
              Navigator.pop(context, info);
            },
            child: Text("Salvar Recomendação"),
          ),
          SizedBox(height: 20),
          Divider(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 46, 57, 124),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Informacoes info = Informacoes(
                tituloEscolaridade.text,
                descricaoEscolaridade.text,
                tituloProjeto.text,
                descricaoProjeto.text,
                tituloRecomendacao.text,
                descricaoRecomendacao.text,
              );
              Navigator.pop(context, info);
            },
            child: Text("Salvar Todos"),
          ),
        ],
      ),
    );
  }
}

class Escolaridade extends StatefulWidget {
  final List<Informacoes> informacoes;
  final List<String> titulos;
  final List<String> descricoes;
  final Function(int) onDeletar;

  Escolaridade(
      {required this.informacoes,
      required this.titulos,
      required this.descricoes,
      required this.onDeletar});

  @override
  State<Escolaridade> createState() => _EscolaridadeState();
}

class _EscolaridadeState extends State<Escolaridade> {
  @override
  Widget build(BuildContext context) {
    final cadastrados = widget.informacoes
        .asMap()
        .entries
        .where((e) => e.value.tituloEscolaridade.isNotEmpty)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Escolaridade"),
        backgroundColor: const Color.fromARGB(255, 46, 57, 124),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          ...widget.titulos.asMap().entries.map((e) => ListTile(
                title: Text(e.value),
                subtitle: Text(widget.descricoes[e.key]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      widget.titulos.removeAt(e.key);
                      widget.descricoes.removeAt(e.key);
                    });
                  },
                ),
              )),
          ...cadastrados.map((e) => ListTile(
                title: Text(e.value.tituloEscolaridade),
                subtitle: Text(e.value.descricaoEscolaridade),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      widget.onDeletar(e.key);
                    });
                  },
                ),
              )),
        ],
      ),
    );
  }
}

class Projetos extends StatefulWidget {
  final List<Informacoes> informacoes;
  final List<String> titulos;
  final List<String> descricoes;
  final Function(int) onDeletar;

  Projetos(
      {required this.informacoes,
      required this.titulos,
      required this.descricoes,
      required this.onDeletar});

  @override
  State<Projetos> createState() => _ProjetosState();
}

class _ProjetosState extends State<Projetos> {
  @override
  Widget build(BuildContext context) {
    final cadastrados = widget.informacoes
        .asMap()
        .entries
        .where((e) => e.value.tituloProjeto.isNotEmpty)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Projetos"),
        backgroundColor: const Color.fromARGB(255, 46, 57, 124),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          ...widget.titulos.asMap().entries.map((e) => ListTile(
                title: Text(e.value),
                subtitle: Text(widget.descricoes[e.key]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      widget.titulos.removeAt(e.key);
                      widget.descricoes.removeAt(e.key);
                    });
                  },
                ),
              )),
          ...cadastrados.map((e) => ListTile(
                title: Text(e.value.tituloProjeto),
                subtitle: Text(e.value.descricaoProjeto),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      widget.onDeletar(e.key);
                    });
                  },
                ),
              )),
        ],
      ),
    );
  }
}

class Recomendacoes extends StatefulWidget {
  final List<Informacoes> informacoes;
  final List<String> titulos;
  final List<String> descricoes;
  final Function(int) onDeletar;

  Recomendacoes(
      {required this.informacoes,
      required this.titulos,
      required this.descricoes,
      required this.onDeletar});

  @override
  State<Recomendacoes> createState() => _RecomendacoesState();
}

class _RecomendacoesState extends State<Recomendacoes> {
  @override
  Widget build(BuildContext context) {
    final cadastrados = widget.informacoes
        .asMap()
        .entries
        .where((e) => e.value.tituloRecomendacao.isNotEmpty)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Recomendações"),
        backgroundColor: const Color.fromARGB(255, 46, 57, 124),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          ...widget.titulos.asMap().entries.map((e) => ListTile(
                title: Text(e.value),
                subtitle: Text(widget.descricoes[e.key]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      widget.titulos.removeAt(e.key);
                      widget.descricoes.removeAt(e.key);
                    });
                  },
                ),
              )),
          ...cadastrados.map((e) => ListTile(
                title: Text(e.value.tituloRecomendacao),
                subtitle: Text(e.value.descricaoRecomendacao),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      widget.onDeletar(e.key);
                    });
                  },
                ),
              )),
        ],
      ),
    );
  }
}