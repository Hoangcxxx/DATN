package com.example.duantn.controller.admin;

import com.example.duantn.entity.KichThuoc;
import com.example.duantn.service.KichThuocService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/kich_thuoc")
@CrossOrigin(origins = "http://127.0.0.1:5502")
public class KichThuocController {
    @Autowired
    private KichThuocService kichThuocService;

    @GetMapping
    public ResponseEntity<List<KichThuoc>> getAllKichThuoc() {
        List<KichThuoc> kichThuoccList = kichThuocService.getAllKichThuoc();
        return new ResponseEntity<>(kichThuoccList, HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<KichThuoc> createKichThuocc(@RequestBody KichThuoc kichThuocc) {
        KichThuoc newKichThuoc = kichThuocService.createKichThuoc(kichThuocc);
        return new ResponseEntity<>(newKichThuoc, HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<KichThuoc> updateKichThuocc(@PathVariable Integer id, @RequestBody KichThuoc kichThuoccDetails) {
        KichThuoc updatedKichThuoc = kichThuocService.updateKichThuoc(id, kichThuoccDetails);
        return new ResponseEntity<>(updatedKichThuoc, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteKichThuocc(@PathVariable Integer id) {
        kichThuocService.deleteKichThuoc(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
