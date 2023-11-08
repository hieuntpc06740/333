package javaapplication1;

import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Duy
 */
public class LoaiSanPham {
    int MaLoai;
    String TenLoai;
    
    public LoaiSanPham(int Ma, String Ten) {
        this.MaLoai = Ma;
        this.TenLoai = Ten;
    }
    
    public static ArrayList<LoaiSanPham> getListLoaiSP(){
        ArrayList<LoaiSanPham> ListLoaiSanPham = new ArrayList<>();
        try ( Connection conn = ConnectionHelper.getDBConnection()) {
            Statement statement = conn.createStatement();
            String query = "SELECT * FROM LoaiSanPham";
            ResultSet LoaiSanPhamData = statement.executeQuery(query);
            while(LoaiSanPhamData.next()){
                LoaiSanPham loaiSP = new LoaiSanPham(
                        LoaiSanPhamData.getInt("MaLoai"),
                        LoaiSanPhamData.getString("TenLoai")
                );
                ListLoaiSanPham.add(loaiSP);
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ListLoaiSanPham;
    }
}
