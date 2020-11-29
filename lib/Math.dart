import 'package:math_expressions/math_expressions.dart';

class Math {
  String _his = '';
  String _exp = '';
  bool haveResult = false;

  String cutNumber0(String result) { //loại bỏ số 0 nếu có .0
    if (result.toString().contains('.')) {// kiem tra xem co dau '.' ko?
      List<String> splitDecimal = result.toString().split('.'); //cat thanh mang[2] phan tu
      if (!(int.parse(splitDecimal[1]) > 0)) // neu sau dau '.' <=0
        return result = splitDecimal[0].toString();
    }
    return result;
  }

  void callBack(String btn) {
    if (btn == 'C') {//nếu ấn nút C
      _his = '';
      _exp = '';
    } else if (btn == '=') {// nếu ấn = thì bắt đầu tính toán
      _exp = _exp.replaceAll('x', '*');
      _exp = _exp.replaceAll(':', '/');
      Parser p = Parser(); //phân tích biểu thức
      Expression exp = p.parse(_exp);
      ContextModel cm = ContextModel();
      _exp = _exp.replaceAll('*', 'x');
      _exp = _exp.replaceAll('/', ':');
      _his = _exp;
      _exp = exp.evaluate(EvaluationType.REAL, cm).toString();
      haveResult = true;
    } else if(btn == "+/-"){ //neu an vao nut '+/-'
        if(_exp.toString().startsWith('-')){
          _exp = _exp.toString().substring(1); //bo ki tu dau tien
        } else
          _exp = '-' + _exp;
    } else if(btn == '%'){
      double tmp = double.parse(_exp);
      _exp = (tmp/100).toString();
    }
    else {// cac truong hop con lai (số + dấu)
      if(haveResult){
        if(btn=='0'||btn=='1'||btn=='2'||btn=='3'||btn=='4'||btn=='5'||btn=='6'||btn=='7'||btn=='8'||btn=='9'){
          _exp = '';
          _his = '';
        }
      }
      haveResult = false;
      _exp += btn;
    }
    _exp = cutNumber0(_exp); //gọi hàm bỏ số 0 nếu thừa
  }

  String getHistory() {
    return _his;
  }

  String getExpression() {
    return _exp;
  }
}
