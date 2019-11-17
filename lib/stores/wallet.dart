import 'package:macvon_flutter/common/credit_card.dart';
import 'package:macvon_flutter/utils/Api.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'wallet.g.dart';

// This is the class used by rest of your codebase
class WalletStore = _WalletStore with _$WalletStore;

// The store-class
abstract class _WalletStore with Store {
  @observable
  dynamic physicalCard;

  @observable
  dynamic physicalCardInfo;

  @observable
  List vcards = [];

  @action
  Future loadVCards() async {
    var allCards = await Api.loadVCards();
    vcards = allCards;
  }

  @action
  Future loadPhysicalCard() async {
    var allCards = await Api.loadVCards();
    vcards = allCards;
    physicalCard = new CreditCardViewModel.fromJson(allCards.first);
  }

  @action
  Future loadPhysicalCardInfo() async {
    var physicalCardInfoJson = await Api.loadPhysicalCard();
    physicalCardInfo = physicalCardInfoJson;
  }
}

final WalletStore walletStore = new WalletStore();
