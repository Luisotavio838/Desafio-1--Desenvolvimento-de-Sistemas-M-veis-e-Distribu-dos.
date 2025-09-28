import 'package:mobx/mobx.dart';
import '../model/address_model.dart';
import '../service/home_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeService service;

  _HomeControllerBase({required this.service});

  @observable
  bool loading = false;

  @observable
  AddressModel? currentAddress;

  @observable
  ObservableList<AddressModel> history = ObservableList<AddressModel>();

  @observable
  String error = '';

  @action
  Future<void> searchByCep(String cep) async {
    loading = true;
    error = '';
    try {
      final result = await service.fetchByCep(cep);
      if (result == null) {
        error = 'CEP não encontrado';
      } else {
        currentAddress = result;
        history = ObservableList<AddressModel>.of(service.history());
      }
    } catch (e) {
      error = 'Erro na consulta';
    } finally {
      loading = false;
    }
  }

  @action
  void loadHistory() {
    history = ObservableList<AddressModel>.of(service.history());
  }

  @action
  void clearError() => error = '';
}
