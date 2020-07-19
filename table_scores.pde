class table_scores {

  Table table= loadTable("Names_scores.csv", "header");

  boolean checkRows = false;

  table_scores() {
  }

  void table(String finalSaved) {
    total_score=(int)totalScore+(int)totalScore1+(int)totalScore2+(int)totalScore3+(int)totalScore4+(int)totalScore5+(int)totalScore6+(int)totalScore7;

    //Write data to a Table file
    if (checkRows==false) {
      TableRow new_row3=table.addRow();
      new_row3.setString(0, finalSaved);
      new_row3.setInt(1, total_score);
      table.sort(1);
      checkRows=true;
    }

    saveTable(table, "data/New_Names_scores.csv");
    int rowIndex=table.getRowCount()-1;
    for (int i=0; i<names.length; i++) {
      TableRow row=table.getRow(rowIndex);
      names[i]=row.getString(0);
      score[i]=row.getInt(1);
      rowIndex--;
    }
  }
}
