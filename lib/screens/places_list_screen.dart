import 'package:flutter/material.dart';
import './place_detail_screen.dart';
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
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
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
                              subtitle: Text(
                                  greatePlaces.items[index].location.address),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    PlaceDetailScreen.routeName,
                                    arguments: greatePlaces.items[index].id);
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
