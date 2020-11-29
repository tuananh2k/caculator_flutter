import 'package:caculator_flutter/Math.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  //state không thể thay đổi state
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: new Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  //state có thể thay đổi state
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  Math math = new Math();

  Widget btn(btnText, Color color) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0), //thụt lề dưới 10 pixel
      child: RaisedButton( //loại button bấm nổi
          child: Text(
            btnText, //chọn đối tượng text chịu ảnh hưởng
            style: TextStyle(fontSize: 30),
          ),
          onPressed: () { // giống actionListener trong javaswing
            setState(() {
              math.callBack(btnText); //gọi hàm xử lí khi có action
            });
          },
          color: color,
          padding: EdgeInsets.all(20.0),
          // căn lề all 22 pixel
          shape: CircleBorder()
      ),
    );
  }

  Widget btnZero(btnText, Color color) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: RaisedButton(
        child: Text(
          btnText,
          style: TextStyle(fontSize: 30),
        ),
        onPressed: () {
          setState(() {
            math.callBack(btnText);
          });
        },
        color: color,
        padding: EdgeInsets.only(left: 83, top: 21, right: 83, bottom: 21),
        //xét kích thước cho button
        shape: StadiumBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Container(
        // margin: EdgeInsets.only(bottom: 20.0), //ko gian trống bao quanh thẻ
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.end, // bàn phím ở hàng cuối cùng
          children: <Widget>[
            Container(
              child: Text(math.getHistory(),
                  style: TextStyle(fontSize: 50, color: Colors.white60),
                  maxLines: 1),
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(bottom: 20, right: 20),
            ),
            Container(
              child: Text(math.getExpression(),
                style: TextStyle(fontSize: 80,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(bottom: 20, right: 20),
            ),
            new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //chia đều khoảng cách giữa có button
                children: [
                  btn('C', Colors.white70),
                  btn('+/-', Colors.white70),
                  btn('%', Colors.white70),
                  btn(':', Colors.orange)
                ]),
            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  btn('7', Colors.white),
                  btn('8', Colors.white),
                  btn('9', Colors.white),
                  btn('x', Colors.orange)
                ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              btn('4', Colors.white),
              btn('5', Colors.white),
              btn('6', Colors.white),
              btn('-', Colors.orange),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              btn('1', Colors.white),
              btn('2', Colors.white),
              btn('3', Colors.white),
              btn('+', Colors.orange),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              btnZero('0', Colors.white),
              btn('.', Colors.white),
              btn('=', Colors.orange)
            ])
          ],
        ),
      ),
    );
  }

}
