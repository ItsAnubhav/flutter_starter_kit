import '../../../../../core/themes/typography.dart';
import '/features/auth/presentation/forgot_password/bloc/auth_bloc.dart';
import '/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const ResponsiveLayout(
          mobile: AuthBody(), tablet: AuthBody(), desktop: AuthBody()),
    );
  }
}

class AuthBody extends StatelessWidget {
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Forgot Password'),
          automaticallyImplyLeading: true,
          elevation: 20,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    style: MyTypography.bodyText1,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: false,
                            builder: (context) {
                              return ListView(
                                children: List.generate(
                                    100,
                                    (index) => ListTile(
                                          title: Text("Item $index"),
                                        )),
                              );
                            });
                      },
                      child: const Text(
                        "Click me",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.30,
              minChildSize: 0.15,
              maxChildSize: 0.80,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        title: Text("Item $index"),
                      ),
                    );
                  },
                  controller: scrollController,
                  itemCount: 25,
                );
              },
            ),
          ],
        ));
  }
}
