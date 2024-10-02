package com.example.duantn.controller.admin;

import com.example.duantn.entity.MauSac;
import com.example.duantn.service.MauSacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/mau_sac")
@CrossOrigin(origins = "http://127.0.0.1:5502")
public class MauSacController {

    @Autowired
    private MauSacService mauSacService;

    @GetMapping
    public ResponseEntity<List<MauSac>> getAllMauSac() {
        List<MauSac> mauSacList = mauSacService.getAllMauSac();
        return new ResponseEntity<>(mauSacList, HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<MauSac> createMauSac(@RequestBody MauSac mauSac) {
        MauSac newMauSac = mauSacService.createMauSac(mauSac);
        return new ResponseEntity<>(newMauSac, HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<MauSac> updateMauSac(@PathVariable Integer id, @RequestBody MauSac mauSacDetails) {
        MauSac updatedMauSac = mauSacService.updateMauSac(id, mauSacDetails);
        return new ResponseEntity<>(updatedMauSac, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteMauSac(@PathVariable Integer id) {
        mauSacService.deleteMauSac(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
