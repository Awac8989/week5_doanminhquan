# Simple Note App

Một ứng dụng Flutter đơn giản để quản lý ghi chú cá nhân với các chức năng CRUD cơ bản.

## 📱 Chức năng

- ✅ **Tạo ghi chú mới**: Thêm tiêu đề và nội dung ghi chú
- ✅ **Xem danh sách**: Hiển thị tất cả ghi chú theo thời gian cập nhật gần nhất
- ✅ **Chỉnh sửa ghi chú**: Sửa nội dung các ghi chú đã có
- ✅ **Xóa ghi chú**: Xóa ghi chú với xác nhận
- ✅ **Lưu trữ vĩnh viễn**: Sử dụng SQLite database
- ✅ **Tìm kiếm**: Tìm kiếm ghi chú theo tiêu đề hoặc nội dung
- ✅ **Thời gian**: Theo dõi thời gian tạo và cập nhật

## 🛠 Công nghệ sử dụng

- **Flutter**: Framework UI
- **SQLite**: Cơ sở dữ liệu cục bộ
- **Provider**: State Management
- **Intl**: Định dạng ngày tháng

## 📦 Thư viện Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  sqflite: ^2.3.0
  path_provider: ^2.1.1
  provider: ^6.1.1
  intl: ^0.19.0
```

## 🏗 Cấu trúc dự án

```
lib/
├── main.dart                    # Điểm khởi chạy ứng dụng
├── models/
│   └── note.dart               # Model cho đối tượng Note
├── database/
│   └── db_helper.dart          # Xử lý SQLite database
├── providers/
│   └── note_provider.dart      # State management với Provider
├── screens/
│   ├── home_page.dart          # Màn hình chính
│   └── note_editor_screen.dart # Màn hình soạn thảo
└── widgets/
    └── note_card.dart          # Widget hiển thị từng ghi chú
```

## 🚀 Cách chạy ứng dụng

### 1. Cài đặt dependencies

```bash
flutter pub get
```

### 2. Chạy ứng dụng

**Android/iOS Simulator:**
```bash
flutter run
```

**Web (Chrome):**
```bash
flutter run -d chrome
```

**Windows:**
```bash
flutter run -d windows
```

### 3. Build APK cho Android

```bash
flutter build apk --release
```

## 📋 Hướng dẫn sử dụng

### Tạo ghi chú mới
1. Nhấn nút **"New Note"** (dấu + màu tím)
2. Nhập tiêu đề và nội dung
3. Nhấn nút **"Save"** để lưu

### Xem và chỉnh sửa ghi chú
1. Nhấn vào ghi chú trong danh sách
2. Chỉnh sửa tiêu đề hoặc nội dung
3. Nhấn **"Save"** để cập nhật

### Xóa ghi chú
1. Nhấn biểu tượng thùng rác (🗑️) trên ghi chú
2. Xác nhận xóa trong hộp thoại

### Tìm kiếm ghi chú
- Sử dụng thanh tìm kiếm ở đầu màn hình
- Tìm kiếm theo tiêu đề hoặc nội dung

## 🔧 Kiến trúc ứng dụng

### Model Layer
- **Note**: Đối tượng ghi chú với id, title, content, createdAt, updatedAt

### Database Layer
- **DBHelper**: Singleton class quản lý SQLite
- Các phương thức CRUD: create, read, update, delete

### State Management
- **NoteProvider**: ChangeNotifier quản lý state
- Tự động cập nhật UI khi dữ liệu thay đổi

### UI Layer
- **HomePage**: Hiển thị danh sách ghi chú
- **NoteEditorScreen**: Màn hình tạo/chỉnh sửa
- **NoteCard**: Widget hiển thị từng ghi chú

## 🎨 Thiết kế UI

- **Màu chủ đạo**: Deep Purple
- **Material Design 3**
- **Responsive**: Hỗ trợ nhiều kích thước màn hình
- **Icons**: Material Icons

## 📱 Hỗ trợ Platform

- ✅ Android
- ✅ iOS  
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🔍 Tính năng nâng cao

- **Pull to refresh**: Kéo để làm mới danh sách
- **Auto-save**: Tự động lưu khi thoát
- **Confirmation dialogs**: Xác nhận trước khi xóa
- **Empty state**: Hiển thị thông báo khi không có ghi chú
- **Loading states**: Hiển thị loading indicator
- **Error handling**: Xử lý lỗi và hiển thị thông báo

## 📄 License

MIT License - Xem file LICENSE để biết thêm chi tiết.

---

**Phát triển bởi**: [Tên của bạn]  
**Ngày tạo**: December 2024  
**Flutter Version**: 3.9.2+
