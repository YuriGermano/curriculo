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
  List<String> descricoesProjetos = [
    "Aplicativo realizado em um projeto escolar para controle de gastos energéticos",
    "Aplicativo realizado em um hackathon para incentivar o uso do transporte público.",
  ];

  List<String> titulosRecomendacoes = ["Prof. Heitor Scalco Neto", "Prof. Danimar Veriato"];
  List<String> descricoesRecomendacoes = [
    "\"Excelente aluno, dedicado e sempre disposto a aprender, com ótimas habilidades de trabalho em equipe e resoluções de problemas.\"",
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
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 10),
          _buildMenuCard(
            context,
            Icons.school,
            "Escolaridade",
            () => Escolaridade(
              informacoes: informacoes,
              titulos: titulosEscolaridade,
              descricoes: descricoesEscolaridade,
              onDeletar: (index) => setState(() => informacoes.removeAt(index)),
            ),
          ),
          _buildMenuCard(
            context,
            Icons.work,
            "Projetos",
            () => Projetos(
              informacoes: informacoes,
              titulos: titulosProjetos,
              descricoes: descricoesProjetos,
              onDeletar: (index) => setState(() => informacoes.removeAt(index)),
            ),
          ),
          _buildMenuCard(
            context,
            Icons.star,
            "Recomendações",
            () => Recomendacoes(
              informacoes: informacoes,
              titulos: titulosRecomendacoes,
              descricoes: descricoesRecomendacoes,
              onDeletar: (index) => setState(() => informacoes.removeAt(index)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, IconData icon, String title, Widget Function() builder) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: Icon(Icons.chevron_right),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => builder())).then((_) => setState(() {})),
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
  final TextEditingController tituloEscolaridade = TextEditingController();
  final TextEditingController descricaoEscolaridade = TextEditingController();
  final TextEditingController tituloProjeto = TextEditingController();
  final TextEditingController descricaoProjeto = TextEditingController();
  final TextEditingController tituloRecomendacao = TextEditingController();
  final TextEditingController descricaoRecomendacao = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            onPressed: () => Navigator.pop(context, Informacoes(tituloEscolaridade.text, descricaoEscolaridade.text, '', '', '', '')),
            child: Text("Salvar Escolaridade"),
          ),
          SizedBox(height: 10),
          Text("Projeto - Título:"),
          TextField(controller: tituloProjeto),
          Text("Projeto - Descrição:"),
          TextField(controller: descricaoProjeto),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, Informacoes('', '', tituloProjeto.text, descricaoProjeto.text, '', '')),
            child: Text("Salvar Projeto"),
          ),
          SizedBox(height: 10),
          Text("Recomendação - Título:"),
          TextField(controller: tituloRecomendacao),
          Text("Recomendação - Descrição:"),
          TextField(controller: descricaoRecomendacao),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, Informacoes('', '', '', '', tituloRecomendacao.text, descricaoRecomendacao.text)),
            child: Text("Salvar Recomendação"),
          ),
          SizedBox(height: 20),
          Divider(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 46, 57, 124),
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.pop(
              context,
              Informacoes(
                tituloEscolaridade.text,
                descricaoEscolaridade.text,
                tituloProjeto.text,
                descricaoProjeto.text,
                tituloRecomendacao.text,
                descricaoRecomendacao.text,
              ),
            ),
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

  Escolaridade({required this.informacoes, required this.titulos, required this.descricoes, required this.onDeletar});

  @override
  State<Escolaridade> createState() => _EscolaridadeState();
}

class _EscolaridadeState extends State<Escolaridade> {
  @override
  Widget build(BuildContext context) {
    final cadastrados = widget.informacoes.asMap().entries.where((e) => e.value.tituloEscolaridade.isNotEmpty).toList();
    final totalFixo = widget.titulos.length;

    return Scaffold(
      appBar: AppBar(
        title: Text("Escolaridade"),
        backgroundColor: const Color.fromARGB(255, 46, 57, 124),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: totalFixo + cadastrados.length,
        itemBuilder: (context, index) {
          if (index < totalFixo) {
            return Dismissible(
              key: Key('esc_fixo_${widget.titulos[index]}_$index'),
              direction: DismissDirection.endToStart,
              background: Container(color: Colors.red, alignment: Alignment.centerRight, padding: EdgeInsets.only(right: 20), child: Icon(Icons.delete, color: Colors.white)),
              onDismissed: (_) => setState(() {
                widget.titulos.removeAt(index);
                widget.descricoes.removeAt(index);
              }),
              child: ListTile(title: Text(widget.titulos[index]), subtitle: Text(widget.descricoes[index])),
            );
          } else {
            final entry = cadastrados[index - totalFixo];
            return Dismissible(
              key: Key('esc_cad_${entry.key}'),
              direction: DismissDirection.endToStart,
              background: Container(color: Colors.red, alignment: Alignment.centerRight, padding: EdgeInsets.only(right: 20), child: Icon(Icons.delete, color: Colors.white)),
              onDismissed: (_) => setState(() => widget.onDeletar(entry.key)),
              child: ListTile(title: Text(entry.value.tituloEscolaridade), subtitle: Text(entry.value.descricaoEscolaridade)),
            );
          }
        },
      ),
    );
  }
}

class Projetos extends StatefulWidget {
  final List<Informacoes> informacoes;
  final List<String> titulos;
  final List<String> descricoes;
  final Function(int) onDeletar;

  Projetos({required this.informacoes, required this.titulos, required this.descricoes, required this.onDeletar});

  @override
  State<Projetos> createState() => _ProjetosState();
}

class _ProjetosState extends State<Projetos> {
  @override
  Widget build(BuildContext context) {
    final cadastrados = widget.informacoes.asMap().entries.where((e) => e.value.tituloProjeto.isNotEmpty).toList();
    final totalFixo = widget.titulos.length;

    return Scaffold(
      appBar: AppBar(
        title: Text("Projetos"),
        backgroundColor: const Color.fromARGB(255, 46, 57, 124),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: totalFixo + cadastrados.length,
        itemBuilder: (context, index) {
          if (index < totalFixo) {
            return Dismissible(
              key: Key('proj_fixo_${widget.titulos[index]}_$index'),
              direction: DismissDirection.endToStart,
              background: Container(color: Colors.red, alignment: Alignment.centerRight, padding: EdgeInsets.only(right: 20), child: Icon(Icons.delete, color: Colors.white)),
              onDismissed: (_) => setState(() {
                widget.titulos.removeAt(index);
                widget.descricoes.removeAt(index);
              }),
              child: ListTile(title: Text(widget.titulos[index]), subtitle: Text(widget.descricoes[index])),
            );
          } else {
            final entry = cadastrados[index - totalFixo];
            return Dismissible(
              key: Key('proj_cad_${entry.key}'),
              direction: DismissDirection.endToStart,
              background: Container(color: Colors.red, alignment: Alignment.centerRight, padding: EdgeInsets.only(right: 20), child: Icon(Icons.delete, color: Colors.white)),
              onDismissed: (_) => setState(() => widget.onDeletar(entry.key)),
              child: ListTile(title: Text(entry.value.tituloProjeto), subtitle: Text(entry.value.descricaoProjeto)),
            );
          }
        },
      ),
    );
  }
}

class Recomendacoes extends StatefulWidget {
  final List<Informacoes> informacoes;
  final List<String> titulos;
  final List<String> descricoes;
  final Function(int) onDeletar;

  Recomendacoes({required this.informacoes, required this.titulos, required this.descricoes, required this.onDeletar});

  @override
  State<Recomendacoes> createState() => _RecomendacoesState();
}

class _RecomendacoesState extends State<Recomendacoes> {
  @override
  Widget build(BuildContext context) {
    final cadastrados = widget.informacoes.asMap().entries.where((e) => e.value.tituloRecomendacao.isNotEmpty).toList();
    final totalFixo = widget.titulos.length;

    return Scaffold(
      appBar: AppBar(
        title: Text("Recomendações"),
        backgroundColor: const Color.fromARGB(255, 46, 57, 124),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: totalFixo + cadastrados.length,
        itemBuilder: (context, index) {
          if (index < totalFixo) {
            return Dismissible(
              key: Key('rec_fixo_${widget.titulos[index]}_$index'),
              direction: DismissDirection.endToStart,
              background: Container(color: Colors.red, alignment: Alignment.centerRight, padding: EdgeInsets.only(right: 20), child: Icon(Icons.delete, color: Colors.white)),
              onDismissed: (_) => setState(() {
                widget.titulos.removeAt(index);
                widget.descricoes.removeAt(index);
              }),
              child: ListTile(title: Text(widget.titulos[index]), subtitle: Text(widget.descricoes[index])),
            );
          } else {
            final entry = cadastrados[index - totalFixo];
            return Dismissible(
              key: Key('rec_cad_${entry.key}'),
              direction: DismissDirection.endToStart,
              background: Container(color: Colors.red, alignment: Alignment.centerRight, padding: EdgeInsets.only(right: 20), child: Icon(Icons.delete, color: Colors.white)),
              onDismissed: (_) => setState(() => widget.onDeletar(entry.key)),
              child: ListTile(title: Text(entry.value.tituloRecomendacao), subtitle: Text(entry.value.descricaoRecomendacao)),
            );
          }
        },
      ),
    );
  }
}