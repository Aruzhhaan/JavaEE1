package db;

import model.Tasks;

import java.util.ArrayList;

public class DBManager {
    public static ArrayList<Tasks> tasksArrayList = new ArrayList<>();
    private static Long id = 2L;
    static {
        tasksArrayList.add(new Tasks(1L,"Create new application", "Do some task from Java EE","23.10.2021",true));
    }
    public static void addTask(Tasks task) {
        task.setId(id);
        tasksArrayList.add(task);
        id++;
    }
    public static Tasks getTask(Long id) {
      for(Tasks task: tasksArrayList) {
          if (task.getId()==id){
              return task;
          }
      }
      return null;
    }
    public static ArrayList<Tasks> getAllTasks() {
        return tasksArrayList;
    }
    public static void deleteTask(Long id) {
        for (int i = 0; i < tasksArrayList.size(); i++) {
            if (tasksArrayList.get(i).getId() == id) {
                tasksArrayList.remove(i);
            }
        }
    }
           public static Tasks updateTask(Long id, Tasks task){
            for (int i = 0; i < tasksArrayList.size() ; i++) {
                if (tasksArrayList.get(i).getId()==id){
                    tasksArrayList.set(i,task);
                }
            }
            return null;
        }
    }


