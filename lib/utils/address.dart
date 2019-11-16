class Address {
  static String BASE_URL = "http://devweb.us-east-2.elasticbeanstalk.com/";

  static String LOGIN = "login";

//  wallet
  static String OWNER_LOAD_ALL_CARDS = 'owner/loadAllCards';
  static String OWNER_PHYSICAL_CARD = 'owner/getPhysicalCard';
  static String OWNER_GET_CARD_INFO = 'owner/getCardInfo';
  static String OWNER_LOAD_VCARDS = 'owner/loadVirtualCard';

//  txn
  static String OWNER_PENGING_CLEAR_TXN = 'owner/pendingAndClearedTransactions';

  // budget
  static String OWNER_ACTIVE_BUDGETS = 'owner/getCompanyActiveBudgets';
}
