import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/guichet.dart';
import '../providers/guichet_provider.dart';

class GuichetListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final guichetProvider = Provider.of<GuichetProvider>(context);

    return Scaffold(
      appBar:  AppBar(
        title: Text("Guichets",style: TextStyle(color: Colors.black),),
        backgroundColor:Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.star_border_rounded),
            color: Colors.black,
            onPressed: () {
             
            },
          ),
           ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/add');
                  },
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  ),
                  child: Text(
                    "nouveau guichet",
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            TextField(
              decoration: InputDecoration(
                hintText: "Rechercher...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            
            Expanded(
              child: ListView.builder(
        itemCount: guichetProvider.guichets.length,
        itemBuilder: (ctx, index) {
          final guichet = guichetProvider.guichets[index];
          return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage(guichet.icon),
            ),
            const SizedBox(width: 16.0),
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Row(
                    children: [
                      Text(
                        guichet.name,
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8.0),
                      Icon(Icons.verified, color: Colors.green, size: 16.0),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  
                  Text(
                    guichet.role,
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    guichet.status,
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            
            Column(
              children: [
                IconButton(
                  icon: Icon(
               guichet.isFavorite ? Icons.star : Icons.star_border,
              color: guichet.isFavorite ? Colors.yellow : null, 
            ),
                  onPressed: () {
                    guichetProvider.toggleFavorite(index);
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    guichetProvider.deleteGuichet(index);
                  },
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  ),
                  child: Text(
                    "Supprimer",
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
        },
      ),
            ),
          ],
        ),
      ), 
        );
  }
} 
