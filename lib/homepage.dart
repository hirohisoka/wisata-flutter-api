import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wisata/wisata.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<ListWisata> listWisata;

  Future<ListWisata> getListWisata() async {
    var dio = Dio();
    Response response =
        await dio.get('https://dev.farizdotid.com/api/purwakarta/wisata');
    print(response.data);
    if (response.statusCode == 200) {
      return ListWisata.fromJson(response.data);
    } else {
      throw Exception('Failed to load wisata');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listWisata = getListWisata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WISATA"),
      ),
      body: FutureBuilder<ListWisata>(
          future: listWisata,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  itemCount: snapshot.data.wisata.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              '${snapshot.data.wisata[index].gambarUrl}'),
                        ),
                        title: Text('${snapshot.data.wisata[index].nama}'),
                        subtitle:
                            Text('${snapshot.data.wisata[index].kategori}'),
                      ),
                    );
                  });
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
