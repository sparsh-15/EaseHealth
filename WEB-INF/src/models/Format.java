package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.DBConnect;

public class Format {
    private Integer formatId;
    private String name;

    public Format(Integer formatId, String name) {
        this.formatId = formatId;
        this.name = name;
    }

    public Format(Integer formatId) {
        this.formatId = formatId;
    }

    public static ArrayList<Format> collectAllFormats() {
        ArrayList<Format> formats = new ArrayList<>();

        Connection con = DBConnect.getConnection();
        String query = "select * from formats";

        try {
            PreparedStatement ps = con.prepareStatement(query);
            
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                formats.add(new Format(rs.getInt("format_id"), rs.getString("name")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return formats;
    }

    public Integer getFormatId() {
        return formatId;
    }

    public void setFormatId(Integer formatId) {
        this.formatId = formatId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
