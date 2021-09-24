import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  /*
  Ticket ticket;

  Future<Ticket> _gonderiGetir() async {
    var response = await http.get(
        "https://anybwnk52i.execute-api.eu-central-1.amazonaws.com/test/departureTimes");
    if (response.statusCode == 200) {
      return Ticket.fromJson(json.decode(response.body));
    } else {
      throw Exception("Bağlanamadık ${response.statusCode}");
    }
  }

  @override
  void initState() {
    super.initState();
    debugPrint("addi");
    _gonderiGetir().then((okunanGonderi) {
      ticket = okunanGonderi;
    });
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://image.itea3.org/ehZSjd3DphavX59FX_WNDctDvas=/350x/center/https://itea4.org/img/o/2274-1569423691.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            /*Expanded(
                child: FutureBuilder(
              future: _gonderiGetir(),
              builder: (BuildContext context, AsyncSnapshot<Ticket> snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: snapshot.data.data
                        .map((doc) => Card(
                              child: Container(
                                child: ListTile(
                                  leading: Icon(Icons.nightlight_round),
                                  title: Row(
                                    children: [
                                      Text(
                                        doc.route + " / ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        doc.departureTime +
                                            "-" +
                                            doc.arrivalTime,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  subtitle: Text(
                                    doc.daysOfWeek.toString(),
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ))*/
          ],
        ),
      ),
    );
  }
}
