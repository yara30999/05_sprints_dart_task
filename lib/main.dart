class BankAccount {
  String accountId;
  double balance;

  BankAccount(this.accountId, this.balance);

  BankAccount.withZeroBalance(this.accountId) : balance = 0;

  void withdraw(double amount) {
    if (amount <= 0) {
      print('Error: Withdrawal amount must be positive');
      return;
    }

    if (amount > balance) {
      print('Error: Insufficient balance');
      return;
    }

    balance -= amount;
    print('You withdraw only \$$amount');
  }

  void deposit(double amount) {
    if (amount <= 0) {
      print('Error: Deposit amount must be positive');
      return;
    }

    balance += amount;
    print('You diposit only  \$$amount');
  }

  void displayAccountInfo() {
    print('Account ID: $accountId');
    print('Balance: \$$balance');
  }
}

void main() {
  var account1 = BankAccount('user1', 2000.0);
  var account2 = BankAccount.withZeroBalance('user2');

  print('Initial Account States:');
  account1.displayAccountInfo();
  print('---------------------------------');
  account2.displayAccountInfo();
  print('#################################');

  print('Testing Account 1:');
  print('Testing Deposits:');
  account1.deposit(1000.0);
  account1.deposit(-100.0); // Invalid deposit
  account1.displayAccountInfo();
  print('---------------------------------');

  print('Testing Withdrawals:');
  account1.withdraw(300.0);
  account1.withdraw(3000.0); // Insufficient balance
  account1.withdraw(-50.0); // Invalid withdrawal
  account1.displayAccountInfo();
  print('#################################');

  print('Testing Account 2:');
  account1.withdraw(3000.0); // Insufficient balance
  account2.deposit(1000.0);
  account2.withdraw(500.0);
  account1.withdraw(-100.0); // Invalid withdrawal
  account2.displayAccountInfo();
}
