import 'package:flutter/material.dart';
import 'package:weather_app/pages/weather_detail.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late final TextEditingController _controller;
  bool _isCityNameEmpty = true;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();    //to have access to the changing text

    _controller.addListener(() {
      setState(() =>                          // arrow function : replace {} with => (used to make it in one line)
        _isCityNameEmpty = _controller.text.isEmpty,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search City'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Please search for a city',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _controller,        //_controller that defined above is assigned here
                decoration: InputDecoration(
                  focusColor: Colors.purple,
                  label: Text( 'City Name'),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: OutlineInputBorder(
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _isCityNameEmpty ? null: (){            //if (?) city name is empty
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WeatherDetail(
                        cityName: _controller.text),
                ),
                );
              },
              child: Text('Search'),)
          ],
        ),
      ),
    );
  }
}
