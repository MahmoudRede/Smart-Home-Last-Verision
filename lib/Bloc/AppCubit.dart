import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fssmarthome/Bloc/AppStates.dart';
import 'package:fssmarthome/Dio/dio_helper.dart';
import 'package:fssmarthome/Views/Login.dart';
import 'package:fssmarthome/Constants/constants.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);


}