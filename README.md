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


### Tugas 9 ###
1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
    model = kontrak + pengecek awal + kemudahan maintenance.

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
    http = alat umum untuk HTTP.

    CookieRequest = alat khusus untuk interaksi dengan Django yang pakai session/cookies; mengurangi boilerplate (CSRF/session).

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
    - Session global: session (cookie sessionid) harus dipakai di banyak widget (list, detail, create, edit). Jika tiap widget punya instance terpisah, cookie tidak konsisten → harus login ulang / tidak terautentikasi.

    - Stateful authentication: CookieRequest menyimpan state (cookies) dan helper (CSRF token). Menyediakannya via Provider memberi semua widget akses yang konsisten dan reaktif.

    - Mudah unit testing & mocking: provider memudahkan mengganti CookieRequest dengan fake saat test.

    - Single source of truth: semua network call lewat satu objek, lebih mudah meng-handle global error, refresh token (jika ada), dll.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
    1. 10.0.2.2 pada Android Emulator
        - Android emulator tidak bisa mengakses localhost.

        - 10.0.2.2 adalah alamat khusus agar emulator bisa terhubung ke backend yang berjalan di laptop.

        - Jika tidak ditambahkan ke ALLOWED_HOSTS, Django menolak request → error Bad Request (400).

    2. ALLOWED_HOSTS
        - Django hanya menerima request dari host yang diizinkan.

        - Harus menambahkan: ALLOWED_HOSTS = ["localhost", "127.0.0.1", "10.0.2.2"]

    3. CORS (Cross-Origin Resource Sharing)
        - Dibutuhkan agar frontend (Flutter Web / Mobile) bisa meminta data ke domain Django.

        - Tanpa CORS: browser/webview akan memblokir semua request → CORS error.

    4. Cookie & SameSite Settings
        - Agar sesi login tetap bekerja, Django harus mengizinkan cookie dikirim dari client.

        - Setting SESSION_COOKIE_SAMESITE = None diperlukan untuk cross-site requests.

        - Jika salah konfigurasi → cookie tidak terkirim → user selalu dianggap not logged in.

    5. Permission INTERNET di Android
        - Aplikasi Android tidak bisa akses jaringan tanpa izin ini.

        - Jika tidak ditambahkan → semua request gagal dengan SocketException.

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
    - User input di Flutter (form) → user isi fields → tekan submit.

    - Flutter mengumpulkan data (via variables atau TextEditingController) → memanggil request.postJson(url, jsonEncode(payload)).

    - HTTP request ke Django URL (mis. /auth/create-product/) dikirim. Jika menggunakan CookieRequest, cookie dan CSRF dikelola otomatis (jika ada).

    - Django view (API) menerima JSON → json.loads(request.body) → validasi fields (tipe, required, range).

    - Jika valid, Django simpan model (Product.objects.create(...)).

    - Django kirim respons JSON (mis. {"status":"success","id": "...", ...}).

    - Flutter menerima JSON response → response['status'] dicek → jika sukses, update UI: navigasi ke list, show toast, atau dispatch event untuk refresh list.

    - Jika list di Flutter menggunakan API GET /products/, setelah create kamu bisa reload list (fetch ulang), parse JSON → ProductEntry.fromJson() → setState / provider update → UI re-render menampilkan product baru.

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
    Register (Flutter → Django → Flutter)
        1. Flutter submit username, password1, password2 ke endpoint register JSON (/auth/register/).

        2. Django validasi data, create User di DB, dan biasanya bisa langsung login atau mengembalikan success. Untuk session-based: Django bisa membuat session dan memberi cookie sessionid di response (set-cookie).

        3. CookieRequest menyimpan cookie secara otomatis (jika endpoint return cookie). Flutter menerima status success → tampil toast → navigasi ke login atau home.

    Login
        1. Flutter kirim username + password (POST json) ke /auth/login/ (endpoint JSON).

        2. Django authenticate() dan login(request, user) → Django men-set sessionid cookie di response.

        3. CookieRequest menyimpan cookie. Selanjutnya semua request lewat CookieRequest menyertakan cookie sehingga Django tahu request tersebut dari user yang sudah login.

        4. Flutter cek response success → ubah UI (tampilkan menu yang hanya untuk logged-in), simpan state via Provider.

    Logout
        1. Flutter call /auth/logout/.

        2. Django logout(request) menghapus session server-side dan menginstruksikan browser untuk menghapus cookie.

        3. CookieRequest juga akan mengosongkan cookies (tergantung implementasi). Flutter update UI (navigasi ke login).

7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
    1. Backend Django
        - Membuat model Product dengan field baru: name, category, brand, price, rating, description.

        - Membuat endpoint JSON: list product, detail product, create product (Flutter), register, login, logout.

        - Menambahkan user info (user_id, user_username) ke JSON.

        - Mengatur CORS, ALLOWED_HOSTS, dan cookie settings.

        - Testing API melalui Postman.

    2) Frontend Flutter
        - Membuat model Dart ProductEntry untuk parsing JSON → object.

        - Membuat formulir create product dengan validasi.

        - Menghubungkan Flutter ke Django menggunakan CookieRequest.

        - Implementasi list, card, detail, dan form create.

        - Implementasi fitur login, register, logout dengan session cookies.

        - Menampilkan produk yang dibuat user + tombol Edit/Delete jika user sama.

    3) Integrasi dan Testing
        - Mengirim request create product → Django → simpan ke database.

        - Menampilkan product list dengan API GET.

        - Navigasi Flutter diperbarui setelah login dan create product.

        - Melakukan testing baik via emulator maupun browser.