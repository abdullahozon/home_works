/*
  Abstract Class: Loan
  Create an abstract class Loan with the following properties and methods:
      - borrowerName (String)
      - loanAmount (double)
      - interestRate (double)
      - Abstract method: double calculateMonthlyInstallment(int months).
  Loan Subclasses
  Three types of loans should be implemented:
      - PersonalLoan: Has a fixed 10% interest rate.
      - HomeLoan: Has a base 8% interest rate, but if loanAmount > 500,000, the rate increases to 9.5%.
      - CarLoan: Has a 7% interest rate, but if loanAmount > 50,000, it applies an additional 2% processing fee.
  LoanProcessingSystem Class
  Create a LoanProcessingSystem class that:
      - Stores a list of loans.
      - Provides methods to:
          - applyLoan(Loan loan): Adds a loan application to the system.
          - calculateInstallments(int months): Calculates the monthly installment for all loans
*/
// ملف main.dart

// كلاس مجرد يمثل القرض
abstract class Loan {
  String borrowerName;
  double loanAmount;

  Loan(this.borrowerName, this.loanAmount);

  double calculateMonthlyInstallment(int months);
}

// فائدة 10%
class PersonalLoan extends Loan {
  PersonalLoan(String borrowerName, double loanAmount)
    : super(borrowerName, loanAmount);

  @override
  double calculateMonthlyInstallment(int months) {
    double totalWithInterest = loanAmount + (loanAmount * 10 / 100);
    return totalWithInterest / months;
  }
}

// فائدة 8%، وإذا المبلغ أكبر من 500,000 تصير 9.5%
class HomeLoan extends Loan {
  HomeLoan(String borrowerName, double loanAmount)
    : super(borrowerName, loanAmount);

  @override
  double calculateMonthlyInstallment(int months) {
    double ggg = loanAmount > 500000 ? 9.5 : 8.0;
    double totalWithInterest = loanAmount + (loanAmount * ggg / 100);
    return totalWithInterest / months;
  }
}

// فائدة 7%، وإذا المبلغ أكبر من 50,000 نضيف رسوم 2%
class CarLoan extends Loan {
  CarLoan(String borrowerName, double loanAmount)
    : super(borrowerName, loanAmount);

  @override
  double calculateMonthlyInstallment(int months) {
    double totalWithInterest = loanAmount + (loanAmount * 7 / 100);

    if (loanAmount > 50000) {
      // رسوم معالجة 2%
      totalWithInterest += loanAmount * 0.02;
    }

    return totalWithInterest / months;
  }
}

// نظام إدارة القروض
class LoanProcessingSystem {
  List<Loan> loans = [];

  void applyLoan(Loan loan) {
    loans.add(loan);
  }

  void calculateInstallments(int months) {
    double sum = 0;
    for (var loan in loans) {
      double installment = loan.calculateMonthlyInstallment(months);
      print(
        'الاسم: ${loan.borrowerName} - القسط الشهري لمدة $months شهر: ${installment.toStringAsFixed(2)}',
      );
      sum += installment;
      print('مجموع القروض: $sum');
    }
  }
}

// برنامج تجريبي للتجربة
void main() {
  LoanProcessingSystem system = LoanProcessingSystem();

  // تقديم طلبات قروض
  system.applyLoan(PersonalLoan("أحمد", 20000));
  system.applyLoan(HomeLoan("سارة", 600000));
  system.applyLoan(CarLoan("خالد", 70000));

  // حساب الأقساط الشهرية لمدة 12 شهر
  system.calculateInstallments(12);
}
