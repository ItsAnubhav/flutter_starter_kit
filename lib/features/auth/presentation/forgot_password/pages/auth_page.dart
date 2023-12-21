import '../../../../../core/themes/typography.dart';
import '../../../../../widgets/my_text_field.dart';
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                style: MyTypography.bodyText1,
              ),
              MyTextField(
                  controller: TextEditingController(),
                  labelText: "Select date",
                  dateTimeFormat: "dd MMM, yyyy hh:mm a",
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  }),
            ],
          ),
        ));
  }
}
