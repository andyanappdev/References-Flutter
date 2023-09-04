import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<String> titleList = [
    'IU1',
    'IU2',
    'IU3',
    'IU4',
    'IU5',
    'IU6',
    'IU7',
    'IU8',
    'IU9',
  ];
  final List<String> imageList = [
    'assets/images/iu1.jpg',
    'assets/images/iu2.jpg',
    'assets/images/iu3.jpg',
    'assets/images/iu4.jpg',
    'assets/images/iu5.jpg',
    'assets/images/iu6.jpg',
    'assets/images/iu7.jpg',
    'assets/images/iu8.jpg',
    'assets/images/iu9.jpg',
  ];
  final List<String> description = [
    '1. 아이유',
    '2. 아이유',
    '3. 아이유',
    '4. 아이유',
    '5. 아이유',
    '6. 아이유',
    '7. 아이유',
    '8. 아이유',
    '9. 아이유',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: titleList.length,
          itemBuilder: (context, index) {
            // InkWell 로 대체 가능
            return GestureDetector(
              onTap: () {
                _showPopup(
                  context,
                  titleList[index],
                  imageList[index],
                  description[index],
                );
              },
              child: Card(
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(imageList[index]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            titleList[index],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: width,
                            child: Text(
                              description[index],
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Future<void> _showPopup(context, title, image, description) async {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    width: 220,
                    height: 220,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    description,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[500],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                  label: const Text('Close'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
