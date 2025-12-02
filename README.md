#  Simple Note App - Ứng dụng Ghi chú Đơn giản

Tuần 5 - Đoàn Minh Quân - Ứng dụng Flutter quản lý ghi chú cá nhân với đầy đủ chức năng CRUD và lưu trữ cơ sở dữ liệu.


##  Chức năng Chính

### Quản lý Ghi chú
- **Tạo mới**: Thêm ghi chú với tiêu đề và nội dung
- **Xem danh sách**: Hiển thị tất cả ghi chú được sắp xếp theo thời gian
- **Chỉnh sửa**: Cập nhật nội dung ghi chú đã có
- **Xóa**: Xóa ghi chú với hộp thoại xác nhận


- **Tìm kiếm**: Tìm kiếm ghi chú theo tiêu đề hoặc nội dung
- **Thời gian**: Theo dõi thời gian tạo và cập nhật
- **Lưu trữ**: Dữ liệu được lưu vĩnh viễn trong SQLite
- **Đồng bộ**: Giao diện tự động cập nhật khi có thay đổi



### Core Technologies
- **Flutter 3.9.2+**: Framework phát triển đa nền tảng
- **Dart**: Ngôn ngữ lập trình chính
- **SQLite**: Cơ sở dữ liệu cục bộ
- **Material Design 3**: Hệ thống thiết kế UI


  final DateTime updatedAt;
}
```

####  Database Layer  
- **DBHelper**: Singleton pattern quản lý SQLite
- **StorageService**: Abstract interface hỗ trợ đa nền tảng
- Tự động chuyển đổi giữa SQLite (mobile) và SharedPreferences (web)



##  Hướng dẫn Cài đặt & Chạy

### Yêu cầu Hệ thống
- Flutter SDK ≥ 3.9.2
- Dart SDK ≥ 3.0.0
- Android Studio / VS Code
- Git

### Bước 1: Clone Repository
```bash
git clone https://github.com/Awac8989/week5_doanminhquan.git
cd week5_doanminhquan
```

### Bước 2: Cài đặt Dependencies
```bash
flutter pub get
```

### Bước 3: Chạy Ứng dụng


##  Hướng dẫn Sử dụng

###  Tạo Ghi chú Mới
1. Nhấn nút **"New Note"** (biểu tượng  màu tím)
2. Nhập tiêu đề trong ô đầu tiên
3. Nhập nội dung ghi chú
4. Nhấn nút **"Save"** hoặc biểu tượng 

### Xem & Chỉnh sửa
1. Nhấn vào bất kỳ ghi chú nào trong danh sách
2. Chỉnh sửa tiêu đề hoặc nội dung
3. Nhấn **"Save"** để lưu thay đổi
4. Sử dụng nút **"Back"** để hủy thay đổi

###  Xóa Ghi chú
1. Nhấn biểu tượng **thùng rác** (🗑️) trên mỗi ghi chú
2. Xác nhận xóa trong hộp thoại
3. Ghi chú sẽ được xóa vĩnh viễn

### Tìm kiếm
- Sử dụng thanh tìm kiếm ở đầu màn hình
- Tìm kiếm theo tiêu đề hoặc nội dung ghi chú
- Nhấn **** để xóa từ khóa tìm kiếm

### Làm mới Dữ liệu
- Kéo xuống (pull-to-refresh) để tải lại danh sách
- Dữ liệu tự động đồng bộ khi có thay đổi




###  Responsive Design
- **Mobile**: Optimized cho điện thoại
- **Tablet**: Layout mở rộng cho màn hình lớn  
- **Desktop**: Hỗ trợ mouse và keyboard
- **Web**: PWA-ready với responsive breakpoints

### Feedback & Notifications
- **SnackBar**: Thông báo trạng thái (lưu, xóa, lỗi)
- **Loading**: Hiển thị tiến trình khi xử lý
- **Dialogs**: Xác nhận các thao tác quan trọng
- **Empty States**: Hướng dẫn khi chưa có dữ liệu


###  Data Management
- **Persistence**: SQLite cho mobile
- **Validation**: Kiểm tra input trước khi lưu
- **Backup**: Dữ liệu được lưu an toàn cục bộ
- **Migration**: Hỗ trợ update database schema

##  Kiến thức Đạt được

### Flutter Concepts
- State Management với Provider
- Navigation và Routing
- Database integration (SQLite)
- Cross-platform development
- Material Design implementation

###  Architecture Patterns
- MVC pattern
- Singleton pattern (Database)
- Observer pattern (Provider)
- Repository pattern
- Separation of concerns

### Data Persistence  
- SQLite database operations
- CRUD implementations
- Data modeling và serialization
- Platform-specific storage solutions

<img width="448" height="841" alt="Screenshot 2025-12-02 141232" src="https://github.com/user-attachments/assets/d3669a73-d6b0-45b3-b223-c456dc3abf3f" />
<img width="392" height="835" alt="Screenshot 2025-12-02 141244" src="https://github.com/user-attachments/assets/1d15794e-b8f3-4f53-a7d2-fd685603614d" />
