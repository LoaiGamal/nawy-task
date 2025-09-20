import 'package:nawy_task/common/network/endpoints.dart';
import 'package:nawy_task/common/network/network.dart';

abstract class SearchRemote {
  Future<dynamic> getFiltersOptions();

  Future<dynamic> getSearchResults();
}

class SearchRemoteImpl extends SearchRemote {
  @override
  Future getSearchResults() {
    return Network().getData(EndPoints.search);
  }

  @override
  Future getFiltersOptions() {
    return Network().getData(EndPoints.filterOptions);
  }
}
