import 'package:flutter/material.dart';
import 'package:inspirar_movil/models/contact.dart';
import 'package:inspirar_movil/utils/database_helper.dart';

// Sample Video: https://www.youtube.com/watch?v=tj7Lj9a3fyM
const darkBlueColor = Color.fromARGB(255, 60, 98, 123);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // This is the theme of your application.
    return MaterialApp(
      title: 'Contacts',
      theme: ThemeData(
        primaryColor: darkBlueColor,
      ),
      home: const MyHomePage(title: 'Contacts'),
    );
  }
}

// This widget is the home page of your application. It is stateful, meaning
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Contact _contact = Contact();
  List<Contact> _contacts = [];
  //call the Database
  DatabaseHelper _dbHelper = DatabaseHelper.instance;
  //to initialize this form with a unique key value.
  final _formKey = GlobalKey<FormState>();
  final _ctrlName = TextEditingController();
  final _ctrlMobile = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _dbHelper = DatabaseHelper.instance;
    });
    _refreshContactList();
  }

// This call to setState tells the Flutter framework that something has changed.
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  // This method is rerun every time setState is called, for instance as done
  Widget build(BuildContext context) {
    return Scaffold(
      // Here we take the value from the MyHomePage object that was created by
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 171, 208, 251),
        title: Center(
            child: Text(
          widget.title,
          style: TextStyle(color: darkBlueColor),
        )),
      ),
      body: Center(
        // Center is a layout widget.
        child: Column(
          // Column is also a layout widget. It takes a list of children
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[_form(), _list()],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

//creating functions for the form and list

  _form() => Container(
        color: Colors.blueGrey,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
            //form values
            children: <Widget>[
              TextFormField(
                controller: _ctrlName,
                decoration: InputDecoration(labelText: 'Full Name'),
                onSaved: (value) => setState(() => _contact.name),
                validator: (value) =>
                    (value!.isEmpty ? 'This field is required' : null),
              ),
              TextFormField(
                controller: _ctrlMobile,
                decoration: InputDecoration(labelText: 'Phone Number'),
                onSaved: (val) => setState(() => _contact.mobile),
                validator: (value) =>
                    (value!.isEmpty ? 'This field is required' : null),
              ),
              //submit button
              Container(
                margin: EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () => _onSubmit(),
                  child: const Text('Submit'),
                  style: ButtonStyle(backgroundColor:
                      MaterialStateColor.resolveWith(
                          (Set<MaterialState> states) {
                    return Colors.black;
                  })),
                ),
              ),
            ],
          ),
        ),
      );

  _refreshContactList() async {
    List<Contact> xvar = await _dbHelper.fetchContacts();
    setState(() {
      _contacts = xvar;
    });
  }

  _onSubmit() async {
    var form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      if (_contact.id == null)
        await _dbHelper.insertContact(_contact);
      else
        await _dbHelper.updateContact(_contact);
      _refreshContactList();
      _resetForm();
    }
  }

  _resetForm() {
    setState(() {
      //Fix this
      _formKey.currentState?.reset();
      _ctrlName.clear();
      _ctrlMobile.clear();
      _contact.id = null;
    });
  }

  _list() => Expanded(
        child: Card(
            margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.account_circle,
                          color: darkBlueColor, size: 40.0),
                      title: Text(
                        _contacts[index].name.toString().toUpperCase(),
                        style: TextStyle(
                            color: darkBlueColor, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(_contacts[index].mobile.toString()),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_sweep, color: darkBlueColor),
                        onPressed: () async {
                          await _dbHelper
                              .deleteContact(_contacts[index].id); //Fix This
                          _resetForm();
                          _refreshContactList();
                        },
                      ),
                      onTap: () {
                        setState(() {
                          _contact = _contacts[index];
                          _ctrlName.text = _contacts[index].name.toString();
                          _ctrlMobile.text = _contacts[index].mobile.toString();
                        });
                      },
                    ),
                    Divider(
                      height: 5.0,
                    )
                  ],
                );
              },
            )),
      );
}
