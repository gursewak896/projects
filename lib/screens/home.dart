import 'package:api_parsing_using_bloc/bloc/app_bloc.dart';
import 'package:api_parsing_using_bloc/bloc/app_event.dart';
import 'package:api_parsing_using_bloc/bloc/app_state.dart';
import 'package:api_parsing_using_bloc/models/user_model.dart';
import 'package:api_parsing_using_bloc/repos/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('API Parsing using Blocs'),
        ),
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.users != null) {
            List<UserModel> userList = state.users!;
            return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.blue,
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          userList[index].name,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          userList[index].year.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                });
          }
          if (state.error != null) {
            return const Center(
              child: Text('Error'),
            );
          }
          return Container();
        }),
      ),
    );
  }
}
