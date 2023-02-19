import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ingogo/domain/models/color_model.dart';
import 'package:ingogo/helpers/socket_helper.dart';
import 'package:ingogo/helpers/socket_helper_imp.dart';
import 'package:ingogo/navigation/navigation.dart';
import 'package:ingogo/presentation/colors_list_view_model.dart';
import 'package:ingogo/resources/dimensions.dart';
import 'package:ingogo/resources/strings.dart';
import 'package:ingogo/utils/app_enums.dart';
import 'package:ingogo/utils/app_utils.dart';
import 'package:ingogo/widgets/buttons/primary_button.dart';
import 'package:ingogo/widgets/placeholders/colours_list_placeholder.dart';
import 'package:ingogo/widgets/structure/custom_app_bar_widget.dart';
import 'package:ingogo/widgets/structure/custom_scaffold.dart';
import 'package:ingogo/widgets/structure/horizontal_divider.dart';

class ColorsListScreen extends StatefulWidget {
  const ColorsListScreen({Key? key}) : super(key: key);

  @override
  State<ColorsListScreen> createState() => _ColorsListScreenState();
}

class _ColorsListScreenState extends State<ColorsListScreen> with WidgetsBindingObserver {

  late ColorsListViewModel _viewModel;
  bool _requestAPICalls = false;
  bool _callApiWhenResume = false;
  final ValueNotifier<int> _listLength = ValueNotifier<int>(0);
  final ISocketHelper _socket = SocketHelper();
  ColourListLayoutAlignment _nextLayout = ColourListLayoutAlignment.top;

  //Region override

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
      //Re-init socket when resumed
        _initSocket();
        //Check if was calling api when sent to background, if yes start to call again
        if (_callApiWhenResume) {
          _performAPICall();
        }
        _callApiWhenResume = false;
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
      //Prepare flag to call api again when app is resumed
        _callApiWhenResume = _requestAPICalls;
        //Shutdown calls to save resources
        _changeAPICallsState(callApi: false);
        _socket.disconnectSocket();
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void initState() {
    _createFirstRandomLayout();
    WidgetsBinding.instance.addObserver(this);
    _initSocket();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _viewModel = injectProvider(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  //End region override

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBarWidget(
        showBackButton: false,
        title: Strings.coloursListScreenTitle,),
      child: Column(children: [
        ValueListenableBuilder<int>(
          builder: (BuildContext context, int value, Widget? child) {
            // This builder will only get called when the _listLength is updated.
            return Expanded(child: ListView.separated(
                itemCount: _viewModel.coloursList.length,
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.defaultMargin),
                separatorBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: HorizontalDivider(),
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  ColorModel color = _viewModel.coloursList[index];
                  return ColoursListPlaceHolder(
                    onClick: () {
                      _openDetailsScreen(color);
                    },
                    colorModel: color,
                  );
                }));
          },
          valueListenable: _listLength,
        ),
        Padding(
          padding: const EdgeInsets.all(Dimensions.defaultMargin),
          child: Row(children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: PrimaryButton(text: Strings.start, onPressed: () {
                if (!_requestAPICalls) {
                  _performAPICall();
                }
              }),
            )),
            Expanded(
                child: PrimaryButton(
                    text: Strings.stop, isSolidColor: false, onPressed: () {
                  _changeAPICallsState(callApi: false);
                })),
          ],),
        )
      ],),);
  }

  //Used to set the first layout randomly
  void _createFirstRandomLayout() {
    int index = AppUtils.getIntBetweenRange(1, 3);
    switch (index) {
      case 1:
        _nextLayout = ColourListLayoutAlignment.top;
        break;
      case 2:
        _nextLayout = ColourListLayoutAlignment.left;
        break;
      default :
        _nextLayout = ColourListLayoutAlignment.right;
        break;
    }
  }


  ColourListLayoutAlignment _getNextLayout() {
    switch (_nextLayout) {
      case ColourListLayoutAlignment.top:
        _nextLayout = ColourListLayoutAlignment.left;
        break;
      case ColourListLayoutAlignment.left:
        _nextLayout = ColourListLayoutAlignment.right;
        break;
      case ColourListLayoutAlignment.right:
        _nextLayout = ColourListLayoutAlignment.top;
        break;
    }

    return _nextLayout;
  }

  void _openDetailsScreen(ColorModel colorModel) {
    NavigationUtils.openColorDetailsScreen(context, colorModel: colorModel);
  }

  void _performAPICall() {
    _changeAPICallsState(callApi: true);
    _callGetColoursList();
  }

  void _changeAPICallsState({required bool callApi}) {
    _requestAPICalls = callApi;
  }

  //This method will be called recursively
  void _repeatCalls() {
    AppUtils.performActionWithDelay(() {
      if (_requestAPICalls && mounted) {
        _callGetColoursList();
      }
    }, delayInMs: AppUtils.getIntBetweenRange(10, 20) * 1000);
  }

  //Socket region

  void _initSocket() {
    _socket.connectSocket(onMessage: (value) {
      AppUtils.printInfo('Colour received $value');
      List<ColorModel>? colourList = (jsonDecode(value) as List?)?.map((i) =>
          ColorModel.fromJson(i)).toList();
      if (colourList?.isNotEmpty == true) {
        for (var element in colourList!) {
          element.layout = _getNextLayout();
        }
        _viewModel.addColour(colourList);
        _listLength.value = _viewModel.coloursList.length;
      }
    });
  }

  void _emmitEvent(List<ColorModel>? colours) {
    AppUtils.printInfo('Sending event');
    _socket.emit(jsonEncode(colours));
  }

  //End socket region

  //Network calls region

  void _callGetColoursList() {
    _viewModel.getColoursList(
        AppUtils.getResponseHandler(context, onSuccess: (response) {
          if (mounted) {
            _emmitEvent(response.data);
          }
        }));
    _repeatCalls();
  }

  //End network calls region
}
