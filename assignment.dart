void main() {
  // List of item prices in the cart
  List<double> itemPrices = [12.99, 8.49, 15.99, 23.75, 6.49];

  // Threshold for filtering low-priced items
  double priceThreshold = 10.0;

  // Step 1: Filter items using an anonymous function
  List<double> filteredPrices = itemPrices.where((price) => price >= priceThreshold).toList();
  print("Filtered items (above \$$priceThreshold): $filteredPrices");

  // Step 2: Apply discount using a higher-order function
  double discountPercentage = 10; // 10% discount
  List<double> discountedPrices = applyDiscount(filteredPrices, (price) => price * (1 - discountPercentage / 100));
  print("Prices after applying $discountPercentage% discount: $discountedPrices");

  // Step 3: Calculate total price with optional tax
  double totalPrice = calculateTotal(discountedPrices, tax: 0.05); // 5% tax
  print("Total price after tax: \$$totalPrice");

  // Step 4: Apply special discount using recursive factorial-based discount
  int numberOfItems = discountedPrices.length;
  double factorialDiscount = calculateFactorialDiscount(numberOfItems);
  print("Factorial discount for $numberOfItems items: $factorialDiscount%");

  // Apply factorial discount
  double finalPrice = totalPrice * (1 - factorialDiscount / 100);
  print("Final price after factorial discount: \$$finalPrice");
}

// Function to calculate total price with optional tax
double calculateTotal(List<double> prices, {double tax = 0}) {
  double subtotal = prices.reduce((a, b) => a + b);
  return subtotal * (1 + tax);
}

// Higher-order function to apply a discount
List<double> applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.map((price) => discountFunction(price)).toList();
}

// Recursive function to calculate a factorial-based discount
double calculateFactorialDiscount(int n) {
  if (n <= 1) return 1;
  return n * calculateFactorialDiscount(n - 1);
}
