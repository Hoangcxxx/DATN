package com.example.duantn.repository;

import com.example.duantn.entity.MauSacChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface MauSacChiTietRepository extends JpaRepository<MauSacChiTiet, Integer> {

}
