/*
import 'dart:async';

import 'dart:math';

import 'package:ezhyper/Base/Localization/localize_translate.dart';

mixin Validator {

  var username_validator = StreamTransformer<String,String>.fromHandlers(
    handleData: (username,sink){
      if(username.length < 3){
        sink.addError(translator.translate("username is incorrect"));
      }else{
        sink.add(username);
      }
    }
  );

  var phone_validator = StreamTransformer<String,String>.fromHandlers(
      handleData: (phone,sink){
        if (phone.length <10) {
          sink.addError(translator.translate("mobile number is incorrect!"));
        } else {
          sink.add(phone);
        }
      }
  );


  var email_validator = StreamTransformer<String,String>.fromHandlers(
      handleData: (email,sink){
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(email)) {
          sink.addError(translator.translate(  "email is incorrect!"));
        } else {
          sink.add(email);
        }
      }
  );


  var password_validator = StreamTransformer<String,String>.fromHandlers(
      handleData: (password,sink){
        if (password.length < 8 || password.isEmpty) {
         sink.addError(translator.translate(  "password is incorrect"));
        } else {
          sink.add(password);
        }
      }
  );

  var code_validator =StreamTransformer<String,String>.fromHandlers(
    handleData: (code,sink){
      if(code.length<4){
        sink.addError(translator.translate("otp code is incorrect"));
      }else{
        sink.add(code);
      }
    }
  );

  var input_number_validator = StreamTransformer<String,String>.fromHandlers(
      handleData: (input,sink){
        if(input.length < 1){
          sink.addError(translator.translate("input is incorrect"));
        }else{
          sink.add(input);
        }
      }
  );


  var price_validator = StreamTransformer<String,String>.fromHandlers(
      handleData: (input,sink){
        if(input.length < 5){
          sink.addError('?????????? ?????? ????????');
        }else{
          sink.add(input);
        }
      }
  );


  var input_text_validator = StreamTransformer<String,String>.fromHandlers(
      handleData: (text,sink){
        if(text.length < 3){
          sink.addError('???????????????? ?????????????? ?????? ????????');
        }else{
          sink.add(text);
        }
      }
  );


  var credit_card_number_validator = StreamTransformer<String,String>.fromHandlers(
      handleData: (input,sink){
        if(input.length < 16){
          sink.addError('?????? ?????????????? ???????????????????? ?????? ????????');
        }else{
          sink.add(input);
        }
      }
  );

  var credit_card_exp_month_validator = StreamTransformer<String,String>.fromHandlers(
      handleData: (input,sink){
        if(input.length < 2){
          sink.addError(' ???????? ?????????? ?????? ???????? (05)');
        }else{
          sink.add(input);
        }
      }
  );

  var credit_card_exp_year_validator = StreamTransformer<String,String>.fromHandlers(
      handleData: (input,sink){
        if(input.length < 2){
          sink.addError('???????? ?????????? ?????? ???????? (25) ');
        }else{
          sink.add(input);
        }
      }
  );
}*/
