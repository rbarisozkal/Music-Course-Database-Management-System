import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
import java.sql.Connection;
public class MusicCourseDepartment {

	private static Connection connect = null;
	private static Statement statement= null;
	private static ResultSet resultSet=null;
	
	final private static String host="jdbc:postgresql://10.98.98.61:5432/group20";
	final private static String user= "group20";
	final private static String password="q-&MqJH@@^BRsK3-";
	
	public static void main(String[] args) throws SQLException {		
		Scanner sc = new Scanner (System.in);		
		try {
			connect = DriverManager.getConnection(host,user,password);
			System.out.println("Java JDBC PostgreSQL Example");
			System.out.println("Connected to PostgreSQL database!");
			System.out.println("-----------------------------------------");
			statement=connect.createStatement();		
			boolean exit = true;
			
			while(exit) {			
				System.out.println("Which operation do you want to do?");
				System.out.println("-----------------------------------------");
				printMenu();
				String choice = sc.nextLine();
				switch(choice) {
				case "q":
					exit=false;
					System.out.print("Exiting the database");
					printDot();
					System.out.println();
					System.out.println("Goodbye!");
					break;
				case "1":
					System.out.println("Which department do you want to enter: ");
					String Dept_Name = sc.nextLine();
					Dept_Name=capitalize(Dept_Name);
					System.out.println("Which Instrument do you want to enter: ");					
					String Instrument_Name=sc.nextLine();
					Instrument_Name=capitalize(Instrument_Name);
					System.out.println("Which material will be used: ");
					String material=sc.nextLine();
					material=material.toUpperCase().charAt(0)+material.substring(1,material.length());
					statement.executeUpdate("insert into \"Instruments\""							
							+"values ('"+Dept_Name+"','"+Instrument_Name+"','"+material+"')");					
					System.out.print("Trying to add");
					printDot();
					System.out.println();
					System.out.println("Successfully added! ");
					break;
				case "2":
					resultSet=statement.executeQuery("select * from \"Instruments\" ");
					System.out.print("Trying to listing");
					printDot();
					writeResultSet(resultSet);				
					break;
				case "3":
					System.out.println("What is the first name of the instructor do you want to delete from Instructors table ? ");
					String instructorName = sc.nextLine();
					instructorName = instructorName.toUpperCase().charAt(0)+instructorName.substring(1,instructorName.length());
					try {
						statement.executeUpdate("delete from \"Instructors\" i where i.\"Inst_Name\"= \'"+instructorName+"\'");
						System.out.print("Trying to delete...");
						printDot();
						System.out.println();
						System.out.println("Successfully deleted! ");
					}
					catch(Exception e){						
						System.out.println("You can not delete an instructor that a currently teaching. Please enter available one.");
					}					
					break;
				case "4":
					resultSet=statement.executeQuery("select * from \"Instructors\" ");
					System.out.print("Trying to listing");
					printDot();
					writeResultSet(resultSet);
					break;
				case "5":
					System.out.println("What is the section's section number time do you want to update from Section table ? ");
					String sectionNumber = sc.nextLine();
					System.out.println("What is the course's title? ");
					String courseTitle=sc.nextLine();
					courseTitle = courseTitle.toUpperCase().charAt(0)+courseTitle.substring(1,courseTitle.length());
					System.out.println("What is the clasroom's code? ");
					String classroomNumber=sc.nextLine();
					System.out.println("What is the time that you want to arrange? (hh:mm:ss)");
					String time= sc.nextLine();
					System.out.println();
					statement.executeUpdate("UPDATE public.\"Section\" SET \"Clock\"='"+time+"'"+" where \"Section_ID\"='"+sectionNumber
							+"' and \"Instrument_Name\" ='"+courseTitle+"' and \"Classroom_ID\"='"+classroomNumber+"';");
					System.out.print("Trying to update");
					printDot();
					System.out.println();
					System.out.println("Successfully updated! ");
					break;
				case "6":
					resultSet=statement.executeQuery("select * from \"Section\" ");
					System.out.print("Trying to listing");
					printDot();
					writeResultSet(resultSet);
					break;
				}				
			}
		}
		catch(SQLException e) {
			System.out.println("Connection failure.");
			e.printStackTrace();
		}
		finally {
			close();
		}
		
		
	}
	private static String capitalize(String name) {
		String capitalizedName = name.toUpperCase().charAt(0)+name.substring(1,name.length());
		return capitalizedName;
	}
	public static void printMenu() {
		String operations = "1.Insert an instrument to table Instruments\n"
							+"2.List the Instruments table\n"
							+"3.Delete an instructor from table Instructors\n"
							+"4.List the Instructors table\n"
							+"5.Update a section(time) on Section table\n"
							+"6.List Section table\n"
							+"Enter q for exit\n";
		System.out.println(operations);		
	}
	private static void writeResultSet(ResultSet resultSet) throws SQLException{
        ResultSetMetaData rsmd= resultSet.getMetaData();
        int count=rsmd.getColumnCount();
        System.out.println();
        System.out.print("(");
        for (int i=1; i<=count;i++) {
            System.out.print(rsmd.getColumnName(i));
            if(i!=count) {
                System.out.print("-----");
            }
        }
        System.out.print(")");
         System.out.println();
         System.out.println("________________________________________________________________________");
        while(resultSet.next()) {
        	System.out.print("(");
            for(int i = 1; i<=count;i++) {           	
                System.out.print(resultSet.getString(i));
                if(i!=count) {
                    System.out.print("--------");
                }               
            }
            System.out.print(")");
            System.out.println();
        }
        System.out.println("________________________________________________________________________");
    }
	private static void close() {
		try {
			if(resultSet!=null) {
				resultSet.close();
			}
			if(statement!=null) {
				statement.close();
				
			}
			if(connect!=null) {
				connect.close();
			}
		}catch(Exception e) {
				
			}
		}
	private static void printDot() {
		for(int i = 0 ; i < 3 ; i++){
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			System.out.print(".");
		}
	}
}
