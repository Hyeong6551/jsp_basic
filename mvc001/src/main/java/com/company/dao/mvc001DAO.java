package com.company.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.company.dto.mvc001DTO;
import com.company.util.DBConnection;

public class mvc001DAO {
    public List<mvc001DTO> getmvc001List() {
        List<mvc001DTO> list = new ArrayList<>();
        String sql = "SELECT * FROM mvc001";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
            	mvc001DTO dto = new mvc001DTO(rs.getString("username"), rs.getInt("age"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public void mvc001Insert(mvc001DTO dto) {
        String sql = "INSERT INTO mvc001 (username, age) values (?,?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, dto.getUsername());
            pstmt.setInt(2, dto.getAge());
            pstmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
