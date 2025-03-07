/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

/**
 *
 * @author Hasara Hithaishi
 */
import com.entity.Driver;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DriverDAO {
    private Connection conn;

    public DriverDAO(Connection conn) {
        super();
        this.conn = conn;
    }

    public int getDriverCount() {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM driver";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public List<Driver> getAllDrivers() {
        List<Driver> Drivers = new ArrayList<>();
        try {
            String sql = "SELECT * FROM driver";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Driver driver = new Driver();
                driver.setId(rs.getInt("id"));
                driver.setName(rs.getString("name"));
                driver.setCarModel(rs.getString("car_model"));
                driver.setVehicleNumber(rs.getString("vehicle_number"));
                driver.setPhoneNumber(rs.getString("phone_number"));
                Drivers.add(driver);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Drivers;
    }

    public boolean addDriver(Driver driver) {
        boolean f = false;
        try {
            String sql = "INSERT INTO driver (name, car_model, vehicle_number, phone_number) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, driver.getName());
            ps.setString(2, driver.getCarModel());
            ps.setString(3, driver.getVehicleNumber());
            ps.setString(4, driver.getPhoneNumber()); // New field
            int i = ps.executeUpdate();
            if (i == 1) f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean updateDriver(Driver driver) {
        boolean f = false;
        try {
            String sql = "UPDATE driver SET name=?, car_model=?, vehicle_number=?, phone_number=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, driver.getName());
            ps.setString(2, driver.getCarModel());
            ps.setString(3, driver.getVehicleNumber());
            ps.setString(4, driver.getPhoneNumber()); // New field
            ps.setInt(5, driver.getId());
            int i = ps.executeUpdate();
            if (i == 1) f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean deleteDriver(int id) {
        boolean f = false;
        try {
            String sql = "DELETE FROM driver WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            if (i == 1) f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean driverExists(int driverId) {
        try {
            String sql = "SELECT 1 FROM driver WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, driverId);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}