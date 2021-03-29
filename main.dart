import 'package:flutter/material.dart';

void main() {
  runApp(

          Calculator()

  );
}
class Calculator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(
     title: "Calcuator",
     home: Calco(),
   );

  }

}
class Calco extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Calco();
  }

}
class _Calco extends State<Calco>{
  String text="0";
  double num1=0;
  double num2=0;
  String result="0";
  String finalresult="0";
  String Operation='';
  String preOperation='';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: null,
     backgroundColor: Colors.black87,
     body:
     Container(
       margin: EdgeInsets.only(bottom: 20),
       child:
       Column(
         mainAxisAlignment: MainAxisAlignment.end,
         children: <Widget>[
           Row(
             children: <Widget>[
               Expanded(child:
               Text(
                 text,
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 60,

                 ),
                 maxLines: 1,
                 textAlign: TextAlign.right,
               ))
             ],
           ),
           Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               button("C",   Colors.white12, 1),
               button("+/-", Colors.white12, 1),
               button("%",   Colors.white12, 1),
               button("/",   Colors.amber, 1)





             ],

           ),
           Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               button("7", Colors.blueGrey, 1),
               button("8", Colors.blueGrey, 1),
               button("9", Colors.blueGrey, 1),
               button("x", Colors.amber, 1)





             ],

           ),
           Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               button("4", Colors.blueGrey, 1),
               button("5", Colors.blueGrey, 1),
               button("6", Colors.blueGrey, 1),
               button("-", Colors.amber, 1)





             ],

           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               button("1", Colors.blueGrey, 1),
               button("2", Colors.blueGrey, 1),
               button("3", Colors.blueGrey, 1),
               button("+", Colors.amber, 1)





             ],

           ),

           Row(

             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               button("0", Colors.blueGrey, 0),
               button(".", Colors.blueGrey, 1),
               button("=", Colors.blueGrey, 1)





             ],

           ),


         ],
       ),
     )
     ,
   );

  }
  Widget button(String btnTxt, Color color, int num) {
    Container container;

    if(num == 0) {
      container = Container(
          padding: EdgeInsets.only(bottom: 10),
          child: RaisedButton(
            onPressed: () {
              Calculateop(btnTxt);
            },
            child: Text(btnTxt,
                style: TextStyle(
                    fontSize: 30
                )
            ),
            color: color,
            padding: EdgeInsets.only(left:81, top:20, right: 81, bottom: 20),
            shape: StadiumBorder(),
          )
      );
    } else {
      container = Container(
          padding: EdgeInsets.only(bottom: 10),
          child: RaisedButton(
            onPressed: () {
           Calculateop(btnTxt);
            },
            child: Text(btnTxt,
                style: TextStyle(
                    fontSize: 30
                )
            ),
            color: color,
            padding: EdgeInsets.all(20),
            shape: CircleBorder(),
          )
      );
    }
    return container;
  }
  void Calculateop( String txtBtn){
    if(txtBtn=="C"){
      text="0";
      num1=0;
      num2=0;
      result="0";
      finalresult="0";
      Operation='';
      preOperation='';
    }
    else if(Operation=="="&& txtBtn=="+") {
      switch (preOperation) {
        case '+':
          {
            finalresult = Add();
            break;
          }
        case '-':
          {
            finalresult = Sub();
            break;
          }
        case 'x':
          {
            finalresult = Multiply();
            break;
          }
        case '/':
          {
            finalresult = Division();
            break;
          }
      }
    }
    else if(txtBtn=="+"||txtBtn=="-"||txtBtn=="x"||txtBtn=="/"||txtBtn=="="||txtBtn=="%"){
      if(num1==0){

        num1=double.parse(result);

      }
      else{
        num2=double.parse(result);
      }
      switch(Operation){
        case '+':{
          finalresult=Add();
          break;
        }
        case '-':{
          finalresult=Sub();
          break;
        }
        case 'x':{
         finalresult=Multiply();
         break;

        }
        case '/':{
          finalresult=Division();
          break;

        }
        case '%':{

          finalresult=Diciemal();
          break;
        }

      }
      preOperation=Operation;
      Operation=txtBtn;
      result='';
    }

    else if(txtBtn=="."){
      if(!result.contains('.'))
       result= result + '.';
        finalresult=result;

    }
    else if(txtBtn=="+/-"){
      result.startsWith("-") ? result=result.substring(1): result="-"+result;
      finalresult=result;
    }
    else {
      if(result=="0"){
        result=txtBtn;
      }
      else
        result += txtBtn;
        finalresult = result;


    }
    setState(() {
      text=finalresult;
    });
  }
  String Add(){
    result=(num1+num2).toString();
    num1=double.parse(result);
    return result;
  }
  String Sub(){
    result=(num1-num2).toString();
    num1=double.parse(result);
    return result;
  }
  String Multiply(){
    result=(num1*num2).toString();
    num1=double.parse(result);
    return result;
  }
  String Division(){
    result=(num1/num2).toString();
    num1=double.parse(result);
    return result;
  }

  String Diciemal(){
    result=(num1/100).toString();

    return result;
  }
}
