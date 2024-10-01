package com.example.duantn.repository;

import com.example.duantn.entity.KichThuoc;
import com.example.duantn.entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface KichThuocRepository extends JpaRepository<KichThuoc, Integer> {
    @Query(value = "SELECT \n" +
            "    ms.ten_kich_thuoc AS \"Tên màu sắc\",\n" +
            "    ms.mo_ta AS \"Mô tả\",\n" +
            "    ms.ngay_tao AS \"Ngày tạo\",\n" +
            "    ms.ngay_cap_nhat AS \"Ngày cập nhật\"\n" +
            "FROM \n" +
            "    kich_thuoc ms;",nativeQuery = true)
    List<Object[]> getAllKichThuoc();
}
