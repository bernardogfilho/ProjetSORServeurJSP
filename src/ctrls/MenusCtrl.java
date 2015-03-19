package ctrls;
import beans.Menu;
import rmi.DatabaseInterface;

import java.rmi.Naming;
import java.util.ArrayList;


public class MenusCtrl {

	
	
	
	public MenusCtrl() {
	}

	public ArrayList<Menu> getMenus() throws Exception {
		String nomService = "rmi://localhost:1099/Database";
		DatabaseInterface obj = (DatabaseInterface) Naming.lookup(nomService);
		return obj.getMenus();
	}
	
}
