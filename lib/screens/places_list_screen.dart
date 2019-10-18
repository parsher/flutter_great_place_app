import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './add_place_screen.dart';
import '../providers/greate_places.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    builder: (ctx, greatePlaces, child) =>
                        greatePlaces.items.length <= 0
                            ? child
                            : ListView.builder(
                                itemCount: greatePlaces.items.length,
                                itemBuilder: (ctx, index) => ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: FileImage(
                                      greatePlaces.items[index].image,
                                    ),
                                  ),
                                  title: Text(greatePlaces.items[index].title),
                                  onTap: () {
                                    // go to detail page
                                  },
                                ),
                              ),
                    child: Center(
                      child: Text('Got no places yet, start adding some!'),
                    ),
                  ),
      ),
    );
  }
}
