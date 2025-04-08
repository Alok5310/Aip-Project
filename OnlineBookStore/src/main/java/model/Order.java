package model;

public class Order {
    private int id;
    private int userId;
    private int bookId;
    private int quantity;
    private double totalPrice;
    private String orderDate;
    private String bookTitle; // ✅ To display book name in order.jsp

    // 🔹 Default Constructor
    public Order() {}

    // 🔹 Parameterized Constructor
    public Order(int id, int userId, int bookId, int quantity, double totalPrice, String orderDate, String bookTitle) {
        this.id = id;
        this.userId = userId;
        this.bookId = bookId;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.orderDate = orderDate;
        this.bookTitle = bookTitle;
    }

    // 🔹 Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getBookId() { return bookId; }
    public void setBookId(int bookId) { this.bookId = bookId; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }

    public String getOrderDate() { return orderDate; }
    public void setOrderDate(String orderDate) { this.orderDate = orderDate; }

    public String getBookTitle() { return bookTitle; }
    public void setBookTitle(String bookTitle) { this.bookTitle = bookTitle; }

    // 🔹 toString() method for debug
    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", userId=" + userId +
                ", bookId=" + bookId +
                ", quantity=" + quantity +
                ", totalPrice=" + totalPrice +
                ", orderDate='" + orderDate + '\'' +
                ", bookTitle='" + bookTitle + '\'' +
                '}';
    }
}
