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
