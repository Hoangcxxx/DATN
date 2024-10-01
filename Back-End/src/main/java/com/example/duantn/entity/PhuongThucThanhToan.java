package com.example.duantn.entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "pt_thanh_toan")
public class PhuongThucThanhToan {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id_pt_thanh_toan")
    private Integer idPtThanhToan;

    @Column(name = "ma_thanh_toan", nullable = false, unique = true)
    private String maThanhToan;

    @Column(name = "ten_phuong_thuc", nullable = false)
    private String tenPhuongThuc;

    @Column(name = "noi_dung_thanh_toan")
    private String noiDungThanhToan;

    @Column(name = "ngay_thanh_toan")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayThanhToan;

    @Column(name = "trang_thai_thanh_toan", nullable = false)
    private Boolean trangThaiThanhToan;

    @Column(name = "phi_giao_dich")
    private BigDecimal phiGiaoDich;

    @Column(name = "thong_tin_them")
    private String thongTinThem;

    @OneToMany(mappedBy = "phuongThucThanhToan") // Sửa ở đây
    private List<PhuongThucThanhToanHoaDon> phuongThucThanhToanHoas; // Tên danh sách cũng cần thay đổi
}
