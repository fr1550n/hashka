import 'data_providers/data_providers.dart';

/// Wraps various data providing services, sources
class Repo {

  CloudDataProvider colourFunction;

  Future<String> getColour() async {
    if (colourFunction == null) {
      colourFunction = await CloudDataProvider.create(CloudFunction.RANDOM_COLOUR);
    }
    return colourFunction.execute();
  }
}