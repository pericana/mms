PrintWriter output;

void setUpDataManager() {
  File f = new File(dataPath("data.txt"));
  if (!f.exists()) {
    output = createWriter("data/data.txt");
  }
}

void saveData(int level, int mode, int isSuccess) {

  int toSave = 1;
  String existsData = getDataWithReturn();

  JSONObject jsonMainObject;
  try {
    jsonMainObject = parseJSONObject(existsData);
  }
  catch (Exception e) {
    jsonMainObject = new JSONObject();
  };

  JSONObject jsonLevelObject;
  try {
    jsonLevelObject = jsonMainObject.getJSONObject("level_" + level);
    jsonMainObject.remove("level_" + level);
  }
  catch (Exception e) {
    jsonLevelObject = new JSONObject();
  };

  try {
    int modeExists = jsonLevelObject.getInt("mode", 0);
    if (modeExists > mode) {
      toSave = 0;
    }
    jsonLevelObject.remove("mode" + mode);
  }
  catch (Exception e) {
  };

  jsonLevelObject.setInt("mode", mode);
  jsonMainObject.setJSONObject("level_" + level, jsonLevelObject);
  if (toSave == 1) {
    saveStrings("data/data.txt", new String[]{jsonMainObject.toString()});
  }
}

int[] getLevelsModeSuccess() {
  String existsData = getDataWithReturn();
  JSONObject jsonMainObject;
  try {
    jsonMainObject = parseJSONObject(existsData);
  }
  catch (Exception e) {
    return new int[]{0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  };

  int[] returnInt = new int[10];
  for (int i = 0; i < 10; i++) {


    try {
      JSONObject jsonLevelObject = jsonMainObject.getJSONObject("level_" + i);
      try {
        int modeExists = jsonLevelObject.getInt("mode", 0);
        returnInt[i] = modeExists;
      }
      catch (Exception e) {
        returnInt[i] = 0;
      };
    }
    catch (Exception e) {
      returnInt[i] = 0;
    };
  }
  
  return returnInt;
}

int getLevelModeSuccess(int level) {
  String existsData = getDataWithReturn();
  JSONObject jsonMainObject;
  try {
    jsonMainObject = parseJSONObject(existsData);
  }
  catch (Exception e) {
    return 0;
  };

  int returnInt = 0;
  try {
      JSONObject jsonLevelObject = jsonMainObject.getJSONObject("level_" + level);
      try {
        int modeExists = jsonLevelObject.getInt("mode", 0);
        returnInt = modeExists;
      }
      catch (Exception e) {
      };
    }
    catch (Exception e) {
    };
  
  return returnInt;
}

void getData() {
  String lines[] = loadStrings("data.txt");
  println("there are " + lines.length + " lines");
  for (int i = 0; i < lines.length; i++) {
    println(lines[i]);
  }
}

String getDataWithReturn() {
  String lines[] = loadStrings("data.txt");
  println("there are " + lines.length + " lines");
  for (int i = 0; i < lines.length; i++) {
    println(lines[i]);
  }
  if (lines.length == 0) {
    return "";
  }
  String returnString = "";
  for (String item : lines) {
    returnString = returnString + item;
  }
  return returnString;
}