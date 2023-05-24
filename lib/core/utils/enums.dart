// Create enums for the 2 types of data to be saved in our database
enum BoxType {
  boxJobsList,
  boxDarkMode,
  darkMode,
  jobsList;

  String name() {
    return toString();
  }
}
