import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // Ajouter 'const' ici
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FAQ App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text('Bienvenue sur notre forum sur l\'histoire du mouchoir groupe de ING2 Mathys et Antoine'),
        centerTitle: true,
      ),
      body: Container(
       decoration: const BoxDecoration(
          gradient:  LinearGradient( // Ajoutez 'const' ici
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.white], // Couleurs de dégradé
          ),
       ),
        child: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FAQPage()),
              );
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Image.asset("mouchoir.png"),
            ),
          ),
        ),
      ),
    );
  }
}

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  final List<FAQItem> faqItems = [
    FAQItem(
      question: 'Qu\'est-ce qu\'un mouchoir ?',
      answer: 'Un \"Mouchoir" est un nom masculin. Il est désigné comme un morceau de linge, de papier qui sert à se moucher, à s\'essuyer le visage.',
    ),
    FAQItem(
      question: 'Comment utiliser un mouchoir ?',
      answer: 'Il n\'est pas difficile d\'utiliser un mouchoir ! Dépliez simplement le petit carré de coton, soulevez-le jusqu\'à votre nez et soufflez.',
    ),
    FAQItem(
      question: 'Qui a inventé le \"Mouchoir" ?',
      answer: 'Inventé au XVIe siècle par une noble et riche Vénitienne qui ne jetait rien et qui, après avoir découpé une pièce de lin, imagina de l\'en border de dentelle, le mouchoir. Il fut longtemps un attribut textile et raffiné réservé au seul usage des princes. Le mouchoir est devenu carré tel qu\'on le connait grâce à Louis XVI qui l\'a rendu obligatoire.',
    ),
    FAQItem(
      question: 'Quelle est le meilleur mouchoir du monde ?',
      answer: 'Parmi tous les mouchoirs du monde, un seul a été élu \"Le meilleur mouchoir du monde". Le mouchoir Simonnot Godard, utilisé principalement pour les costumes. Ce mouchoir est un produit authentiquement artisanal, qui respecte le savoir-faire et le soin d\'autrefois. La pochette de costume ou mouchoir de poche Simonnot Godard est aussi fabriquée en lin et coton, très fine et traitée dans les Vosges.',
    ),
    FAQItem(
      question: 'Où trouver des mouchoirs ?',
      answer: 'Trouver un mouchoir est relativement simple. Tous les centres commerciaux vendent des mouchoirs de toutes marques.',
    ),
    // Add more FAQ items as needed
  ];

  void _ajouterQuestionReponse() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String nouvelleQuestion = '';
        String nouvelleReponse = '';

        return AlertDialog(
          title: Text('Ajouter une nouvelle question-réponse'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (value) {
                    nouvelleQuestion = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Question',
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    nouvelleReponse = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Réponse',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Ajouter'),
              onPressed: () {
                setState(() {
                  faqItems.add(FAQItem(
                    question: nouvelleQuestion,
                    answer: nouvelleReponse,
                  ));
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ sur l\'histoire du mouchoir'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.white], // Couleurs de dégradé
          ),
        ),
        child: ListView.builder(
          itemCount: faqItems.length + 1,
          itemBuilder: (context, index) {
            if (index < faqItems.length) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Card(
                  elevation: 4, // Élévation de la carte pour ajouter de la profondeur
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ), // Forme arrondie de la carte
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          faqItems[index].question,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(height: 8.0), // Ajoute un espace entre le titre et la réponse
                        Text(
                          faqItems[index].answer,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _ajouterQuestionReponse,
                  child: Text('Ajouter'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}