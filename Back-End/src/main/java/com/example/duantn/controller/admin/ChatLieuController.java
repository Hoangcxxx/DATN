package com.example.duantn.controller.admin;

import com.example.duantn.entity.ChatLieu;
import com.example.duantn.service.ChatLieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/chat_lieu")
@CrossOrigin(origins = "http://127.0.0.1:5502")
public class ChatLieuController {
    @Autowired
    private ChatLieuService ChatLieuService;

    @GetMapping
    public ResponseEntity<List<ChatLieu>> getAllChatLieu() {
        List<ChatLieu> ChatLieucList = ChatLieuService.getAllChatLieu();
        return new ResponseEntity<>(ChatLieucList, HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<ChatLieu> createChatLieuc(@RequestBody ChatLieu ChatLieuc) {
        ChatLieu newChatLieu = ChatLieuService.createChatLieu(ChatLieuc);
        return new ResponseEntity<>(newChatLieu, HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<ChatLieu> updateChatLieuc(@PathVariable Integer id, @RequestBody ChatLieu ChatLieucDetails) {
        ChatLieu updatedChatLieu = ChatLieuService.updateChatLieu(id, ChatLieucDetails);
        return new ResponseEntity<>(updatedChatLieu, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteChatLieuc(@PathVariable Integer id) {
        ChatLieuService.deleteChatLieu(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
