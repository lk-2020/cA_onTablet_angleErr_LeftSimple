Table table;
boolean studyDone = false;

void dataLoggerInit() {

  table = new Table();
  
  table.addColumn("id");
  table.addColumn("timeStamp");
  table.addColumn("xLeft");
  table.addColumn("yLeft"); 
  table.addColumn("xRight");
  table.addColumn("yRight"); 
  //saveTable(table, "\\sdcard\\new.csv");
}

void logData(int xL, int yL, int xR, int yR) {
  String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
  TableRow newRow = table.addRow();
  newRow.setInt("id", table.getRowCount() - 1);
  newRow.setString("timeStamp", timeStamp );
  newRow.setInt("xLeft", xL);
  newRow.setInt("yLeft", yL);
  newRow.setInt("xRight", xR);
  newRow.setInt("yRight", yR);
} 

void saveLoggedData() { 
  saveTable(table, "//sdcard/charAnim/withoutTangible_AE_L2.csv");
}
