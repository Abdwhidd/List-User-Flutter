import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:listuser/apiservice.dart';
import 'package:listuser/data.dart';

class ListUser extends StatefulWidget {
  const ListUser({Key? key}) : super(key: key);

  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  Service serviceAPI = Service();
  late Future<List<cData>> listData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listData = serviceAPI.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List User"),
      ),
      body: Container(
        child: FutureBuilder<List<cData>>(
          future: listData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<cData> isiData = snapshot.data!;
              return ListView.builder(
                itemCount: isiData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(isiData[index].nama),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(isiData[index].avatar),
                      ),
                      subtitle: Text(isiData[index].pekerjaan),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
