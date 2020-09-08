part of main;

class Instellingen extends StatefulWidget {
  @override
  _Instellingen createState() => _Instellingen();
}

class _Instellingen extends State<Instellingen> {
  void _showColorPicker(Function cb) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Kies een kleur"),
          content: BlockPicker(
            pickerColor: Theme.of(context).primaryColor,
            onColorChanged: (color) {
              setState(() {
                cb(color);
              });
            },
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Sluit",
                textScaleFactor: 1.25,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Instellingen")),
      body: ValueListenableBuilder(
        valueListenable: Hive.box("userdata").listenable(),
        builder: (context, box, widget) {
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  "Uiterlijk",
                  style: TextStyle(color: Color(userdata.get("accentColor") ?? Colors.orange.value)),
                ),
              ),
              ListTile(
                title: Text('Donker thema'),
                trailing: Switch.adaptive(
                  value: box.get('darkMode'),
                  onChanged: (value) {
                    setState(() {
                      box.put("darkMode", value);
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('Primaire kleur'),
                subtitle: Text(
                  '#${Theme.of(context).primaryColor.value.toRadixString(16).substring(2, 8).toUpperCase()}',
                ),
                onTap: () => _showColorPicker((color) => userdata.put("primaryColor", color.value)),
                trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text('Secundaire kleur'),
                subtitle: Text(
                  '#${Theme.of(context).accentColor.value.toRadixString(16).substring(2, 8).toUpperCase()}',
                ),
                onTap: () => _showColorPicker((color) => userdata.put("accentColor", color.value)),
                trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).accentColor,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  "Account",
                  style: TextStyle(color: Color(userdata.get("accentColor") ?? Colors.orange.value)),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  "Meldingen",
                  style: TextStyle(color: Color(userdata.get("accentColor") ?? Colors.orange.value)),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  "Overig",
                  style: TextStyle(color: Color(userdata.get("accentColor") ?? Colors.orange.value)),
                ),
              ),
              ListTile(
                title: Text("Verander foto"),
                subtitle: Text("Verander je foto als die niet zo goed gelukt is."),
                trailing: CircleAvatar(
                  backgroundColor: Theme.of(context).backgroundColor,
                  child: Icon(IconData(userdata.get("userIcon"), fontFamily: "MaterialIcons"), size: 30),
                ),
                onTap: () async {
                  IconData icon = await FlutterIconPicker.showIconPicker(
                    context,
                    title: Text("Kies een icoontje"),
                    closeChild: Text(
                      'Sluit',
                      textScaleFactor: 1.25,
                    ),
                    // iconPackMode: IconPack.materialOutline,
                  );
                  setState(() {
                    userdata.put("userIcon", icon.codePoint);
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.input),
                title: Text('Open Introductie'),
                onTap: () {
                  // Navigator.pushNamed(context, "Introduction");
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Introduction()));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
