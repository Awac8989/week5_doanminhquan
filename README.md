# 📱 Simple Note App - Ứng dụng Ghi chú Đơn giản

Tuần 5 - Đoàn Minh Quân - Ứng dụng Flutter quản lý ghi chú cá nhân với đầy đủ chức năng CRUD và lưu trữ cơ sở dữ liệu.

## 🎯 Mục tiêu Dự án

Xây dựng một ứng dụng Flutter hoàn chỉnh với:
- ✅ Chức năng CRUD đầy đủ (Create, Read, Update, Delete)
- ✅ Lưu trữ dữ liệu vĩnh viễn với SQLite
- ✅ Quản lý trạng thái với Provider pattern
- ✅ Giao diện người dùng thân thiện và responsive
- ✅ Hỗ trợ đa nền tảng (Android, iOS, Web, Windows)

## 🚀 Chức năng Chính

### 📝 Quản lý Ghi chú
- **Tạo mới**: Thêm ghi chú với tiêu đề và nội dung
- **Xem danh sách**: Hiển thị tất cả ghi chú được sắp xếp theo thời gian
- **Chỉnh sửa**: Cập nhật nội dung ghi chú đã có
- **Xóa**: Xóa ghi chú với hộp thoại xác nhận

### 🔍 Tính năng Bổ sung
- **Tìm kiếm**: Tìm kiếm ghi chú theo tiêu đề hoặc nội dung
- **Thời gian**: Theo dõi thời gian tạo và cập nhật
- **Lưu trữ**: Dữ liệu được lưu vĩnh viễn trong SQLite
- **Đồng bộ**: Giao diện tự động cập nhật khi có thay đổi

## 🛠️ Công nghệ & Thư viện

### Core Technologies
- **Flutter 3.9.2+**: Framework phát triển đa nền tảng
- **Dart**: Ngôn ngữ lập trình chính
- **SQLite**: Cơ sở dữ liệu cục bộ
- **Material Design 3**: Hệ thống thiết kế UI

### Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8     # Icons iOS-style
  sqflite: ^2.3.0             # SQLite database
  path_provider: ^2.1.1       # File system paths
  provider: ^6.1.1            # State management
  intl: ^0.19.0               # Date formatting
  shared_preferences: ^2.2.2  # Web storage support
  path: ^1.8.3                # Path utilities
```

## 🏗️ Kiến trúc Dự án

### Cấu trúc Thư mục
```
simple_note_app/
├── lib/
│   ├── main.dart                    # 🎯 Entry point của ứng dụng
│   ├── models/
│   │   └── note.dart               # 📋 Model định nghĩa đối tượng Note
│   ├── database/
│   │   ├── db_helper.dart          # 🗄️ SQLite database helper
│   │   └── storage_service.dart    # 💾 Web storage service
│   ├── providers/
│   │   └── note_provider.dart      # 🔄 State management với Provider
│   ├── screens/
│   │   ├── home_page.dart          # 🏠 Màn hình chính - danh sách ghi chú
│   │   └── note_editor_screen.dart # ✏️ Màn hình tạo/chỉnh sửa ghi chú
│   └── widgets/
│       └── note_card.dart          # 🎴 Widget hiển thị từng ghi chú
├── android/                        # 🤖 Android platform files
├── ios/                            # 🍎 iOS platform files  
├── web/                            # 🌐 Web platform files
├── windows/                        # 🪟 Windows platform files
├── pubspec.yaml                    # 📦 Dependencies & project config
└── README.md                       # 📖 Tài liệu dự án
```

### Mô hình Kiến trúc MVC + Provider

#### 📋 Model Layer
```dart
class Note {
  final int? id;
  final String title;
  final String content; 
  final DateTime createdAt;
  final DateTime updatedAt;
}
```

#### 🗄️ Database Layer  
- **DBHelper**: Singleton pattern quản lý SQLite
- **StorageService**: Abstract interface hỗ trợ đa nền tảng
- Tự động chuyển đổi giữa SQLite (mobile) và SharedPreferences (web)

#### 🔄 Provider Layer
```dart
class NoteProvider extends ChangeNotifier {
  List<Note> _notes = [];
  // Quản lý state và thông báo UI cập nhật
}
```

#### 🎨 UI Layer
- **Screens**: Các màn hình chính của ứng dụng
- **Widgets**: Components tái sử dụng
- **Material Design 3**: Hệ thống thiết kế hiện đại

## 🚀 Hướng dẫn Cài đặt & Chạy

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

#### 🤖 Android
```bash
# Chạy trên Android emulator hoặc device
flutter run

# Build APK
flutter build apk --release
```

#### 🌐 Web  
```bash
# Chạy trên trình duyệt
flutter run -d chrome

# Build web
flutter build web
```

#### 🪟 Windows
```bash
# Chạy trên Windows
flutter run -d windows

# Build Windows app
flutter build windows
```

#### 🍎 iOS (chỉ trên macOS)
```bash
# Chạy trên iOS simulator
flutter run -d ios

# Build iOS app  
flutter build ios
```

## 💡 Hướng dẫn Sử dụng

### 🆕 Tạo Ghi chú Mới
1. Nhấn nút **"New Note"** (biểu tượng ➕ màu tím)
2. Nhập tiêu đề trong ô đầu tiên
3. Nhập nội dung ghi chú
4. Nhấn nút **"Save"** hoặc biểu tượng 💾

### 📖 Xem & Chỉnh sửa
1. Nhấn vào bất kỳ ghi chú nào trong danh sách
2. Chỉnh sửa tiêu đề hoặc nội dung
3. Nhấn **"Save"** để lưu thay đổi
4. Sử dụng nút **"Back"** để hủy thay đổi

### 🗑️ Xóa Ghi chú
1. Nhấn biểu tượng **thùng rác** (🗑️) trên mỗi ghi chú
2. Xác nhận xóa trong hộp thoại
3. Ghi chú sẽ được xóa vĩnh viễn

### 🔍 Tìm kiếm
- Sử dụng thanh tìm kiếm ở đầu màn hình
- Tìm kiếm theo tiêu đề hoặc nội dung ghi chú
- Nhấn **❌** để xóa từ khóa tìm kiếm

### 🔄 Làm mới Dữ liệu
- Kéo xuống (pull-to-refresh) để tải lại danh sách
- Dữ liệu tự động đồng bộ khi có thay đổi

## 🎨 Tính năng UI/UX

### 🎭 Thiết kế
- **Màu sắc**: Deep Purple theme
- **Typography**: Material Design 3 fonts
- **Icons**: Material Icons
- **Layout**: Responsive cho mọi kích thước màn hình

### 📱 Responsive Design
- **Mobile**: Optimized cho điện thoại
- **Tablet**: Layout mở rộng cho màn hình lớn  
- **Desktop**: Hỗ trợ mouse và keyboard
- **Web**: PWA-ready với responsive breakpoints

### 🔔 Feedback & Notifications
- **SnackBar**: Thông báo trạng thái (lưu, xóa, lỗi)
- **Loading**: Hiển thị tiến trình khi xử lý
- **Dialogs**: Xác nhận các thao tác quan trọng
- **Empty States**: Hướng dẫn khi chưa có dữ liệu

## 🧪 Testing & Quality

### 📊 Code Quality
- Tuân thủ Flutter/Dart coding standards
- Error handling cho tất cả operations
- Memory management và performance optimization
- Cross-platform compatibility testing

### 🔒 Data Management
- **Persistence**: SQLite cho mobile, SharedPreferences cho web
- **Validation**: Kiểm tra input trước khi lưu
- **Backup**: Dữ liệu được lưu an toàn cục bộ
- **Migration**: Hỗ trợ update database schema

## 🎓 Kiến thức Đạt được

### 📚 Flutter Concepts
- State Management với Provider
- Navigation và Routing
- Database integration (SQLite)
- Cross-platform development
- Material Design implementation

### 🏗️ Architecture Patterns
- MVC pattern
- Singleton pattern (Database)
- Observer pattern (Provider)
- Repository pattern
- Separation of concerns

### 💾 Data Persistence  
- SQLite database operations
- CRUD implementations
- Data modeling và serialization
- Platform-specific storage solutions

## 🔮 Tính năng Tương lai

- [ ] 🔐 Bảo mật với mật khẩu/sinh trắc học
- [ ] ☁️ Đồng bộ cloud (Firebase/Google Drive)
- [ ] 🏷️ Tags và categories
- [ ] 📷 Hỗ trợ hình ảnh
- [ ] 📤 Xuất/nhập dữ liệu
- [ ] 🌙 Dark mode
- [ ] 📝 Rich text editor
- [ ] 🔔 Nhắc nhở và notifications

## 👨‍💻 Tác giả

**Đoàn Minh Quân**
- 📧 Email: [your.email@example.com]
- 🔗 GitHub: [@Awac8989](https://github.com/Awac8989)
- 📅 Ngày tạo: Tháng 12, 2024

## 📄 License

Dự án này được phát hành dưới [MIT License](LICENSE).

---
✨ **Cảm ơn bạn đã quan tâm đến Simple Note App!** ✨
