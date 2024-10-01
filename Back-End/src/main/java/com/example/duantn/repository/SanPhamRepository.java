package com.example.duantn.repository;

import com.example.duantn.entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface SanPhamRepository extends JpaRepository<SanPham, Integer> {
    @Query(value = "SELECT \n" +
            "    sp.ten_san_pham AS tenSanPham,\n" +
            "    sct.so_luong AS soLuong,\n" +
            "    dm.ten_danh_muc AS tenDanhMuc,\n" +
            "    lv.ten_loai_voucher AS tenLoaiVoucher,\n" +
            "    sct.trang_thai AS trangThai\n" +
            "FROM \n" +
            "    san_pham sp\n" +
            "JOIN  \n" +
            "    danh_muc dm ON sp.id_danh_muc = dm.Id_danh_muc\n" +
            "LEFT JOIN \n" +
            "    loai_voucher lv ON sp.id_loai_voucher = lv.Id_loai_voucher\n" +
            "LEFT JOIN\n" +
            "    san_pham_chi_tiet sct ON sp.Id_san_pham = sct.id_san_pham;\n",
            nativeQuery = true)
    List<Object[]> getAllSanPham();


}
