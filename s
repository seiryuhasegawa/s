import java.util.Scanner;

// Interface untuk Senjata
interface Senjata {
    void tembak();
    void reload();
    void cekPeluru();
    void gantiSenjata();
}

// Implementasi Senjata Pistol
class Pistol implements Senjata {
    private int peluru = 6;

    @Override
    public void tembak() {
        if (peluru > 0) {
            System.out.println("Menembak! Sisa peluru: " + --peluru);
        } else {
            System.out.println("Peluru habis. Silakan reload.");
        }
    }

    @Override
    public void reload() {
        peluru = 6;
        System.out.println("Reload selesai. Peluru sekarang: " + peluru);
    }

    @Override
    public void cekPeluru() {
        System.out.println("Sisa peluru: " + peluru);
    }

    @Override
    public void gantiSenjata() {
        System.out.println("Ganti senjata ke Shotgun");
    }
}

// Implementasi Senjata Shotgun
class Shotgun implements Senjata {
    private int peluru = 2;

    @Override
    public void tembak() {
        if (peluru > 0) {
            System.out.println("Menembak! Sisa peluru: " + --peluru);
        } else {
            System.out.println("Peluru habis. Silakan reload.");
        }
    }

    @Override
    public void reload() {
        peluru = 2;
        System.out.println("Reload selesai. Peluru sekarang: " + peluru);
    }

    @Override
    public void cekPeluru() {
        System.out.println("Sisa peluru: " + peluru);
    }

    @Override
    public void gantiSenjata() {
        System.out.println("Ganti senjata ke Pistol");
    }
}

// Kelas utama program
public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Senjata senjata = new Pistol(); // Awalnya menggunakan senjata Pistol

        while (true) {
            System.out.println("Pilihan: ");
            System.out.println("1. Tembak");
            System.out.println("2. Reload");
            System.out.println("3. Cek Peluru");
            System.out.println("4. Ganti Senjata");
            System.out.println("5. Keluar");

            System.out.print("Masukkan pilihan Anda: ");
            int pilihan = scanner.nextInt();

            switch (pilihan) {
                case 1:
                    senjata.tembak();
                    break;
                case 2:
                    senjata.reload();
                    break;
                case 3:
                    senjata.cekPeluru();
                    break;
                case 4:
                    if (senjata instanceof Pistol) {
                        senjata = new Shotgun();
                    } else {
                        senjata = new Pistol();
                    }
                    senjata.gantiSenjata();
                    break;
                case 5:
                    System.out.println("Program selesai.");
                    System.exit(0);
                    break;
                default:
                    System.out.println("Pilihan tidak valid.");
            }
        }
    }
}

//hewan

import java.util.Scanner;

// Antarmuka untuk Hewan
interface Hewan {
    void bersuara();
}

// Implementasi Hewan Kucing
class Kucing implements Hewan {
    @Override
    public void bersuara() {
        System.out.println("Meow!");
    }
}

// Implementasi Hewan Anjing
class Anjing implements Hewan {
    @Override
    public void bersuara() {
        System.out.println("Woof!");
    }
}

// Kelas utama program
public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Hewan hewan = null;

        while (true) {
            System.out.println("Pilihan Hewan: ");
            System.out.println("1. Kucing");
            System.out.println("2. Anjing");
            System.out.println("3. Bersuara");
            System.out.println("4. Keluar");

            System.out.print("Masukkan pilihan Anda: ");
            int pilihan = scanner.nextInt();

            switch (pilihan) {
                case 1:
                    hewan = new Kucing();
                    System.out.println("Anda memilih Kucing.");
                    break;
                case 2:
                    hewan = new Anjing();
                    System.out.println("Anda memilih Anjing.");
                    break;
                case 3:
                    if (hewan != null) {
                        hewan.bersuara();
                    } else {
                        System.out.println("Pilih hewan terlebih dahulu sebelum bersuara.");
                    }
                    break;
                case 4:
                    System.out.println("Program selesai.");
                    System.exit(0);
                    break;
                default:
                    System.out.println("Pilihan tidak valid.");
            }
        }
    }
}

//atm
import java.util.Scanner;

interface OperasiATM {
    void cekSaldo();
    void penarikan();
    void transfer();
    void tambahSaldo();
}

class Saldo {
    private double saldo;

    public Saldo(double saldoAwal) {
        this.saldo = saldoAwal;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }
}

abstract class Transaksi implements OperasiATM {
    protected Saldo saldo;

    public Transaksi(Saldo saldo) {
        this.saldo = saldo;
    }

    @Override
    public void cekSaldo() {
        System.out.println("Saldo Anda: " + saldo.getSaldo());
    }

    @Override
    public void penarikan() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Masukkan jumlah penarikan: ");
        double jumlah = scanner.nextDouble();

        if (jumlah > saldo.getSaldo()) {
            System.out.println("Saldo tidak mencukupi.");
        } else {
            saldo.setSaldo(saldo.getSaldo() - jumlah);
            System.out.println("Penarikan berhasil. Saldo Anda sekarang: " + saldo.getSaldo());
        }
    }

    @Override
    public void transfer() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Masukkan rekening tujuan: ");
        String rekening = scanner.next();
        System.out.print("Masukkan jumlah transfer: ");
        double jumlah = scanner.nextDouble();

        if (jumlah > saldo.getSaldo()) {
            System.out.println("Saldo tidak mencukupi.");
        } else {
            saldo.setSaldo(saldo.getSaldo() - jumlah);
            System.out.println("Transfer berhasil ke rekening " + rekening + ". Saldo Anda sekarang: " + saldo.getSaldo());
        }
    }

    @Override
    public void tambahSaldo() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Masukkan jumlah saldo yang ingin ditambahkan: ");
        double jumlah = scanner.nextDouble();
        saldo.setSaldo(saldo.getSaldo() + jumlah);
        System.out.println("Saldo berhasil ditambahkan. Saldo Anda sekarang: " + saldo.getSaldo());
    }
}

public class Main extends Transaksi {
    public Main(Saldo saldo) {
        super(saldo);
    }

    public static void main(String[] args) {
        Saldo saldoAwal = new Saldo(1000.0);
        Main atm = new Main(saldoAwal);

        Scanner scanner = new Scanner(System.in);
        int pilihan;

        do {
            System.out.println("\nMenu ATM:");
            System.out.println("1. Cek Saldo");
            System.out.println("2. Penarikan");
            System.out.println("3. Transfer");
            System.out.println("4. Tambah Saldo");
            System.out.println("5. Keluar");
            System.out.print("Pilih menu (1-5): ");
            pilihan = scanner.nextInt();

            switch (pilihan) {
                case 1:
                    atm.cekSaldo();
                    break;
                case 2:
                    atm.penarikan();
                    break;
                case 3:
                    atm.transfer();
                    break;
                case 4:
                    atm.tambahSaldo();
                    break;
                case 5:
                    System.out.println("Terima kasih. Sampai jumpa!");
                    break;
                default:
                    System.out.println("Pilihan tidak valid. Silakan pilih kembali.");
                    break;
            }
        } while (pilihan != 5);
    }
}

//perpus
import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

interface OperasiPerpustakaan {
    void lihatBuku();
    void pinjamBuku(String namaPeminjam, int nomorBuku);
    void kembalikanBuku(String namaPengembali);
    void perpanjangPeminjaman(String namaPeminjam, int nomorBuku);
}

class Buku {
    private String judul;
    private String pengarang;
    private boolean tersedia;
    private int durasiPeminjaman;

    public Buku(String judul, String pengarang) {
        this.judul = judul;
        this.pengarang = pengarang;
        this.tersedia = true;
        this.durasiPeminjaman = 7; // Durasi peminjaman awal (misalnya, 7 hari)
    }

    public String getJudul() {
        return judul;
    }

    public String getPengarang() {
        return pengarang;
    }

    public boolean isTersedia() {
        return tersedia;
    }

    public void setTersedia(boolean tersedia) {
        this.tersedia = tersedia;
    }

    public int getDurasiPeminjaman() {
        return durasiPeminjaman;
    }

    public void perpanjangPeminjaman() {
        // Menambah durasi peminjaman
        durasiPeminjaman += 7; // Menambah 7 hari setiap kali perpanjangan
        System.out.println("Peminjaman buku " + judul + " diperpanjang. Durasi peminjaman sekarang: " + durasiPeminjaman + " hari.");
    }
}

abstract class TransaksiPeminjaman implements OperasiPerpustakaan {
    protected ArrayList<Buku> daftarBuku;

    public TransaksiPeminjaman() {
        this.daftarBuku = new ArrayList<>();
    }

    @Override
    public void lihatBuku() {
        System.out.println("Daftar Buku:");
        for (int i = 0; i < daftarBuku.size(); i++) {
            Buku buku = daftarBuku.get(i);
            System.out.println((i + 1) + ". Judul: " + buku.getJudul() + ", Pengarang: " + buku.getPengarang() +
                    ", Tersedia: " + (buku.isTersedia() ? "Ya" : "Tidak") +
                    ", Durasi Peminjaman: " + buku.getDurasiPeminjaman() + " hari");
        }
    }

    @Override
    public void pinjamBuku(String namaPeminjam, int nomorBuku) {
        if (daftarBuku.isEmpty()) {
            System.out.println("Tidak ada buku yang tersedia.");
            return;
        }

        if (nomorBuku < 1 || nomorBuku > daftarBuku.size()) {
            System.out.println("Nomor buku tidak valid.");
            return;
        }

        Buku buku = daftarBuku.get(nomorBuku - 1);

        if (buku.isTersedia()) {
            buku.setTersedia(false);
            System.out.println(namaPeminjam + " meminjam buku " + buku.getJudul() + ".");
        } else {
            System.out.println("Buku sudah dipinjam.");
        }
    }

    @Override
    public void kembalikanBuku(String namaPengembali) {
        if (daftarBuku.isEmpty()) {
            System.out.println("Tidak ada buku yang dapat dikembalikan.");
            return;
        }

        System.out.print("Masukkan nomor buku yang ingin dikembalikan: ");
        Scanner scanner = new Scanner(System.in);
        int nomorBuku = scanner.nextInt();

        if (nomorBuku < 1 || nomorBuku > daftarBuku.size()) {
            System.out.println("Nomor buku tidak valid.");
            return;
        }

        Buku buku = daftarBuku.get(nomorBuku - 1);

        if (!buku.isTersedia()) {
            buku.setTersedia(true);
            System.out.println(namaPengembali + " mengembalikan buku " + buku.getJudul() + ".");
        } else {
            System.out.println("Buku sudah tersedia.");
        }
    }

    @Override
    public void perpanjangPeminjaman(String namaPeminjam, int nomorBuku) {
        if (daftarBuku.isEmpty()) {
            System.out.println("Tidak ada buku yang dapat diperpanjang.");
            return;
        }

        if (nomorBuku < 1 || nomorBuku > daftarBuku.size()) {
            System.out.println("Nomor buku tidak valid.");
            return;
        }

        Buku buku = daftarBuku.get(nomorBuku - 1);

        if (!buku.isTersedia()) {
            buku.perpanjangPeminjaman();
        } else {
            System.out.println("Buku tidak tersedia untuk diperpanjang.");
        }
    }
}

public class Main extends TransaksiPeminjaman {
    public Main() {
        // Menambahkan beberapa buku ke daftar buku perpustakaan
        daftarBuku.add(new Buku("Java Programming", "John Doe"));
        daftarBuku.add(new Buku("Python Basics", "Jane Smith"));
    }

    public static void main(String[] args) {
        Main perpustakaan = new Main();

        Scanner scanner = new Scanner(System.in);
        int pilihan;

        do {
            System.out.println("\nMenu Perpustakaan:");
            System.out.println("1. Lihat Buku");
            System.out.println("2. Pinjam Buku");
            System.out.println("3. Kembalikan Buku");
            System.out.println("4. Perpanjang Peminjaman");
            System.out.println("5. Keluar");
            System.out.print("Pilih menu (1-5): ");
            pilihan = scanner.nextInt();

            switch (pilihan) {
                case 1:
                    perpustakaan.lihatBuku();
                    break;
                case 2:
                    System.out.print("Masukkan nama peminjam: ");
                    String namaPeminjam = scanner.next();
                    System.out.print("Masukkan nomor buku yang ingin dipinjam: ");
                    int nomorBukuPinjam = scanner.nextInt();
                    perpustakaan.pinjamBuku(namaPeminjam, nomorBukuPinjam);
                    break;
                case 3:
                    System.out.print("Masukkan nama pengembali: ");
                    String namaPengembali = scanner.next();
                    perpustakaan.kembalikanBuku(namaPengembali);
                    break;
                case 4:
                    System.out.print("Masukkan nama peminjam: ");
                    String namaPeminjamPerpanjang = scanner.next();
                    System.out.print("Masukkan nomor buku yang ingin diperpanjang: ");
                    int nomorBukuPerpanjang = scanner.nextInt();
                    perpustakaan.perpanjangPeminjaman(namaPeminjamPerpanjang, nomorBukuPerpanjang);
                    break;
                case 5:
                    System.out.println("Terima kasih. Sampai jumpa!");
                    break;
                default:
                    System.out.println("Pilihan tidak valid. Silakan pilih kembali.");
                    break;
            }
        } while (pilihan != 5);
    }
}
