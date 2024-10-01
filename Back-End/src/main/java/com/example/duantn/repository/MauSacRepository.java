package com.example.duantn.repository;

import com.example.duantn.entity.MauSac;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface MauSacRepository extends JpaRepository<MauSac, Integer> {
    @Query(value = "SELECT \n" +
            "    ms.ten_mau_sac AS \"Tên màu sắc\",\n" +
            "    ms.mo_ta AS \"Mô tả\",\n" +
            "    ms.ngay_tao AS \"Ngày tạo\",\n" +
            "    ms.ngay_cap_nhat AS \"Ngày cập nhật\"\n" +
            "FROM \n" +
            "    mau_sac ms;",nativeQuery = true)
    List<Object[]> getAllMauSac();
}
