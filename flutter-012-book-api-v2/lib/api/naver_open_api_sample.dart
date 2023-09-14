// ignore_for_file: constant_identifier_names
import 'dart:convert';

import 'package:book/models/naver_book_dto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

///
/// Naver 개발자 센터에 어플리케이션을 등록하고 CLIENT_ID 와 CLIENT_SECRET 을 확인하고
/// 아래 항목에 설정한 후 api/naver_open_api_sample.dart 파일을 api/naver_open_api.dart 로 이름 변경 후
/// 프로젝트 시작하기
const CLIENT_ID = "YOUR NAVER CLIENT ID";
const CLIENT_SECRET = "YOUR NAVER CLIENT SECRET";
const NAVER_BOOK_URL = "https://openapi.naver.com/v1/search/book.json";

class NaverOpenAPI {
  /// 누군가 loadBooks() 함수를 호출하면 반드시 데이터를 return 해줄게 라는 약속

  Future<List<NaverBookDTO>> loadBooks([search]) async {
    Map<String, String> headers = {
      "X-Naver-Client-Id": CLIENT_ID,
      "X-Naver-Client-Secret": CLIENT_SECRET
    };
    String query = search ??= "자바";

    // ?변수1=값1&변수2=값2&변수3=값3
    String queryString = Uri(
      queryParameters: {
        "query": query,
        "display": "30",
        "start": "1",
      },
    ).query;
    dynamic response;
    try {
      response = await http.get(
        Uri.parse("$NAVER_BOOK_URL?$queryString"),
        headers: headers,
      );
    } catch (e) {
      debugPrint("http 요청오류");
    }
    if (response?.statusCode == 200) {
      // debugPrint("응답받은 데이터: ${response.body.toString()}");
      Iterable resultItems = await json.decode(response.body)["items"];
      var bookList = resultItems.map((dto) {
        var result = NaverBookDTO.fromJson(dto);
        return result;
      });
      debugPrint(bookList.toString());
      return bookList.toList();
    } else {
      debugPrint("응답 오류 발생: ${response.body.toString()}");
      throw Exception("API 연결 문제 발생");
    }
  }
}
