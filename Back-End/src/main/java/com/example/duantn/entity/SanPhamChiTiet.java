package com.example.duantn.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "san_pham_chi_tiet")
public class SanPhamChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id_san_pham_chi_tiet")
    private Integer idSanPhamChiTiet;

    @Column(name = "so_luong", nullable = false)
    private Integer soLuong;

    @Column(name = "ngay_tao", updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayTao;

    @Column(name = "ngay_cap_nhat")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayCapNhat;

    @Column(name = "trang_thai")
    private Boolean trangThai;

    @ManyToOne
    @JoinColumn(name = "id_kich_thuoc_chi_tiet")
    private KichThuocChiTiet kichThuocChiTiet;

    @ManyToOne
    @JoinColumn(name = "id_mau_sac_chi_tiet")
    private MauSacChiTiet mauSacChiTiet;

    @ManyToOne
    @JoinColumn(name = "id_chat_lieu_chi_tiet")
    private ChatLieuChiTiet chatLieuChiTiet;

    @ManyToOne
    @JoinColumn(name = "id_gio_hang_chi_tiet")
    private GioHangChiTiet gioHangChiTiet;

    @ManyToOne
    @JoinColumn(name = "id_san_pham")
    private SanPham sanPham;
}
