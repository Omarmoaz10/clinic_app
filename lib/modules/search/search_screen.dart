import 'package:clinic_app/models/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/search_model.dart';
import '../home/cubit/cubit.dart';
import '../home/cubit/states.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Card(
              child: TextField(
                controller: nameController,
                onSubmitted: (value) {
                  HomeCubit.get(context).search(value);
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search...',
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
              child: StreamBuilder<List<PatientModel>>(
                  stream: (nameController.text != "")
                      ? HomeCubit.get(context).searchPatient()
                      : HomeCubit.get(context).readPatient(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text("Some went wrong");
                    } else if (snapshot.hasData) {
                      final patientsSearch = snapshot.data;
                      print(patientsSearch);
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: patientsSearch!.length,
                        itemBuilder: (context, index) {
                          final item = patientsSearch[index];
                          return Card(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "${item.name}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })),
        );
      },
    );
  }
}
