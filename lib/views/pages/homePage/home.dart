import 'package:voice_assistant_with_chatgpt/viewModel/BaseModel.dart';

import '../../../model/utilities/imports/generalImport.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
        viewModelBuilder: () => BaseModel(),
        builder: (context, model, child) =>
            baseUi(children: [], allowBackButton: false));
  }
}
