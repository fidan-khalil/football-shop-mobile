## TUGAS 7
1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
    Widget tree adalah struktur hierarki yang menggambarkan bagaimana widget tersusun dalam aplikasi flutter.

    Hubungan parent-child:
        - Parent widget: mengatur atau membungkus widget lain
        - Child widget: merupakan bagian yang berada di dalam parent yang menentukan isi konten.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
    - MaterialApp: Root aplikasi Flutter berbasis Material
    - ThemeData: Mengatur tema aplikasi
    - ColorScheme: Mengatur skema warna 
    - Scaffold: Struktur dasar halaman
    - AppBar: Menampilkan bar header pada bagian atas aplikasi
    - Text: Menampilkan text
    - Padding: Jarak di sekitar widget
    - Column: Menyusun widget secara vertikal
    - Row: Menyusun widget secara horizontal
    - Center: Memposisikan child di tengah parent widget
    - SizedBox: Memberi jarak ruang kosong dengan ukuran tertentu
    - GridView.count: Membuat tampilan grid dengan jumlah kolom tertentu
    - Card: Menampilkan card
    - Container: Widget pembungkus untuk styling
    - MediaQuery: Mengambil ukuran layar
    - TextStyle: Mengatur style teks
    - ItemHomePage: Class model untuk menyimpan nama menu dan icon
    - Icon: Menampilkan ikon
    - Material: Memberikan efek UI material pada card item
    - InkWell: Widget yang memberikan efek klik ketika ditekan
    - ScaffoldMessenger: Menampilkan pesan di layar
    - SnackBar: Notifikasi di bagian bawah layar ketika item ditekan 

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
    Fungsi widget MaterialApp:
        - Menyediakan tema dan gaya
        - Mengatur navigasi
        - Mengatur title, theme, locale
        - Mendefinisikan home page

    Sering digunakan sebagai widget root karena aplikasi Flutter berbasis Material memerlukan konfigurasi global, sehingga tanpa MaterialApp banyak widget material tidak berfungsi dengan baik.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
    StatelessWidget:
        - Tidak memiliki state yang berubah
        - UI statik
        - Lebih ringan dan efisien
    
    StatefulWidget:
        - Memiliki state yang berubah
        - UI dinamis
        - Lebih kompleks
    
    Gunakan StatelessWidget ketika UI tidak berubah seperti menampilkan teks, ikon, layout statis. Sedangkan gunakan StatefulWidget ketika ada interaksi user dan data berubah.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
    BuildContext adalah objek yang menyimpan informasi posisi widget di dalam widget tree.
    BuildContext penting karena berfungsi:
        - Mengakses theme, navigator, dan data InheritedWidget
        - Mengetahui di mana widget berada dalam tree
        - Dibutuhkan di method build(BuildContext context)

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
    Hot Reload:
        - Perubahan kode tanpa menghapus state
        - Perubahan UI langsung terlihat
        contoh: ubah teks, warna, layout

    Hot Restart:
        - Restart aplikasi dan reset state
        - Aplikasi berjalan ulang dari awal
        contoh: ubah model state awal atau global variable