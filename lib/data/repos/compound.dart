import 'package:nawy_task/data/remote/compound.dart';
import 'package:nawy_task/models/areas_model.dart';
import 'package:nawy_task/models/compound_model.dart';

abstract class CompoundRepo {
  Future<CompoundModel?> getCompoundData();

  Future<AreasModel?> getAreasData();
}

class CompoundRepoImpl extends CompoundRepo {
  late CompoundRemote _remote;

  CompoundRepoImpl({
    CompoundRemote? remote,
  }) {
    _remote = remote ?? CompoundRemoteImpl();
  }

  @override
  Future<CompoundModel?> getCompoundData() async {
    try {
      final dynamic response = await _remote.getCompoundData();
      final CompoundModel compoundModel = CompoundModel.fromJson(response);
      return compoundModel;
    } catch (e) {
      throw Future<CompoundModel>.error(e);
    }
  }

  @override
  Future<AreasModel?> getAreasData() async{
    try{
      final dynamic response = await _remote.getAreaData();
      final AreasModel areasModel = AreasModel.fromJson(response);
      return areasModel;
    }catch (e) {
      throw Future<CompoundModel>.error(e);
    }
  }
}
