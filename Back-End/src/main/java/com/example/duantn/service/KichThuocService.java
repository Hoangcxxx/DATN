package com.example.duantn.service;



import com.example.duantn.entity.KichThuoc;
import com.example.duantn.repository.KichThuocRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public class KichThuocService {
    @Autowired
    private KichThuocRepository kichThuocRepository;

    public List<KichThuoc> getAllKichThuoc() {
        return kichThuocRepository.findAll();
    }

    public com.example.duantn.entity.KichThuoc createKichThuoc(com.example.duantn.entity.KichThuoc kichThuoc) {
        return kichThuocRepository.save(kichThuoc);
    }

    public com.example.duantn.entity.KichThuoc updateKichThuoc(Integer id, com.example.duantn.entity.KichThuoc kichThuocDetails) {
        com.example.duantn.entity.KichThuoc kichThuoc = kichThuocRepository.findById(id).orElseThrow(() -> new RuntimeException("Color not found"));
        kichThuoc.setTenKichThuoc(kichThuocDetails.getTenKichThuoc());
        kichThuoc.setMoTa(kichThuocDetails.getMoTa());
        kichThuoc.setNgayCapNhat(new Date()); // Update timestamp
        return kichThuocRepository.save(kichThuoc);
    }

    public void deleteKichThuoc(Integer id) {
        com.example.duantn.entity.KichThuoc kichThuoc = kichThuocRepository.findById(id).orElseThrow(() -> new RuntimeException("Color not found"));
        kichThuocRepository.delete(kichThuoc);
    }
}
