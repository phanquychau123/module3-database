package serviceImpl;

import Dao.IManagerDao;
import DaoImpl.ManagerDaoImpl;
import Service.IStudentService;

public class StudentService implements IStudentService {
    IManagerDao managerDao = new ManagerDaoImpl();
    @Override
    public void creat() {
        managerDao.create();
    }

    @Override
    public void read() {
        managerDao.read();
    }

    @Override
    public void update() {
        managerDao.update();
    }

    @Override
    public void delete() {
        managerDao.delete();
    }
}
