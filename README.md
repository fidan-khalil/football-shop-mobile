### TUGAS 7 ###
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

### Tugas 8 ###
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
    Navigator.push(): Menambahkan halaman baru di atas stack halaman sebelumnya, sehingga user masih bisa kembali ke halaman sebelumnya dengan tombol back (Navigator.pop()). Pada aplikasi Football Shop saya, digunakan ketika user mengklik tombol Create Product yang akan memunculkan halaman form.

    Navigator.pushReplacement(): Mengganti halaman saat ini dengan halaman baru, jadi halaman lama dihapus dari stack, sehingga user tidak bisa kembali ke halaman sebelumnya dengan tombol back (Navigator.pop()). Pada aplikasi Football Shop saya, digunakan ketika user mengklik suatu tombol pada drawer yang akan mengganti halaman saat ini dengan halaman yang baru.

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
    Scaffold => menyediakan kerangka utama halaman (AppBar, Drawer)
    AppBar => menampilkan judul halaman dan tombol navigasi secara konsisten
    Drawer => menyediakan navigasi global ke halaman-halaman utama 

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
    Padding => Memberi ruang di sekitar elemen
    contoh: 
    Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
            decoration: InputDecoration(
            hintText: "Nama Produk",
            labelText: "Nama Produk",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
            ),
            ),
            onChanged: (String? value) {
            setState(() {
                _name = value!;
            });
            },
            validator: (String? value) {
            if (value == null || value.isEmpty) {
                return "Nama produk tidak boleh kosong!";
            }
            return null;
            },
        ),
    )
    
    SingleChildScrollView => Membuat seluruh form bisa di-scroll secara vertikal jika kontennya panjang
    contoh:
    SingleChildScrollView(
        child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
            Text('Nama: $_name'),
            Text('Kategori: $_category'),
            Text('Brand: $_brand'),
            Text('Thumbnail: $_thumbnail'),
            Text('Harga: $_price'),
            Text('Rating: $_rating'),
            Text('Deskripsi: $_description'),
            ],
        ),
    ),

    ListView => Alternatif Column yang bisa langsung di-scroll tanpa perlu pembungkus tambahan
    contoh:
    ListView(
        children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.blue,
                ),
                child: Column(
                    children: [
                        Text(
                            'Football Shop',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                            ),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                            Text("Seluruh perlengkapan sepak bola terkini, hanya di sini!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                            ),
                        ),
                    ],
                ),
            ),
            ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Home'),
                // Bagian redirection ke MyHomePage
                onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage(),)
                    );
                },
            ),
            ListTile(
                leading: const Icon(Icons.post_add),
                title: const Text('Create Product'),
                // Bagian redirection ke NewsFormPage
                onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ProductFormPage())
                    );
                },
            ),
        ],
    ),

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
    Menggunakan ThemeData pada main.dart