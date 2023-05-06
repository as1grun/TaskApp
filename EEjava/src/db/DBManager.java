package db;

import model.Tasks;

import java.util.ArrayList;

public class DBManager {
    public static ArrayList<Tasks> tasksArrayList = new ArrayList<>();

    public static Long id = 2L;

    static {
        tasksArrayList.add(new Tasks(1L,"Create new project on React", "Create project on React and add technologies States and Props ","23.03.2023",false));
        tasksArrayList.add(new Tasks(1L,"New project on Java", "Create project on React and add technologies States and Props ","23.03.2023",false));
        tasksArrayList.add(new Tasks(1L,"Create new application on React", "Create project on React and add technologies States and Props ","23.03.2023",false));
        tasksArrayList.add(new Tasks(1L,"Mathematics exercise:10 page 102", "Find x and area ","23.03.2023",false));
        tasksArrayList.add(new Tasks(1L,"Create new project on React", "Create project on React and add technologies States and Props ","23.03.2023",false));
        tasksArrayList.add(new Tasks(1L,"Create new project on React", "Create project on React and add technologies States and Props ","23.03.2023",false));
        tasksArrayList.add(new Tasks(1L,"Create new project on React", "Create project on React and add technologies States and Props ","23.03.2023",false));
        tasksArrayList.add(new Tasks(1L,"Create new project on React", "Create project on React and add technologies States and Props ","23.03.2023",false));
        tasksArrayList.add(new Tasks(1L,"Create new project on React", "Create project on React and add technologies States and Props ","23.03.2023",false));
        tasksArrayList.add(new Tasks(1L,"Create new project on React", "Create project on React and add technologies States and Props ","23.03.2023",false));
    }
    public static ArrayList<Tasks> getAllTasks(){
        return tasksArrayList;
    }

    public static void addTasks(Tasks task){
        task.setId(id);
        tasksArrayList.add(task);
        id++;
    }

    public static Tasks getTask(Long id) {
        for (Tasks task : tasksArrayList) {
            if (task.getId()==id){
                return task;
            }
        }
        return null;
    }
    public static void deleteTask(Long id){
        for (int i = 0; i < tasksArrayList.size(); i++) {
            if (tasksArrayList.get(i).getId()==id){
                tasksArrayList.remove(i);
            }
        }
    }
    public static Tasks updateTask(Long id, Tasks task){
        for (int i = 0; i < tasksArrayList.size(); i++) {
            if (tasksArrayList.get(i).getId()==id){
                tasksArrayList.set(i,task);
            }
            i++;
        }
        return null;
    }
}


