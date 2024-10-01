package com.example.duantn.service;

import com.example.duantn.repository.MauSacRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public class MauSacService {
    @Autowired
    private MauSacRepository mauSacRepository;

    public List<com.example.duantn.entity.MauSac> getAllMauSac() {
        return mauSacRepository.findAll();
    }

    public com.example.duantn.entity.MauSac createMauSac(com.example.duantn.entity.MauSac mauSac) {
        return mauSacRepository.save(mauSac);
    }

    public com.example.duantn.entity.MauSac updateMauSac(Integer id, com.example.duantn.entity.MauSac mauSacDetails) {
        com.example.duantn.entity.MauSac mauSac = mauSacRepository.findById(id).orElseThrow(() -> new RuntimeException("Color not found"));
        mauSac.setTenMauSac(mauSacDetails.getTenMauSac());
        mauSac.setMoTa(mauSacDetails.getMoTa());
        mauSac.setNgayCapNhat(new Date()); // Update timestamp
        return mauSacRepository.save(mauSac);
    }

    public void deleteMauSac(Integer id) {
        com.example.duantn.entity.MauSac mauSac = mauSacRepository.findById(id).orElseThrow(() -> new RuntimeException("Color not found"));
        mauSacRepository.delete(mauSac);
    }
}
