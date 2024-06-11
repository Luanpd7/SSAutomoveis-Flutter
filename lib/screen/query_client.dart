

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/client_provider.dart';

class QueryClient extends StatefulWidget {
  @override
  _QueryClientState createState() => _QueryClientState();
}

class _QueryClientState extends State<QueryClient> {

  @override
  void initState() {
    super.initState();
    // Load clients when the widget is initialized
    Provider.of<ClientProvider>(context, listen: false).select();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ClientProvider>(
        builder: (context, clientProvider, _) {
          return ListView.builder(
            itemCount: clientProvider.list.length,
            itemBuilder: (context, index) {
              final client = clientProvider.list[index];
              return ListTile(
                title: Text(client.razaoSocial),
                subtitle: Text('Ola'),
              );
            },
          );
        },
      ),
    );
  }
}
