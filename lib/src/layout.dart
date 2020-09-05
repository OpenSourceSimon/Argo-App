part of main;

bool hasRunRunIntro = false;

class _Home extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    Agenda(),
    Huiswerk(),
    Afwezigheid(),
    Cijfers(),
    Berichten(),
    Studiewijzer(),
    Opdrachten(),
    Leermiddelen(),
    Bronnen(),
    MijnGegevens(),
    Instellingen(),
  ];

  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_children[_currentIndex].toStringShort()),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Test Leering"),
              accountEmail: Text("Leerling Nummer"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).backgroundColor,
                child: Icon(Icons.person, size: 50),
              ),
            ),
            ListTile(
              selected: 0 == _currentIndex,
              leading: Icon(Icons.event),
              title: Text('Agenda'),
              onTap: () {
                changeIndex(0);
              },
            ),
            ListTile(
              selected: 1 == _currentIndex,
              leading: Icon(Icons.assignment),
              title: Text('Huiswerk'),
              onTap: () {
                changeIndex(1);
              },
            ),
            ListTile(
              selected: 2 == _currentIndex,
              leading: Icon(Icons.check_circle),
              title: Text('Afwezigheid'),
              onTap: () {
                changeIndex(2);
              },
            ),
            ListTile(
                selected: 3 == _currentIndex,
                leading: Icon(Icons.looks_6),
                title: Text('Cijfers'),
                onTap: () {
                  changeIndex(3);
                }),
            ListTile(
              selected: 4 == _currentIndex,
              leading: Icon(Icons.email),
              title: Text('Berichten'),
              onTap: () {
                changeIndex(4);
              },
            ),
            ExpansionTile(
              leading: Icon(Icons.folder),
              title: Text("ELO"),
              children: <Widget>[
                ListTile(
                  selected: 5 == _currentIndex,
                  leading: Icon(Icons.work),
                  title: Text('Studiewijzer'),
                  onTap: () {
                    changeIndex(5);
                  },
                ),
                ListTile(
                  selected: 6 == _currentIndex,
                  leading: Icon(Icons.assignment_turned_in),
                  title: Text('Opdrachten'),
                  onTap: () {
                    changeIndex(6);
                  },
                ),
                ListTile(
                  selected: 7 == _currentIndex,
                  leading: Icon(Icons.description),
                  title: Text('Leermiddelen'),
                  onTap: () {
                    changeIndex(7);
                  },
                ),
                ListTile(
                  selected: 8 == _currentIndex,
                  leading: Icon(Icons.folder_shared),
                  title: Text('Bronnen'),
                  onTap: () {
                    changeIndex(8);
                  },
                ),
              ],
            ),
            ListTile(
              selected: 9 == _currentIndex,
              leading: Icon(Icons.person),
              title: Text('Mijn gegevens'),
              onTap: () {
                changeIndex(9);
              },
            ),
            ListTile(
              selected: 10 == _currentIndex,
              leading: Icon(Icons.settings),
              title: Text('Instellingen'),
              onTap: () {
                changeIndex(10);
              },
            ),
            ListTile(
              selected: 11 == _currentIndex,
              leading: Icon(Icons.input),
              title: Text('Open Introductie'),
              onTap: () {
                runApp(Introduction());
              },
            )
          ],
        ),
      ),
      body: _children[_currentIndex],
    );
  }
}
