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
                "Olá, me chamo Yuri, sou uma pessoa dedicada e apaixonada por tecnologia comprometida com o aprendizado.",
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
                MaterialPageRoute(builder: (context) => Escolaridade(informacoes: informacoes)),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.work),
              title: Text("Projetos"),
              trailing: Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Projetos(informacoes: informacoes)),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.star),
              title: Text("Recomendações"),
              trailing: Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Recomendacoes(informacoes: informacoes)),
              ),
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

          SizedBox(height: 10),

          Text("Projeto - Título:"),
          TextField(controller: tituloProjeto),
          Text("Projeto - Descrição:"),
          TextField(controller: descricaoProjeto),

          SizedBox(height: 10),

          Text("Recomendação - Título:"),
          TextField(controller: tituloRecomendacao),
          Text("Recomendação - Descrição:"),
          TextField(controller: descricaoRecomendacao),

          SizedBox(height: 20),

          ElevatedButton(
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
            child: Text("Salvar"),
          ),
        ],
      ),
    );
  }
}

class Escolaridade extends StatelessWidget {
  List<Informacoes> informacoes;

  Escolaridade({required this.informacoes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escolaridade"),
        backgroundColor: const Color.fromARGB(255, 46, 57, 124),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Ensino Médio"),
            subtitle: Text("Instituto Federal Catarinense"),
          ),
          ListTile(
            title: Text("Técnico em Informática para internet"),
            subtitle: Text("Instituto Federal Catarinense"),
          ),
          ...informacoes.map((info) => ListTile(
                title: Text(info.tituloEscolaridade),
                subtitle: Text(info.descricaoEscolaridade),
              )),
        ],
      ),
    );
  }
}

class Projetos extends StatelessWidget {
  List<Informacoes> informacoes;

  Projetos({required this.informacoes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projetos"),
        backgroundColor: const Color.fromARGB(255, 46, 57, 124),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("App de Vendas"),
            subtitle: Text("Aplicativo realizado em Flutter para controle de vendas e estoque"),
          ),
          ListTile(
            title: Text("App de Receitas"),
            subtitle: Text("Aplicativo realizado em Flutter para consulta de receitas culinárias"),
          ),
          ...informacoes.map((info) => ListTile(
                title: Text(info.tituloProjeto),
                subtitle: Text(info.descricaoProjeto),
              )),
        ],
      ),
    );
  }
}

class Recomendacoes extends StatelessWidget {
  List<Informacoes> informacoes;

  Recomendacoes({required this.informacoes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recomendações"),
        backgroundColor: const Color.fromARGB(255, 46, 57, 124),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Prof. Heitor Scalco Neto"),
            subtitle: Text(
              "\"Excelente aluno, dedicado e sempre disposto a aprender, com ótimas habilidades de trabalho em equipe e resoluções de problemas.\"",
            ),
          ),
          ListTile(
            title: Text("Jensen Huang"),
            subtitle: Text(
              "\"Yuri é um profissional talentoso e dedicado, com uma paixão por tecnologia e inovação. Ele tem habilidades técnicas impressionantes e é um excelente colaborador em equipe.\"",
            ),
          ),
          ...informacoes.map((info) => ListTile(
                title: Text(info.tituloRecomendacao),
                subtitle: Text(info.descricaoRecomendacao),
              )),
        ],
      ),
    );
  }
}