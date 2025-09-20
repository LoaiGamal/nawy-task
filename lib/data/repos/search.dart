import 'package:nawy_task/data/remote/search.dart';
import 'package:nawy_task/models/filters_options_model.dart';
import 'package:nawy_task/models/search_result_model.dart';

abstract class SearchRepo {
  Future<FiltersOptionsModel?> getFiltersOptions();

  Future<List<SearchItemModel>?> getSearchResults();
}

class SearchRepoImpl extends SearchRepo {
  late SearchRemote _remote;

  SearchRepoImpl({
    SearchRemote? remote,
  }) {
    _remote = remote ?? SearchRemoteImpl();
  }

  @override
  Future<FiltersOptionsModel?> getFiltersOptions() async {
    try {
      final dynamic response = await _remote.getFiltersOptions();
      final FiltersOptionsModel filtersOptionsModel =
          FiltersOptionsModel.fromJson(response);
      return filtersOptionsModel;
    } catch (e) {
      throw Future<FiltersOptionsModel>.error(e);
    }
  }

  @override
  Future<List<SearchItemModel>?> getSearchResults() async {
    try {
      final dynamic response = await _remote.getSearchResults();
      final SearchResultModel searchResultModel =
          SearchResultModel.fromJson(response);
      final List<SearchItemModel>? searchResults = searchResultModel.values;
      return searchResults;
    } catch (e) {
      throw Future<List<SearchItemModel>>.error(e);
    }
  }
}
