import 'package:ingogo/data/remote/colours_api_imp.dart';
import 'package:ingogo/data/repositories/colours_repository_imp.dart';
import 'package:ingogo/domain/remote/colours_api.dart';
import 'package:ingogo/domain/repositories/colours_repository.dart';
import 'package:ingogo/domain/usecases/get_colours_list_use_case.dart';
import 'package:ingogo/helpers/api_helper.dart';
import 'package:ingogo/helpers/api_helper_imp.dart';
import 'package:ingogo/presentation/colors_list_view_model.dart';
import 'package:ingogo/utils/app_utils.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class DIComponents {
  static List<SingleChildWidget> inject() {
    return [

      //API and DB
      Provider<IApiHelper>(
        create: (_) => ApiHelper(),
      ),

      //Data remote injections
      Provider<IColourAPI>(
        create: (context) =>
            ColourAPI(injectProvider(context, listen: false)),
      ),
      //End data remote injections

      //Repositories injections
      Provider<IColoursRepository>(
        create: (context) =>
            ColoursRepository(injectProvider(context, listen: false)),
      ),
      //End repositories injections

      //Use cases injections
      Provider(
        create: (context) =>
            GetColoursListUseCase(injectProvider(context, listen: false)),
      ),
      //End use cases injections

      //ViewModels injections
      ChangeNotifierProvider(
          create: (context) =>
              ColorsListViewModel(
                  injectProvider(context, listen: false))),
      //End ViewModels injections
    ];
  }
}
