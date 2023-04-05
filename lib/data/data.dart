class DataBase {
  String titre;
  String soustitre;
  String description;

  DataBase(
      {required this.titre,
      required this.soustitre,
      required this.description});
}

List<String> categorie = [
  "Tout",
  "Liens Web",
  "Page facebook",
  "Page Instagram",
  "Page Tiktok",
  "Page Twitter",
];

List<String> titre = [
  "Flutter TabBar: A complete tutorial with examples",
  "Taille des écrans en pouces et cm - LeMemento.fr",
  "La taille des différents écrans - Calculateur.com",
  "Quelle taille, dimension et définition d'écran choisir pour son PC",
  "Résolution, définition et taille d'écran d'un téléphone : quelles ...",
  "Calcul de la taille d'un écran | ckoideja",
  "Taille écran TV & PC : calculateurs & comparateurs - Synoptik"
];

List<String> sousTitre = [
  "https://blog.logrocket.com/flutter-tabbar-a-complete-tutorial-with-examples",
  "https://www.lememento.fr/taille-ecran-pouces-c",
  "https://www.calculateur.com/taille-ecrans.html",
  "https://www.dimension-pc.com/dimensions-ecrans",
  "https://www.monpetitforfait.com/toutes-les-aides/...",
  "https://ckoideja.com/calcul-taille-ecran",
  "https://www.synoptik.fr/taille-ecran"
];

List<String> description = [
  "Provide a TabController TabBar and TabBarView require a TabController to work. There are two different ways to provide the controller. The first one is having a DefaultTabController as an ancestor widget. DefaultTabControllercan be created using the constructor below. The length argument is used Create TabBar If you want to implement tab layout, first you need to have a tab bar which contains the list of tabs. In Flutter, you can use the TabBar widget. The TabBar can be placed anywhere according to the design. If you want to place it right under the AppBar, you can pass it as the bottom argumen…",
  "Que ce soit pour les téléviseurs, les écrans de PC, les PC portables, les téléphones mobiles et autres Smartphones , les tablettes, les lecteurs mp3, ou même les appareils photos numériques, la taille des …",
  "La taille d’un écran d’ordinateur varie aussi selon le format de l’écran : 16/9e ou 16/10e (les formats 4/3 ou 5/4 se font de plus en plus rares). Ce changement de format permet d'optimiser la découpe industrielle des …",
  "Pour préciser nos propos, un pouce est égal à 2.4 cm. Que ce soit dans les rayons de votre magasin ou sur Internet, les tailles d’écran de PC ne manquent pas. En effet, on retrouve …",
  "De nombreux appareils proposent des écrans entre 5 et 6 pouces. Les appareils allant au-delà des 6 pouces sont également nombreux et l’on parle quelquefois de « phablettes « Les...",
  "Le format d’un écran représente le rapport ou ratio entre sa longueur et sa largeur. Les formats les plus répandus sont les suivants : 16/9 : format actuel standard pour les téléviseurs. C’est aussi le format le plus courant ",
  "Cliquez sur un preset ou utiliser le slider pour indiquer une valeur (en pouces). Le calculateur affichera automatiquement largeur, hauteur et diagonale (en cm). Cliquez sur l'icône pour afficher un deuxième écran …"
];

// var data1 =
//     DataBase(titre: , soustitre: sousTitre, description: description);

List<Map<String, String>> data = [
  // {
  //   "title": "Flutter TabBar: A complete tutorial with examples",
  //   "subtitle":
  //       "https://blog.logrocket.com/flutter-tabbar-a-complete-tutorial-with-examples",
  //   "description":
  //       "Provide a TabController TabBar and TabBarView require a TabController to work. There are two different ways to provide the controller. The first one is having a DefaultTabController as an ancestor widget. DefaultTabControllercan be created using the constructor below. The length argument is used Create TabBar If you want to implement tab layout, first you need to have a tab bar which contains the list of tabs. In Flutter, you can use the TabBar widget. The TabBar can be placed anywhere according to the design. If you want to place it right under the AppBar, you can pass it as the bottom argumen…",
  // },
  // {
  //   "title": "Taille des écrans en pouces et cm - LeMemento.fr",
  //   "subtitle": "https://www.lememento.fr/taille-ecran-pouces-c",
  //   "description":
  //       "Que ce soit pour les téléviseurs, les écrans de PC, les PC portables, les téléphones mobiles et autres Smartphones , les tablettes, les lecteurs mp3, ou même les appareils photos numériques, la taille des …",
  // },
  // {
  //   "title": "La taille des différents écrans - Calculateur.com",
  //   "subtitle": "https://www.calculateur.com/taille-ecrans.html",
  //   "description":
  //       "La taille d’un écran d’ordinateur varie aussi selon le format de l’écran : 16/9e ou 16/10e (les formats 4/3 ou 5/4 se font de plus en plus rares). Ce changement de format permet d'optimiser la découpe industrielle des …",
  // },
  // {
  //   "title":
  //       "Quelle taille, dimension et définition d'écran choisir pour son PC",
  //   "subtitle": "https://www.dimension-pc.com/dimensions-ecrans",
  //   "description":
  //       "Pour préciser nos propos, un pouce est égal à 2.4 cm. Que ce soit dans les rayons de votre magasin ou sur Internet, les tailles d’écran de PC ne manquent pas. En effet, on retrouve …",
  // },
  // {
  //   "title":
  //       "Résolution, définition et taille d'écran d'un téléphone : quelles ...",
  //   "subtitle": "https://www.monpetitforfait.com/toutes-les-aides/...",
  //   "description":
  //       "De nombreux appareils proposent des écrans entre 5 et 6 pouces. Les appareils allant au-delà des 6 pouces sont également nombreux et l’on parle quelquefois de « phablettes « Les...",
  // },
  // {
  //   "title": "Calcul de la taille d'un écran | ckoideja",
  //   "subtitle": "https://ckoideja.com/calcul-taille-ecran",
  //   "description":
  //       "Le format d’un écran représente le rapport ou ratio entre sa longueur et sa largeur. Les formats les plus répandus sont les suivants : 16/9 : format actuel standard pour les téléviseurs. C’est aussi le format le plus courant ",
  // },
  // {
  //   "title": "Taille écran TV & PC : calculateurs & comparateurs - Synoptik",
  //   "subtitle": "https://www.synoptik.fr/taille-ecran",
  //   "description":
  //       "Cliquez sur un preset ou utiliser le slider pour indiquer une valeur (en pouces). Le calculateur affichera automatiquement largeur, hauteur et diagonale (en cm). Cliquez sur l'icône pour afficher un deuxième écran …"
  // }
];

List<DataBase> dataBases = data
    .map((e) => DataBase(
        titre: e["title"]!,
        soustitre: e["subtitle"]!,
        description: e["description"]!))
    .toList();
