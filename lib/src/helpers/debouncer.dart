import 'dart:async';

// Creditos
// https://stackoverflow.com/a/52922130/7834829
/*Clase para controlar  */

//Clase que recibe el valor query(_value) y duracíon, para almacenar los
// valores escritos por el usuario en un tiempo determinado.
class Debouncer<T> {
  Debouncer(
      {
      //Tiempo que va durar la ejecunción continua de la clase.
      required this.duration,
      //Método que se dispara cuando se tenga un valor
      this.onValue});

  final Duration duration;

  void Function(T value)? onValue;

  T? _value;
  Timer? _timer;
  //Obtiene el valor de query.
  T get value => _value!;

  //Almacena el valor escrito por el usuario mientras el escribe
  set value(T val) {
    _value = val;
    _timer?.cancel();
    _timer = Timer(duration, () => onValue!(_value!));
  }
}
