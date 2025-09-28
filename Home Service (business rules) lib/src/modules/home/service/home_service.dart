import '../repositories/viacep_repository.dart';
import '../repositories/local_repository.dart';
import '../model/address_model.dart';

class HomeService {
  final ViacepRepository viacepRepository;
  final LocalRepository localRepository;

  HomeService({
    required this.viacepRepository,
    required this.localRepository,
  });

  Future<AddressModel?> fetchByCep(String cep) async {
    final address = await viacepRepository.getAddressByCep(cep);
    if (address != null) {
      await localRepository.save(address);
    }
    return address;
  }

  Future<List<AddressModel>> search(String uf, String city, String street) async {
    final results = await viacepRepository.searchByAddress(uf, city, street);
    // opcional: salvar resultados no local
    return results;
  }

  List<AddressModel> history() => localRepository.getAll();

  AddressModel? last() => localRepository.getLast();
}
