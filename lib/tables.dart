class AccountsTable {
  List<int> account_id_column;
  List<String> username_column;
  List<String> name_column;
  List<String> email_column;
  List<String> password_column;
  List<String> latest_city_column;

  AccountsTable(this.account_id_column, this.username_column, this.name_column,
      this.email_column, this.password_column, this.latest_city_column);
}

class MallSearchHistoryTable {
  List<int> search_id_column;
  List<int> account_id_column_foreign_key;
  List<String> mall_name_column;

  MallSearchHistoryTable(this.search_id_column,
      this.account_id_column_foreign_key, this.mall_name_column);
}

class ShopSearchHistoryTable {
  List<int> search_id_column;
  List<int> account_id_column_foreign_key;
  List<String> shop_name_column;

  ShopSearchHistoryTable(this.search_id_column,
      this.account_id_column_foreign_key, this.shop_name_column);
}
