package com.example.duantn.service;



import com.example.duantn.entity.ChatLieu;
import com.example.duantn.repository.ChatLieuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public class ChatLieuService {
    @Autowired
    private ChatLieuRepository ChatLieuRepository;

    public List<ChatLieu> getAllChatLieu() {
        return ChatLieuRepository.findAll();
    }

    public com.example.duantn.entity.ChatLieu createChatLieu(com.example.duantn.entity.ChatLieu ChatLieu) {
        return ChatLieuRepository.save(ChatLieu);
    }

    public com.example.duantn.entity.ChatLieu updateChatLieu(Integer id, com.example.duantn.entity.ChatLieu ChatLieuDetails) {
        com.example.duantn.entity.ChatLieu ChatLieu = ChatLieuRepository.findById(id).orElseThrow(() -> new RuntimeException("Color not found"));
        ChatLieu.setTenChatLieu(ChatLieuDetails.getTenChatLieu());
        ChatLieu.setMoTa(ChatLieuDetails.getMoTa());
        ChatLieu.setNgayCapNhat(new Date()); // Update timestamp
        return ChatLieuRepository.save(ChatLieu);
    }

    public void deleteChatLieu(Integer id) {
        com.example.duantn.entity.ChatLieu ChatLieu = ChatLieuRepository.findById(id).orElseThrow(() -> new RuntimeException("Color not found"));
        ChatLieuRepository.delete(ChatLieu);
    }
}
