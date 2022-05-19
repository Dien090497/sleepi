import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/presentation/screens/setting_activation_code/widgets/container_box_widget.dart';

class ActivationCodeList extends StatelessWidget {
  const ActivationCodeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerBoxWidget(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child:  ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (BuildContext context,int index){
            return ListTile(
              leading: SFText(keyText: "${index + 1}", style: TextStyles.black15Italic,),
              title: SFText(keyText: "41251029", style: TextStyles.bold16GreyItalic, textAlign: TextAlign.center,),
              subtitle: SFText(keyText: "22/04 15:25", style: TextStyles.grey14Italic, textAlign: TextAlign.center),
              trailing: SFText(keyText: "Used", style: TextStyles.bold16blackItalic,),
            );
          }
      ),
    );
  }
}
