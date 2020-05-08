DELIMITER $$

USE `online_shop1`$$

DROP TRIGGER /*!50032 IF EXISTS */ `hapus_barang`$$

CREATE
    /*!50017 DEFINER = 'root'@'localhost' */
    TRIGGER `hapus_barang` AFTER DELETE ON `tb_barang` 
    FOR EACH ROW 
    BEGIN
    INSERT INTO produk_hapus
    (id_brg, nama_brg, keterangan, kategori, harga, stok, gambar, tgl_hapus, username)
    VALUES
    (OLD.id_brg, OLD.nama_brg, OLD.keterangan, OLD.kategori, OLD.harga, OLD.stok, OLD.gambar, SYSDATE(), CURRENT_USER);

    END;
$$

DELIMITER ;