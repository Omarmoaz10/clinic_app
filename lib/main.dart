import 'package:clinic_app/modules/patient_register/cubit/cubit.dart';
import 'package:clinic_app/shared/bloc_observer.dart';
import 'package:clinic_app/shared/component/constanse.dart';
import 'package:clinic_app/shared/network/local/cache_helper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'models/patient_model.dart';
import 'modules/Doctor/doctor_room.dart';
import 'modules/home/cubit/cubit.dart';
import 'modules/home/cubit/states.dart';
import 'modules/home/home.dart';
import 'modules/social_login/social_login_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var token = await  FirebaseMessaging.instance.getToken();
  print(token);
  await CacheHelper.init();

  Widget widget;

  uId = CacheHelper.getData(key: 'uId');

  if (uId != null) {
    widget = Home();
  } else {
    widget = SocialLoginScreen();
  }
  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        startWidget: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
final Widget startWidget;

  MyApp({
    required this.startWidget,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => HomeCubit()
            ..getUserData()
        ),
        BlocProvider(
          create: (BuildContext context) => PatientRegisterCubit()
          //  ..getPatientData()
        ),
      ],
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Home(),
          );
        },
      ),
    );
  }
}

