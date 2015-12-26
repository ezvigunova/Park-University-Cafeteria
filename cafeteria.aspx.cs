
using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class MenuManager : Page
{
  SqlConnection connection;
  SqlCommand command;
  SqlDataReader reader;

  public void Page_Load()
  {
    string connectionString =
      "Data Source = localhost\\SQLEXPRESS;" +
      " Initial Catalog = menu;" +
      " Integrated Security = SSPI";
    connection = new SqlConnection(connectionString);
    if (!IsPostBack)
    {
      CalibrateControls();
    }
  } // end Page_Load

  //*********************************************************

  // Bind menu_item's table data to controls, disable delete and
  // update buttons, and clear update text boxes.

  private void CalibrateControls()
  {
    command = new SqlCommand(
      "SELECT ItemID, Concat(DayOfWeek, ', ', Meal, ', ', Item) AS Meal" +
      " FROM menu_items" + " WHERE ItemID > 0" +
      " ORDER BY Meal", connection);
    connection.Open();

    // Bind the delete meal list box.

    reader = command.ExecuteReader();
    lb1Names.DataSource = reader;
    lb1Names.DataTextField = "Meal";
    lb1Names.DataValueField = "ItemID";
    lb1Names.DataBind();
    reader.Close();

    // Bind the update meal list box.

    reader = command.ExecuteReader();
    lb2Names.DataSource = reader;
    lb2Names.DataTextField = "Meal";
    lb2Names.DataValueField = "ItemID";
    lb2Names.DataBind();
    reader.Close();
    connection.Close();

    // Now that the list boxes have been cleared with no
    // selections, disable the Delete and Update buttons
    // and clear the update text boxes.

    btnDelete.Enabled = false;
    btnDelete.ForeColor = System.Drawing.Color.Gray;
    btnUpdate.Enabled = false;
    btnUpdate.ForeColor = System.Drawing.Color.Gray;

    txt2DayOfWeek.Text = "";
    txt2Meal.Text = "";
    txt2Item.Text = "";
  } // end CalibrateControls

  //*********************************************************

  // Insert a new meal item.

  public void NewItem(object s, EventArgs e)
  {
    command = new SqlCommand(
      "INSERT INTO menu_items (ItemID, DayOfWeek, Meal, Item)" +
      " SELECT MAX(ItemID)+1, @DayOfWeek, @Meal, @Item" +
      " FROM menu_items", connection);
    command.Parameters.AddWithValue("@DayOfWeek", txt1DayOfWeek.Text);
    command.Parameters.AddWithValue("@Meal", txt1Meal.Text);
    command.Parameters.AddWithValue("@Item", txt1Item.Text);
    OpenAndExecute();
  } // end NewItem

  //*********************************************************

  // Handle a menu item being clicked in Delete list box.

  public void SelectDeleteItem(object s, EventArgs e)
  {
    // Disable the update controls

    btnUpdate.Enabled = false;
    btnUpdate.ForeColor = System.Drawing.Color.Gray;
    lb2Names.SelectedIndex = -1;
    txt2DayOfWeek.Text = "";
    txt2Meal.Text = "";
    txt2Item.Text = "";
  } // end SelectDeleteItem

  //*********************************************************

  // Remove selected menu item from database.

  public void DeleteItem(object s, EventArgs e)
  {
    command = new SqlCommand(
      "DELETE FROM menu_items WHERE ItemID=@ItemID", connection);
    command.Parameters.AddWithValue("@ItemID", lb1Names.SelectedValue);
    OpenAndExecute();
  } // end DeleteItem

  //*********************************************************

  // Retrieve selected menu item from database and display it.

  public void SelectUpdateItem(object s, EventArgs e)
  {
    command = new SqlCommand(
      "SELECT * FROM menu_items" +
      " WHERE ItemID=@ItemID", connection);
    command.Parameters.AddWithValue(
      "@ItemID", lb2Names.SelectedValue);
    connection.Open();
    reader = command.ExecuteReader();

    while (reader.Read())
    {
      txt2DayOfWeek.Text = (string)reader["DayOfWeek"];
      txt2Meal.Text = (string)reader["Meal"];
      txt2Item.Text = (string)reader["Item"];
    }
    reader.Close();
    connection.Close();

    // Disable the delete controls

    btnDelete.Enabled = false;
    btnDelete.ForeColor = System.Drawing.Color.Gray;
    lb1Names.SelectedIndex = -1;
  } // end SelectUpdateItem

  //*********************************************************

  // Update an existing menu item.

  public void UpdateItem(object s, EventArgs e)
  {
    command = new SqlCommand(
      "UPDATE menu_items SET DayOfWeek=@DayOfWeek, Meal=@Meal," +
      " Item=@Item WHERE ItemID=@ItemID",
    connection);
    command.Parameters.AddWithValue("@DayOfWeek", txt2DayOfWeek.Text);
    command.Parameters.AddWithValue("@Meal", txt2Meal.Text);
    command.Parameters.AddWithValue("@Item", txt2Item.Text);
    command.Parameters.AddWithValue("@ItemID", lb2Names.SelectedValue);
    OpenAndExecute();
  } // end UpdateItem

  //*********************************************************

  // Open the database connection, execute the current
  // command, and reset the controls.

  private void OpenAndExecute()
  {
    try
    {
      connection.Open();
      command.ExecuteNonQuery();
      connection.Close();
      CalibrateControls();
    }
    catch (Exception err)
    {
      message.Text = err.Message;
      connection.Close();
    }
  } // end OpenAndExecute
} // end MenuManager
