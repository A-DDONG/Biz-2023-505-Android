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
  /// loadBooks() 함수에 search 매개변수를 설정한다. 이때 search 함수는 []로 묶어서 설정한다
  /// []로 묶인 매개변수는 선택적이다. 함수에 매개변수가 설정되면, 그값을 반드시 파라메터로 전달해야 하는데
  /// []로 묶인 매개변수는 값을 전달하지 않아도 실행이 가능하다
  /// 매개변수의 type 을 설정하지 않았기 때문에 dynamic type이 되고 null 을 포함하여 어떤 데이터든지 받을 수 있다

  /// Naver OpenAPI 에 데이터를 요청하기 위하여
  /// 허가받은 Token(Ticket)을 http의 Headers 항목에 실어서 보내야한다
  Future<List<NaverBookDTO>> loadBooks([search]) async {
    Map<String, String> headers = {
      "X-Naver-Client-Id": CLIENT_ID,
      "X-Naver-Client-Secret": CLIENT_SECRET
    };

    /// Naver 에 도서정보를 요청할때 반드시 요청하는 검색 키워드가 필요하다
    /// 만약 키워드가 없으면(blank, null)은 요청을 거부한다
    /// Naver 에 요청할 검색 키워드를 query 라는 변수에 생성하는데
    /// 검색어가 없으면(search 가 null 이면) 임의로 "자바"라는 문자열로 설정한다
    /// const 변수 = 변수1 || 변수2 || 변수3 || "자바"
    String query = search ??= "자바";

    // ?변수1=값1&변수2=값2&변수3=값3
    // String qString = "query=$query&display=20&start=1";
    // var uri = Uri(
    //   queryParameters: {
    //     "query": query,
    //     "display": "30",
    //     "start": "1",
    //   },
    // );
    // Naver 에 요청할 변수를 완성
    // String queryString = uri.query;
    String queryString = Uri(
      queryParameters: {
        "query": query,
        "display": "30",
        "start": "1",
      },
    ).query;
    // Naver 가 정상적으로 데이터를 응답하면 그 응답한 http 정보를 수신하여 저장할 변수
    dynamic response;

    try {
      response = await http.get(
        Uri.parse("$NAVER_BOOK_URL?$queryString"),
        headers: headers,
      );
    } catch (e) {
      debugPrint("http 요청오류");
    }
    // Naver로부터 정상적인 데이터를 보낸다는 응답이 있으면
    if (response?.statusCode == 200) {
      // debugPrint("응답받은 데이터: ${response.body.toString()}");

      // 수신한 http 정보에서 body만 추출하여 실제 json type 의 데이터로 변환하기
      // 이때 jsonDecode() 함수를 사용하지 않도록 주의
      // var resultJson = await json.decode(response.body);
      // 변환된 json 데이터중에서 items 항목이 가지고있는 부분을 추출하여
      // Iterable(List type)으로 변환한다
      // Iterable resultItems = resultJson["items"];

      Iterable resultItems = await json.decode(response.body)["items"];

      // 변환된 Iterable type 의 데이터들을 map()함수를 사용하여 forEach 하고
      // 각 list 의 item 을 Dto 의 fromJson() 함수를 통하여 Dto 객체로 변환하고 리스트로 묶기
      // Json 배열 데이터를 List<Dto> 형식으로 바꾼다
      // var bookList = resultItems.map((item) {
      //   var result = NaverBookDTO.fromJson(dto);
      //   return result;
      // });

      var bookList = resultItems.map((dto) {
        var result = NaverBookDTO.fromJson(dto);
        return result;
      });
      debugPrint(bookList.toString());
      // 화면에 그리기 위하여 return 하기, 이때 리스트 데이터는 Future<List<NaverBookDto>> 형식으로 변환된다
      return bookList.toList();
    } else {
      debugPrint("응답 오류 발생: ${response.body.toString()}");
      throw Exception("API 연결 문제 발생");
    }
  }
}
