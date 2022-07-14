// import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:my_pendrive_wallet_desktop/app/Custom/lib/src/easy_loading.dart';
import 'package:my_pendrive_wallet_desktop/app/constants.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateTransactionCard extends StatefulWidget {
  const CreateTransactionCard({
    Key key,
    this.back,
    this.imageUrl,
    this.coinName,
    this.walletAddress,
  }) : super(key: key);
  final String imageUrl;
  final String coinName;
  final String walletAddress;
  final Function back;

  @override
  State<CreateTransactionCard> createState() => _AddWalletCardState();
}

class _AddWalletCardState extends State<CreateTransactionCard> {
  TextEditingController destinyAddressController = TextEditingController();
  FocusNode destinyAddressNode = FocusNode();
  TextEditingController ammountController = TextEditingController();
  FocusNode ammountNode = FocusNode();
  TextEditingController nounceController = TextEditingController();
  FocusNode nounceNode = FocusNode();
  TextEditingController gasPriceController = TextEditingController();
  FocusNode gasPriceNode = FocusNode();
  TextEditingController gasLimmitController = TextEditingController();
  FocusNode gasLimmitNode = FocusNode();
  @override
  void initState() {
    super.initState();
    destinyAddressNode.requestFocus();
  }

  @override
  void dispose() {
    super.dispose();
    destinyAddressNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      // height: height,
      width: width,
      constraints: const BoxConstraints(
        minWidth: 290,
        maxWidth: 750,
        minHeight: 195,
        // maxHeight: 560,
      ),
      // margin: const EdgeInsets.symmetric(horizontal: 60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: TRANSPARENT,
        boxShadow: [
          BoxShadow(
            offset: const Offset(10, 20),
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: height / 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10000),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(5, 20),
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 1,
                ),
              ],
            ),
            child: Image(
              width: 120,
              image: AssetImage(widget.imageUrl),
            ),
          ),
          Text(
            "Transferir " + widget.coinName,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: DARK_BLUE, fontSize: 47, fontWeight: FontWeight.w600),
          ),
          Container(
            height: 0,
            constraints: const BoxConstraints(minHeight: 10),
          ),
          Input(
            controller: destinyAddressController,
            label: "Endereço de destino",
            node: destinyAddressNode,
            onSubmited: () {
              destinyAddressNode.unfocus();
              ammountNode.requestFocus();
            },
          ),
          Container(
            height: 0,
            constraints: const BoxConstraints(minHeight: 10),
          ),
          Input(
            controller: ammountController,
            label: "Quantidade",
            node: ammountNode,
            isNumber: true,
            onSubmited: () {
              ammountNode.unfocus();
              nounceNode.requestFocus();
            },
          ),
          Container(
            height: 0,
            constraints: const BoxConstraints(minHeight: 10),
          ),
          Input(
            controller: nounceController,
            label: "Nounce",
            isNumber: true,
            node: nounceNode,
            onSubmited: () {
              nounceNode.unfocus();
              gasPriceNode.requestFocus();
            },
          ),
          Container(
            height: 0,
            constraints: const BoxConstraints(minHeight: 10),
          ),
          Input(
            controller: gasPriceController,
            label: "Preço do Gas(satochi)",
            node: gasPriceNode,
            isNumber: true,
            onSubmited: () {
              gasPriceNode.unfocus();
              gasLimmitNode.requestFocus();
            },
          ),
          Container(
            height: 0,
            constraints: const BoxConstraints(minHeight: 10),
          ),
          Input(
            controller: gasLimmitController,
            label: "Limite Gas",
            isNumber: true,
            node: gasLimmitNode,
            onSubmited: () {
              gasLimmitNode.unfocus();
            },
          ),
          Container(
            height: 0,
            constraints: const BoxConstraints(minHeight: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: height / 20, bottom: 30, right: 30),
                child: MaterialButton(
                  hoverColor: Colors.transparent,
                  onPressed: () {
                    if (widget.back != null) widget.back();
                  },
                  child: const Text(
                    "Voltar",
                    style: TextStyle(color: LIGHT_BLUE, fontSize: 30),
                  ),
                  height: 60,
                  minWidth: 190,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height / 20, bottom: 30),
                child: MaterialButton(
                  hoverColor: LIGHT_BLUE,
                  onPressed: () {},
                  child: const Text(
                    "Gerar QR",
                    style: TextStyle(color: WHITE, fontSize: 30),
                  ),
                  height: 60,
                  minWidth: 190,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                  color: DARK_BLUE,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
