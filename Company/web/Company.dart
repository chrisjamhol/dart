import 'dart:html';
import 'headquater/Headquarter.dart';

/*void main() {
  query("#text")
    ..text = "Click me!"
    ..on.click.add(reverseText);
}

void reverseText(Event event) {
  var text = query("#text").text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.add(text[i]);
  }
  query("#text").text = buffer.toString();
}*/

void main(){
  print("builing Headquarter....");
  var headquarterChris = new Headquarter();
  print("headquarter build");
}
