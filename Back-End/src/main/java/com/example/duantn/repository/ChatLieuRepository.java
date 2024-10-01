package com.example.duantn.repository;

import com.example.duantn.entity.ChatLieu;
import com.example.duantn.entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ChatLieuRepository extends JpaRepository<ChatLieu, Integer> {
    @Query(value = "SELECT \n" +
            "    ms.ten_chat_lieu AS \"Tên màu sắc\",\n" +
            "    ms.mo_ta AS \"Mô tả\",\n" +
            "    ms.ngay_tao AS \"Ngày tạo\",\n" +
            "    ms.ngay_cap_nhat AS \"Ngày cập nhật\"\n" +
            "FROM \n" +
            "    chat_lieu ms;",nativeQuery = true)
    List<Object[]> getAllChatLieu();
}
