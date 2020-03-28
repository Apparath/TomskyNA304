using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data.SqlClient;

namespace WpfApp3.Pages
{
    /// <summary>
    /// Логика взаимодействия для Auth.xaml
    /// </summary>
    public partial class Auth : Page
    {
        public string connection = PublicSQLCon.str_connect;
     
        public Auth()
        {
            InitializeComponent();
        }

        private void btnEnter_Click(object sender, RoutedEventArgs e)
        {
            using (SqlConnection sqlConnection = new SqlConnection(connection))
            {
                try
                {
                    sqlConnection.Open();

                    using(SqlCommand sqlCommand = sqlConnection.CreateCommand())
                    {
                        sqlCommand.CommandText = string.Format("SELECT [Login], [Password], [Role_name] FROM Users WHERE [Login]=@login AND [Password]=@password");

                        if (string.IsNullOrEmpty(tbLogin.Text) || string.IsNullOrEmpty(tbPassword.Text))
                        {
                            MessageBox.Show("Введите логин и пароль!");
                            return;
                        }

                        sqlCommand.Parameters.AddWithValue("@login", tbLogin.Text);
                        sqlCommand.Parameters.AddWithValue("@password", tbPassword.Text);

                        int count = 0;

                        using (SqlDataReader sqlDataReader = sqlCommand.ExecuteReader())
                        {
                            while (sqlDataReader.Read())
                            {
                                count++;

                                if (count == 0)
                                    MessageBox.Show("Неверный логин или пароль!");
                                else
                                {
                                    MessageBox.Show("Подключаемся к пользователю...");
                                }


                                switch (sqlDataReader[2])
                                {
                                    case "Заказчик":
                                        NavigationService?.Navigate(new POrder());
                                        break;
                                    case "Менеджер":
                                        NavigationService?.Navigate(new PManager());
                                        break;
                                    case "Мастер":
                                        NavigationService?.Navigate(new PMaster());
                                        break;
                                    case "Заместитель директора":
                                        NavigationService?.Navigate(new PTempDirector());
                                        break;
                                    case "Директор":
                                        NavigationService?.Navigate(new PDirector());
                                        break;
                                    default:
                                        MessageBox.Show("Переход не выполнен!");
                                        break;
                                }
                                return;
                            }
                        }

                    }
                }
                catch (SqlException)
                {
                    MessageBox.Show("Соединение не подключено!");
                }
            }
        }

        private void btnRegistry_Click(object sender, RoutedEventArgs e)
        {
            NavigationService?.Navigate(new Registry());
        }
    }
}
