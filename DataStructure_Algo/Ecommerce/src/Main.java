public class Main {

    public static void main(String[] args) {

        Product[] products = {
            new Product(101, "Laptop", "Electronics"),
            new Product(102, "Shoes", "Fashion"),
            new Product(103, "Headphones", "Electronics"),
            new Product(104, "Backpack", "Accessories"),
            new Product(105, "Watch", "Fashion")
        };

        int searchId = 104;

        System.out.println("Linear Search Result:");

        Product linearResult =
                SearchService.linearSearch(products, searchId);

        if (linearResult != null) {
            System.out.println(linearResult);
        } else {
            System.out.println("Product not found.");
        }

        System.out.println("\nBinary Search Result:");

        Product binaryResult =
                SearchService.binarySearch(products, searchId);

        if (binaryResult != null) {
            System.out.println(binaryResult);
        } else {
            System.out.println("Product not found.");
        }
    }
}