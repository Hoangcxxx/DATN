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
@Table(name = "hoa_don_chi_tiet")
public class HoaDonChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id_hoa_don_chi_tiet")
    private Integer idHoaDonChiTiet;

    @Column(name = "ma_don", nullable = true)
    private String maDon;

    @ManyToOne
    @JoinColumn(name = "id_san_pham_chi_tiet", nullable = false)
    private SanPhamChiTiet sanPhamChiTiet;

    @ManyToOne
    @JoinColumn(name = "id_hoa_don", nullable = false)
    private HoaDon hoaDon;

    @Column(name = "so_luong", nullable = false)
    private Integer soLuong;

    @Column(name = "tong_tien", nullable = false)
    private BigDecimal tongTien;
    @Column(name = "so_tien_thanh_toan", nullable = false)
    private BigDecimal soTienThanhToan;
    @Column(name = "tien_tra_lai", nullable = false)
    private BigDecimal tienTraLai;

    @Column(name = "ngay_tao", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayTao;

    @Column(name = "ngay_cap_nhat", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayCapNhat;

    @Column(name = "trang_thai", nullable = false)
    private Boolean trangThai;

    @Column(name = "mo_ta", nullable = true)
    private String moTa;
}
