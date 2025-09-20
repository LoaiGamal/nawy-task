import 'package:nawy_task/common/network/endpoints.dart';
import 'package:nawy_task/common/network/network.dart';

abstract class CompoundRemote {
  Future<dynamic> getCompoundData();

  Future<dynamic> getAreaData();
}

class CompoundRemoteImpl extends CompoundRemote {
  @override
  Future getCompoundData() {
    return Network().getData(EndPoints.compound);
  }

  @override
  Future getAreaData() {
    return Network().getData(EndPoints.areas);
  }
}
