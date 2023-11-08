package javaapplication1;
import java.sql.*;
import java.util.ArrayList;

public class SanPham {
    int MaSanPham;
    String TenSanPham;
    int GiaTien;
    String XuatXu;
    int MaLoai;
    LoaiSanPham Loai;
    
    public SanPham(int Ma, String Ten, int Gia, String XuatXu, LoaiSanPham Loai ){
        this.MaSanPham = Ma;
        this.TenSanPham = Ten;
        this.GiaTien = Gia;
        this.XuatXu = XuatXu;
        this.MaLoai = Loai.MaLoai;
        this.Loai = Loai;
    }

    public static ArrayList<SanPham> getListSP() {
        ArrayList<SanPham> ListSanPham = new ArrayList<>();
        try ( Connection conn = ConnectionHelper.getDBConnection()) {
            Statement statement = conn.createStatement();
            String query = "SELECT SanPham.*, LoaiSanPham.TenLoai "
                    + "FROM SanPham "
                    + "JOIN LoaiSanPham "
                    + "ON SanPham.Loai = LoaiSanPham.MaLoai";
            ResultSet SanPhamData = statement.executeQuery(query);
            while(SanPhamData.next()){
                SanPham sanPham = new SanPham(
                        SanPhamData.getInt("MaSanPham"),
                        SanPhamData.getString("TenSanPham"),
                        SanPhamData.getInt("GiaTien"),
                        SanPhamData.getString("XuatXu"),
                        new LoaiSanPham(
                                SanPhamData.getInt("Loai"),
                                SanPhamData.getString("TenLoai"))
                );
                ListSanPham.add(sanPham);
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ListSanPham;
    }
    
    public static boolean addSanPham(SanPham spThem){
        try ( Connection conn = ConnectionHelper.getDBConnection()) {
            conn.setAutoCommit(false);
            String query = "INSERT INTO SanPham VALUES(?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setInt(1, spThem.MaSanPham);
            statement.setString(2, spThem.TenSanPham);
            statement.setInt(3, spThem.GiaTien);
            statement.setString(4, spThem.XuatXu);
            statement.setInt(5, spThem.Loai.MaLoai);
            if(statement.executeUpdate() == 1) {
                conn.commit();
                conn.close();
                return true;
            } else {
                conn.rollback();
                conn.close();
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public static boolean updateSanPham(SanPham spCapNhat){
        try ( Connection conn = ConnectionHelper.getDBConnection()) {
            conn.setAutoCommit(false);
            String query = "UPDATE SanPham SET "
                    + "TenSanPham=?, GiaTien=?, Loai=?, XuatXu=? "
                    + "WHERE MaSanPham=?";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, spCapNhat.TenSanPham);
            statement.setInt(2, spCapNhat.GiaTien);
            statement.setInt(3, spCapNhat.Loai.MaLoai);
            statement.setString(4, spCapNhat.XuatXu);
            statement.setInt(5, spCapNhat.MaSanPham);
            if(statement.executeUpdate() == 1) {
                conn.commit();
                conn.close();
                return true;
            } else {
                conn.rollback();
                conn.close();
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public static boolean deleteSanPham(int MaSanPham){
        try ( Connection conn = ConnectionHelper.getDBConnection()) {
            conn.setAutoCommit(false);
            Statement statement = conn.createStatement();
            String query = "DELETE FROM SanPham WHERE MaSanPham = " + MaSanPham;
            if(statement.executeUpdate(query) == 1) {
                conn.commit();
                conn.close();
                return true;
            } else {
                conn.rollback();
                conn.close();
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
