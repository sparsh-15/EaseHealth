package listeners;

import java.util.ArrayList;
import java.util.TreeSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import models.City;
import models.Day;
import models.Format;
import models.Unit;
import models.Specialization;
import utils.DBConnect;

@WebListener
public class AppListener implements ServletContextListener  {
       public void contextInitialized(ServletContextEvent ev) {
        ServletContext context = ev.getServletContext();

        // -- ############# Setup BMT DB ############# --
        DBConnect.dbURL = context.getInitParameter("dburl");
        DBConnect.dbUser = context.getInitParameter("dbuser");
        DBConnect.dbPassword = context.getInitParameter("dbpassword");

        // -- ############# Collect Cities ############ --
        TreeSet<City> cities = City.collectCities();
        context.setAttribute("cities", cities);

        ArrayList<Format> formats = Format.collectAllFormats();
        context.setAttribute("formats", formats);

        ArrayList<Unit> units = Unit.collectAllUnits();
        context.setAttribute("units", units);

        ArrayList<Specialization> specializations = Specialization.collectAllSpecializations();
        context.setAttribute("specializations", specializations);

        ArrayList<Day> days = Day.collectAllDays();
        context.setAttribute("days", days);
    }

    public void contextDestroyed(ServletContextEvent ev) {
        
    }
}
