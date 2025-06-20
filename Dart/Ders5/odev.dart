import 'dart:io';

void main(List<String> args) {

  stdout.write("Lütfen üçgenin birinci kenarını giriniz: ");
  int kenar1 = int.parse(stdin.readLineSync()!);
  stdout.write("Lütfen üçgenin ikinci kenarını giriniz: ");
  int kenar2 = int.parse(stdin.readLineSync()!);
  stdout.write("Lütfen üçgenin üçüncü kenarını giriniz: ");
  int kenar3 = int.parse(stdin.readLineSync()!);
  if(kenar1 == kenar2 && kenar2 == kenar3){
    print("Üçgenin türü: Eşkenar üçgen");
  }else if(kenar1 == kenar2 || kenar2 == kenar3 || kenar1 == kenar3){
    print("Üçgenin türü: İkizkenar üçgen");
  }else{
    print("Üçgenin türü: Çeşitkenar üçgen");
  }


}