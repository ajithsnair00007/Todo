import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/todo_model.dart';
import '../provider/todo_provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 244, 247),
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<NotesProviders>(
          builder: (context,value,child){
            return ListView.builder(
              itemCount: value.getNotes.length,
              itemBuilder: (context,index){
                return CardList(value.getNotes[index],index);
              },
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: () {
        showAlertDialog(context);
      },
          backgroundColor:const Color.fromARGB(255, 167, 253, 7),
          child: const Icon(Icons.add,color: Colors.black,),
      ),
    );

  }
}



class CardList extends StatefulWidget {
  final Notes notes;
  final int index;

  const CardList(this.notes,this.index, 
           {super.key});

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
          decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: ListTile(
           leading: ElevatedButton.icon(
              label:const Text('Edit'),
              onPressed: (){
                showAlertDialogEdit(context, widget.index);
                //  Provider.of<NotesProviders>(context,listen: false).removeNotes(widget.index);
              },
              icon: const Icon(Icons.edit_note_sharp,
              color: Color.fromARGB(255, 70, 244, 54),
              
              
              ),
            ),
              title: Text(widget.notes.title),
            subtitle: Text(widget.notes.description),
            trailing: ElevatedButton.icon(
              label:const Text('delete'),
              onPressed: (){
                 Provider.of<NotesProviders>(context,listen: false).removeNotes(widget.index);
              },
              icon: const Icon(Icons.delete,
              color: Colors.red,
              
              
              ),
            ),
          ),
        ),
      );
    
  }
  
  void updateTodo(index, BuildContext context) {}
}

showAlertDialog(BuildContext context) {

  TextEditingController Title = TextEditingController();
  TextEditingController Description = TextEditingController();
  // Create button
   Widget okButton = 
    ElevatedButton(
    child: const Text("ADD NOTE"),
    onPressed: () {
      Provider.of<NotesProviders>(context,listen: false).addNotes(Title.text, Description.text);
      Navigator.of(context).pop();
      
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("ADD A NEW NOTE "),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: Title,
          decoration: const InputDecoration(hintText: "Enter Title"),
        ),
        TextField(
          controller: Description,
          decoration: const InputDecoration(hintText: "Enter Description"),
        ),
      ],
    ),
       actions: [
          okButton,
     ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogEdit(BuildContext context , int index ) {

  TextEditingController Title = TextEditingController();
  TextEditingController Description = TextEditingController();
  // Create button
   Widget okButton = 
    ElevatedButton(
    child: const Text("EDIT NOTE"),
    onPressed: () {
      Provider.of<NotesProviders>(context,listen: false).updateTodo(index,Title.text,Description.text );
      Navigator.of(context).pop();
      
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("EDIT CURRENT NEW NOTE "),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: Title,
          decoration: const InputDecoration(hintText: "Enter new Title"),
        ),
        TextField(
          controller: Description,
          decoration: const InputDecoration(hintText: "Enter new Description"),
        ),
      ],
    ),
       actions: [
          okButton,
     ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}