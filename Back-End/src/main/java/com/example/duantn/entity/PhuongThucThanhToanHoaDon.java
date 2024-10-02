package com.example.duantn.entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "pt_thanh_toan_hoa_don")
public class PhuongThucThanhToanHoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id_thanh_toan_hoa_don")
    private Integer idThanhToanHoaDon;

    @ManyToOne
    @JoinColumn(name = "id_pt_thanh_toan")
    private PhuongThucThanhToan phuongThucThanhToan;

    @Column(name = "so_tien_thanh_toan")
    private BigDecimal soTienThanhToan;

    @Column(name = "ngay_giao_dich")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayGiaoDich;

    @Column(name = "ghi_chu")
    private String ghiChu;

    @Column(name = "id_giao_dich_thanh_toan")
    private String idGiaoDichThanhToan;

    @ManyToOne
    @JoinColumn(name = "id_trang_thai_hoa_don")
    private TrangThaiHoaDon trangThaiHoaDon;
}
