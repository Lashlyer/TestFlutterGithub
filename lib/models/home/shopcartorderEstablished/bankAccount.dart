

class BankAccount {
  String bankNo;
  String accountNo;
  String price;
  String duteDate;

  BankAccount({
  required this.bankNo, 
  required this.price, 
  required this.accountNo, 
  required this.duteDate});


 factory BankAccount.mockup() {
    return BankAccount(
      bankNo: '013 國泰世華銀行', 
      price: '3151',
      accountNo: '123456789', 
      duteDate: '2021/10/03 12:33'
    );
 }
}