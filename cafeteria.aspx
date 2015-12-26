
<%@ Page Language="C#" Debug="true"
  ViewStateMode="Disabled" EnableSessionState="false"
  CodeFile="cafeteria.aspx.cs" Inherits="MenuManager" %>
<!doctype html>
<html>
<head>
<title>Cafeteria Manager</title>
<style>
  body {
    background-color: peachpuff;    
  }

  .link {
    text-align: left;
  }

  h1 {
     text-align: center;
   }

  .shape {
     border-style: none;
     box-shadow: 1px 1px 1px #111111;     
  }
</style>
</head>

<body>
<h1>Park University Cafeteria Menu: <br> 
  Supervisor Web Page</h1>
<hr>
<form runat="server">
  <asp:Table BorderStyle="none" HorizontalAlign="Center"
    BackColor="peachpuff" CellSpacing="1" 
    CellPadding="6" Width="350" runat="server">
    <asp:TableHeaderRow>
      <asp:TableCell ColumnSpan="2"
        Text="Add a new meal" Font-Bold="true" 
        Font-Size="Large" ForeColor="DarkRed">
      </asp:TableCell>
    </asp:TableHeaderRow> 
    <asp:TableRow VerticalAlign="top" runat="server">      
      <asp:TableCell runat="server">
        <asp:Table runat="server">
          <asp:TableRow runat="server">
            <asp:TableCell Text="Day of the week: " 
              runat="server"/>
            <asp:TableCell runat="server">
            <asp:TextBox id="txt1DayOfWeek" runat="server"/>
            </asp:TableCell>
          </asp:TableRow>
          <asp:TableRow runat="server">
            <asp:TableCell Text="Meal of the day: " runat="server"/>
            <asp:TableCell runat="server">
              <asp:TextBox id="txt1Meal" runat="server"/>
            </asp:TableCell>
          </asp:TableRow>
          <asp:TableRow runat="server">
            <asp:TableCell Text="Item to be served: " runat="server"/>
            <asp:TableCell runat="server">
              <asp:TextBox id="txt1Item" runat="server"/>
            </asp:TableCell>            
          </asp:TableRow>
          <asp:TableRow>
            <asp:TableCell ColumnSpan="2" Height="40px" 
              runat="server">
            <asp:Button id="btnNew" BackColor="DarkRed" 
              ForeColor="White" Text="Add" CssClass="shape"     
              OnClick="NewItem" runat="server"/>
            </asp:TableCell>
          </asp:TableRow>
        </asp:Table><hr />
      </asp:TableCell>
    </asp:TableRow>
  </asp:Table>
  <br />

  <asp:Table BorderStyle="none"
    BackColor="PeachPuff" CellSpacing="1" 
    HorizontalAlign="Center" 
    CellPadding="6" Width="350" runat="server">
    <asp:TableHeaderRow runat="server">
      <asp:TableCell ColumnSpan="2"
        Text="Delete an existing meal" Font-Bold="true" 
        Font-Size="Large" ForeColor="DarkRed" 
        runat="server">
      </asp:TableCell>
    </asp:TableHeaderRow>  
    <asp:TableRow runat="server">
      <asp:TableCell Text="Select an item to delete: " 
        runat="server">
      </asp:TableCell>
    </asp:TableRow>  
    <asp:TableRow VerticalAlign="top" runat="server">
      <asp:TableCell runat="server">
        <asp:Table runat="server">
          <asp:TableRow runat="server">
            <asp:TableCell runat="server">
              <asp:ListBox id="lb1Names"
                AutoPostBack="true" Width="260" 
                ViewStateMode="Enabled"
                OnSelectedIndexChanged="SelectDeleteItem"
                runat="server"/>
              </asp:TableCell>
          </asp:TableRow>
          <asp:TableRow runat="server">
            <asp:TableCell ColumnSpan="2" Height="40px" 
              runat="server">
              <asp:Button id="btnDelete" BackColor="DarkRed" 
                 ForeColor="White" Text="Delete" CssClass="shape"
                 OnClick="DeleteItem" runat="server" />         
            </asp:TableCell>
          </asp:TableRow>
        </asp:Table><hr>
      </asp:TableCell>
    </asp:TableRow>
  </asp:Table>
  <br />

  <asp:Table BorderStyle="none" BackColor="PeachPuff" 
    CellSpacing="1" CellPadding="6" 
    HorizontalAlign="Center" Width="350"
    runat="server">
    <asp:TableHeaderRow runat="server">
      <asp:TableCell ColumnSpan="2"
        Text="Update an existing meal" Font-Bold="true" 
        Font-Size="Large" ForeColor="DarkRed" 
        runat="server">
      </asp:TableCell>      
    </asp:TableHeaderRow>
    <asp:TableRow runat="server">
      <asp:TableCell Text="Select an item to update: " 
        runat="server">
      </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow runat="server">
      <asp:TableCell runat="server">
        <asp:ListBox id="lb2Names"
          AutoPostBack="true" ViewStateMode="Enabled" 
          Width="260"
          OnSelectedIndexChanged="SelectUpdateItem"
          runat="server"/>
      </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow runat="server">
      <asp:TableCell Text="Enter a new information: " runat="server"/>
    </asp:TableRow>
    <asp:TableRow runat="server">
      <asp:TableCell runat="server">
        <asp:Table runat="server">
          <asp:TableRow runat="server">
            <asp:TableCell Text="Day of the week: " runat="server"/>
            <asp:TableCell runat="server">
              <asp:TextBox id="txt2DayOfWeek" runat="server"/>
            </asp:TableCell>
          </asp:TableRow>
          <asp:TableRow runat="server">
            <asp:TableCell Text="Meal of the day: " runat="server"/>
            <asp:TableCell runat="server">
              <asp:TextBox id="txt2Meal" runat="server"/>
            </asp:TableCell>
          </asp:TableRow>
          <asp:TableRow runat="server">
            <asp:TableCell Text="Item to be served: " runat="server"/>
            <asp:TableCell runat="server">
              <asp:TextBox id="txt2Item" runat="server"/>
            </asp:TableCell>
          </asp:TableRow>
          <asp:TableRow runat="server">
            <asp:TableCell ColumnSpan="2" Height="40px" runat="server">
            <asp:Button id="btnUpdate" BackColor="DarkRed" 
              ForeColor="White" Text="Update" CssClass="shape"
              OnClick="UpdateItem" runat="server"/>
            </asp:TableCell>
          </asp:TableRow>
          <asp:TableRow Height="40px" runat="server">
            <asp:TableCell ColumnSpan="2" runat="server"><hr>
            <asp:HyperLink NavigateUrl="MenuGrid.aspx" 
              ForeColor="DarkRed" CssClass="link"
              Font-Size="Medium" Font-Underline="false"
              Text="Submit and view the entire menu" 
              Target="_blank" Font-Bold="true" runat="server"/>
            </asp:TableCell>
          </asp:TableRow> 
        </asp:Table>
      </asp:TableCell>
    </asp:TableRow>
  </asp:Table>
  <br>

  <asp:Label id="message" runat="server"/>
</form>
</body>
</html>
