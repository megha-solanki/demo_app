import 'package:demo_app/bloc/app_bloc.dart';
import 'package:demo_app/bloc/app_events.dart';
import 'package:demo_app/bloc/app_states.dart';
import 'package:demo_app/model/user_model.dart';
import 'package:demo_app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple.shade300,
          title: const Text("Bloc Example"),
          actions: const [Icon(Icons.search)],
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoadedState) {
              List<UserModel> userList = state.users;
              return ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.all(5),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 65,
                              width: 65,
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(userList[index].image),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(userList[index].title),
                                  const SizedBox(height: 5),
                                  Text(userList[index].category),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
            if (state is UserErrorState) {
              return const Center(
                child: Text("Error"),
              );
            }

            return Container();
          },
        ));
  }
}
