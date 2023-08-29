String sayHello(String? name, int? age, String? nation) {
  return "안녕 $name 야, 당신의 나이는 $age 이고, 고향은 $nation 이야1!";
}

String sayHelloNameParams({String? name, int? age, String? nation}) =>
    "안녕 $name 야, 당신의 나이는 $age 이고, 고향은 $nation 이야";

/// <span name="홍길동", age=33, nation="대한민국" />
/// const Span = ({name, age, nation}) => {return <></>}