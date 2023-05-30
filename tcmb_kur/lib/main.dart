import 'package:flutter/material.dart';
import 'package:tcmb_kur/model/kur_model.dart';
import 'package:tcmb_kur/service/kur_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  KurService _service = KurService();
  bool? isLoading;

  List<TcmbAnlikKurBilgileri> kur = [];
  @override
  void initState() {
    super.initState();
    _service.fetchKur().then((value) {
      if (value != null && value.tcmbAnlikKurBilgileri != null) {
        setState(() {
          kur = value.tcmbAnlikKurBilgileri;
          isLoading = true;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Material App ",
      home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("TCMB Kur")),
          ),
          body: isLoading == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : isLoading == true
                  ? ListView.builder(
                      itemCount: kur.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("${kur[index].currencyName}",style: TextStyle(color: Colors.black ),),
                          subtitle: Text("${kur[index].banknoteBuying}",style: TextStyle(color: Colors.black),),
                        );
                      },
                    )
                  : const Center(
                      child: Text("Bir sorun oluştu.."),
                    )),
    );
  }
}
