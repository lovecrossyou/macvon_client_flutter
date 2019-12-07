class Address {
  static String BASE_URL = "http://devweb.us-east-2.elasticbeanstalk.com/";

  static String LOGIN = "login";

//  wallet
  static String OWNER_LOAD_ALL_CARDS = '/loadAllCards';
  static String OWNER_PHYSICAL_CARD = '/getPhysicalCard';
  static String OWNER_GET_CARD_INFO = '/getCardInfo';
  static String OWNER_LOAD_VCARDS = '/loadVirtualCard';

//  txn
  static String OWNER_PENGING_CLEAR_TXN = '/pendingAndClearedTransactions';

  // budget
  static String OWNER_ACTIVE_BUDGETS = '/getCompanyActiveBudgets';
  static String getMyActiveMemberBudgets = '/getMyActiveMemberBudgets';
  // user

  static String OWNER_USER_SETTING = '/getUserSetting';


  static String getAvatar = '/getAvatar';
}
