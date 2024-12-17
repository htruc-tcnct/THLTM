package model.bo;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dao.CheckLoginDAO;

public class CheckLoginBO {
    CheckLoginDAO checkLoginDAO = new CheckLoginDAO();

    public String isValidUser(String userName, String password) throws ClassNotFoundException, SQLException {
        return checkLoginDAO.isExistUser(userName, password);
    }
}
