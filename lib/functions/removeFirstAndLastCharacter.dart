
String removeFirstAndLastCharacter(String input) {
  if (input.length <= 1) {
    // Eğer string bir karakterden azsa veya sadece bir karakterse, değiştirmeden döndür.
    return '';
  }
  return input.substring(1, input.length - 1);
}