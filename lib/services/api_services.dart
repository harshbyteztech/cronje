import 'dart:convert';

import 'package:cronje/model/merger_model.dart';
import 'package:dio/dio.dart';

import '../model/calculate_model.dart';
import '../model/document_model.dart';
import '../model/insight_model.dart';
import '../model/member_model.dart';
import '../utils/toast.dart';

class ApiServices {
  static const String base = "https://api.sas.co.na/cronje/rest/v1/";
  static const String member = 'member/';
  static const String document = 'document/';
  static const String calculate = 'calc/';
  static const String contact = 'form';
  static const String insights = 'insights';
  static const String merger = 'merger';

  late final Dio dio;

  Dio getDio() {
    dio = Dio(BaseOptions(
      baseUrl: base,
      connectTimeout: 5000,
      receiveTimeout: 15000,
      headers: {
        'Accept': 'application/json',
      },
      contentType: "application/x-www-form-urlencoded",
    ));
    return dio;
  }

  Future<List<Member>?> getMember() async {
    getDio();
    Response response = await dio.get(member);
    try {
      if (response.statusCode == 200) {
        var getMemberData = response.data as List;
        var listMember = getMemberData.map((i) => Member.fromJson(i)).toList();
        return listMember;
      } else {
        throw Exception('Failed to post.');
      }
    } on DioError catch (e) {
      print(e.response?.statusCode);
      return null;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<DocumentData>?> getDocument() async {
    getDio();
    try {
      Response response = await dio.get(document);
      if (response.statusCode == 200) {
        var getDocumentData = response.data as List;
        var listDocument =
            getDocumentData.map((i) => DocumentData.fromJson(i)).toList();
        return listDocument;
      } else {
        throw Exception('Failed to post.');
      }
    } on DioError catch (e) {
      print(e.response?.statusCode);
      return null;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<InsightsModel>?> getInsights() async {
    getDio();
    try {
      Response response = await dio.get(insights);
      if (response.statusCode == 200) {
        var getInsightsData = response.data as List;
        var listInsights =
        getInsightsData.map((i) => InsightsModel.fromJson(i)).toList();
        return listInsights;
      } else {
        throw Exception('Failed to post.');
      }
    } on DioError catch (e) {
      print(e.response?.statusCode);
      return null;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<CalculateModel?> postCalculate(String name, var data) async {
    getDio();
    try {
      Response response =
          await dio.post(calculate + name, data: jsonEncode(data));
      if (response.statusCode == 200) {
        print("response ${response.data}");
        return CalculateModel.fromJson(response.data);
      } else {
        throw Exception('Failed to post.');
      }
    } on DioError catch (e) {
      print(e.response?.statusCode);
      return null;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<String?> postLease(String name, var data) async {
    getDio();
    try {
      Response response =
          await dio.post(calculate + name, data: jsonEncode(data));
      if (response.statusCode == 200) {
        print("response ${response.data}");
        return response.data["stampduty"].toString();
      } else {
        throw Exception('Failed to post.');
      }
    } on DioError catch (e) {
      print(e.response?.statusCode);
      return null;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<bool?> postContact(var data) async {
    getDio();
    try {
      Response response = await dio.post(contact, data: jsonEncode(data));
      if (response.statusCode == 200) {
        print("response ${response.data}");
        // Toasts.showToast("Email successfully send");
        return true;
      } else {
        throw Exception('Failed to post.');
      }
    } on DioError catch (e) {
      print(e.response?.statusCode);
      return null;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<MergerModel?> postMerger(String name,var data) async {
    getDio();
    try {
      Response response = await dio.post(calculate+name, data: jsonEncode(data));
      if (response.statusCode == 200) {
        print("response ${response.data}");
        // Toasts.showToast("Email successfully send");
        print('Merger_Data = ${response.data}');
        return MergerModel.fromJson(response.data);
      } else {
        throw Exception('Failed to post.');
      }
    } on DioError catch (e) {
      print(e.response?.statusCode);
      return null;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
