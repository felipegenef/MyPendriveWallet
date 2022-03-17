import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/input.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants.dart';

class WalletCard extends StatefulWidget {
  const WalletCard({
    Key key,
    this.imageURL = "",
    this.coinName = "",
    this.walletAddress = "",
  }) : super(key: key);
  final String imageURL;
  final String coinName;
  final String walletAddress;

  @override
  State<WalletCard> createState() => _AddWalletCardState();
}

class _AddWalletCardState extends State<WalletCard> {
  final double minQrCodeWidth = 250.0;
  final double minTransferButtonWidth = 70;
  final double minTransferButtonFontSize = 20;
  final double minCoinIconSize = 130;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print(height / 5);
    return Container(
      clipBehavior: Clip.antiAlias,
      height: height,
      width: width,
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(
          vertical: (height / 1.5) / 20, horizontal: (width / 1.1) / 30),
      constraints: BoxConstraints(
        minWidth: width / 1.1,
        maxWidth: width / 1.1,
        minHeight: height / 1.5,
        maxHeight: height / 1.5,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: AssetImage(widget.imageURL),
                height:
                    height / 5 < minCoinIconSize ? minCoinIconSize : height / 5,
              ),
              Text(
                widget.coinName,
                style: const TextStyle(color: WHITE, fontSize: 50),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              QrImage(
                data: widget.walletAddress,
                size: width / 5 < minQrCodeWidth ? minQrCodeWidth : width / 5,
                backgroundColor: WHITE,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: width / 5 < minQrCodeWidth ? minQrCodeWidth : width / 5,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: WHITE),
                child: Text(
                  widget.walletAddress,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: width / 100,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                onPressed: () {},
                child: Column(
                  children: [
                    Image(
                      image: const AssetImage("assets/transfer.png"),
                      height: width / 20 < minTransferButtonWidth
                          ? minTransferButtonWidth
                          : width / 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Transferir",
                      style: TextStyle(
                        color: WHITE,
                        fontSize: width / 70 < minTransferButtonFontSize
                            ? minTransferButtonFontSize
                            : width / 70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
