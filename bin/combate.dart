class Combate {
  int? _vidaUsuario;
  int? _vidaMonstruo;
  int? _ataqueUsuario;
  int? _ataqueMonstruo;

  int? get vidaUsuario => _vidaUsuario;
  int? get vidaMonstruo => _vidaMonstruo;
  int? get ataqueUsuario => _ataqueUsuario;
  int? get ataqueMonstruo => _ataqueMonstruo;

  set vidaUsuario(int? vidaU) {
    _vidaUsuario = vidaU;
  }
  set vidaMonstruo(int? vidaM) {
    _vidaMonstruo = vidaM;
  }
  set ataqueUsuario(int? ataqueU) {
    _ataqueUsuario = ataqueU;
  }
  set ataqueMonstruo(int? ataqueM) {
    _ataqueMonstruo = ataqueM;
  }
}