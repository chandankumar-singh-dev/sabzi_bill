import 'package:sabzi_bill/config/databases/databases_helper.dart';
import 'package:sabzi_bill/features/controller/customer/customer_repo.dart';
import 'package:sabzi_bill/features/model/customer/customer.dart';
import 'package:sabzi_bill/utils/log/dev_logger.dart';

class CustomerRepoImp extends CustomerRepo {
  final DatabasesHelper db;
  CustomerRepoImp({required this.db});

  @override
  Future<Customer> createCustomer(Customer customer) async {
    int id = await db.insertDataIntoDB(
      table: "customers",
      data: customer.toJson(),
    );
    customer.id = id;
    return customer;
  }

  @override
  Future<int> deleteCustomer(Customer customer) async {
    return await db.deleteById(table: "customers", id: customer.id ?? 0);
  }

  @override
  Future<List<Customer>> getAllCustomer() async {
    final result = await db.getAllData(table: "customers");
    List<Customer> customers = [];
    for (int i = 0; i < result.length; i++) {
      customers.add(Customer.fromJson(result[i]));
    }
    return customers;
  }

  @override
  Future<void> getCustomerDetailsById(int id) {
    // TODO: implement getCustomerDetailsById
    throw UnimplementedError();
  }

  @override
  Future<int> updateCustomer(Customer customer) async {
    devLog(customer.toJson(), "checking problem");
    return await db.updateById(table: "customers", data: customer.toJson());
  }
}
