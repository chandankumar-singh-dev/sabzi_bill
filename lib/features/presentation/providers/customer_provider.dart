import 'package:flutter/foundation.dart';
import 'package:sabzi_bill/features/controller/customer/customer_repo.dart';
import 'package:sabzi_bill/features/model/customer/customer.dart';

class CustomerProvider extends ChangeNotifier {
  final CustomerRepo _customerRepo;

  CustomerProvider(this._customerRepo);
  List<Customer> customers = [];

  void createCustomer(Customer customer) async {
    Customer insertCustomer = await _customerRepo.createCustomer(customer);
    customers.add(insertCustomer);
    notifyListeners();
  }

  Future<void> loadCustomerList() async {
    customers = await _customerRepo.getAllCustomer();
    notifyListeners();
  }

  Future<int> updateCustomer(Customer customer) async {
    int result = await _customerRepo.updateCustomer(customer);
    if (result != 0) {
      int index = customers.indexWhere((element) => element.id == customer.id);
      if (index != -1) {
        customers[index] = customer;
        notifyListeners();
      }
    }
    return result;
  }

  Future<int> deleteCustomer(Customer customer) async {
    int result = await _customerRepo.deleteCustomer(customer);
    if (result != 0) {
      customers.removeWhere((element) => element.id == customer.id);
      notifyListeners();
    }
    return result;
  }
}
