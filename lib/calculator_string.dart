int add(String input) {
  if (input.isEmpty) return 0;

  String delimiter = ',';
  String numbers = input;

  // Check for custom delimiter
  if (input.startsWith('//')) {
    var parts = input.split('\n');
    delimiter = parts[0].substring(2);
    numbers = parts.sublist(1).join('\n');
  }

  numbers = numbers.replaceAll('\n', delimiter);
  var splitNumbers = numbers.split(delimiter);

  List<int> parsed = [];
  List<int> negatives = [];

  for (var num in splitNumbers) {
    if (num.trim().isEmpty) continue;
    int value = int.parse(num);
    if (value < 0) {
      negatives.add(value);
    }
    parsed.add(value);
  }

  if (negatives.isNotEmpty) {
    throw Exception('negative numbers not allowed ${negatives.join(", ")}');
  }

  return parsed.fold(0, (a, b) => a + b);
}
