import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fssmarthome/Assign/cubit/assign_states.dart';
import 'package:fssmarthome/Assign/models/user_assign_rooms_model.dart';

import '../../Dio/dio_helper.dart';

class AssignCubit extends Cubit<AssignStates>{
  AssignCubit() : super(AssignInitialState());
  static AssignCubit get(context)=>BlocProvider.of(context);

  late UserAssignRoom userAssignRoom;
  void createAssignUserRoom(){
    emit(AssignInitialState());
     DioHelper.postDate(
         url: '/api/assigned',
         data: {
           'userRoom_id':194,
           'user_id':74,
           'userRoomDevice_id':265,
         }).then((value){
       userAssignRoom=UserAssignRoom.fromJson(value.data);
       print(userAssignRoom.data!.userRoomDevice);
       print('////////////////////////DONE///////////////////////');
       emit(AssignCreateUserRoonSuccessState());
     }).catchError((error){
       print(error);
       emit(AssignCreateUserRoonErrorState());
     });
  }

}