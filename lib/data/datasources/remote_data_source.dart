import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/error/exception.dart';
import '../../core/utils/logger.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';
import '../models/brand_model.dart';
import '../models/sub_category_model.dart';

abstract class RemoteDataSource {
  Future<List<CategoryModel>> getCategories();

  Future<List<BrandModel>> getBrands();

  Future<List<ProductModel>> getDealsOfTheDay();

  Future<List<SubCategoryModel>> getSubCategories({required String categoryId});
}

class RemoteDataSourceImpl implements RemoteDataSource {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      List<CategoryModel> categoryList = [];
      await db.collection("categories").get().then((event) {
        for (var doc in event.docs) {
          Logger.log("${doc.id} => ${doc.data()}");
          final categoryModel = CategoryModel.fromJson(doc.data(), doc.id);
          categoryList.add(categoryModel);
        }
      });
      return categoryList;
    } on FirebaseException catch (e) {
      throw ServerException(message: e.message ?? '');
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<BrandModel>> getBrands() async {
    try {
      List<BrandModel> brandList = [];
      QuerySnapshot<Map<String, dynamic>> brandsDocs =
          await db.collection("brands").get();
      for (var doc in brandsDocs.docs) {
        Logger.log("${doc.id} => ${doc.data()}");
        final brandModel = BrandModel.fromJson(doc.data(), doc.id);
        brandList.add(brandModel);
      }
      return brandList;
    } on FirebaseException catch (e) {
      print(e);
      throw ServerException(message: e.message ?? '');
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getDealsOfTheDay() async {
    try {
      List<ProductModel> productList = [];
      QuerySnapshot<Map<String, dynamic>> productDocs =
          await db.collection("deal_of_day").get();
      for (var doc in productDocs.docs) {
        Logger.log("${doc.id} => ${doc.data()}");
        final productModel = ProductModel.fromJson(doc.data(), doc.id);
        productList.add(productModel);
      }
      return productList;
    } on FirebaseException catch (e) {
      print(e);
      throw ServerException(message: e.message ?? '');
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }

  @override
  Future<List<SubCategoryModel>> getSubCategories({required String categoryId}) async {
    try {
      List<SubCategoryModel> subCategoryList = [];
      QuerySnapshot<Map<String, dynamic>> subCategoryDocs = await db
          .collection("sub_categories")
          .where('category_id', isEqualTo: categoryId)
          .get();
      for (var doc in subCategoryDocs.docs) {
        Logger.log("${doc.id} => ${doc.data()}");
        final subCategoryModel = SubCategoryModel.fromJson(doc.data(), doc.id);
        subCategoryList.add(subCategoryModel);
      }
      return subCategoryList;
    } on FirebaseException catch (e) {
      throw ServerException(message: e.message ?? '');
    } catch (e) {
      throw ServerException();
    }
  }
}
