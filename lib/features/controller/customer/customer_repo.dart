import 'package:sabzi_bill/features/model/customer/customer.dart';

abstract class CustomerRepo {
  Future<Customer> createCustomer(Customer customer);
  Future<int> updateCustomer(Customer customer);
  Future<int> deleteCustomer(Customer customer);
  Future<void> getCustomerDetailsById(int id);
  Future<List<Customer>> getAllCustomer();
}
