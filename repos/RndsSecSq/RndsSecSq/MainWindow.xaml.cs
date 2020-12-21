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

namespace RndsSecSq
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        double Find_S(double x1, double y1, double r1, double x2, double y2, double r2)
        {
            double d = Math.Sqrt(((x1 - x2) * (x1 - x2)) + ((y1 - y2) * (y1 - y2)));

            if (d > r1 + r2)
            {
                MessageBox.Show("Круги не пересекаются!");

                return 0;
            }
            else if (d < Math.Abs(r1 - r2))
            {
                MessageBox.Show("Круг лежит внутри круга!");

                return 0;
            }
            else if ((d == r1 + r2))
            {
                if(r1 == 0 && r2 == 0)
                {
                    MessageBox.Show("Значения радиусов не заданы!");

                    return 0;
                }
                else
                {
                    MessageBox.Show("Круг лишь касается круга!");

                    return 0;
                }    
            }
            else
            {
                double f1 = 2 * Math.Acos(((r1 * r1) - (r2 * r2) + (d * d)) / (2 * r1 * d));
                double f2 = 2 * Math.Acos(((r2 * r2) - (r1 * r1) + (d * d)) / (2 * r2 * d));

                if ((f1 / 2 <= 1) || (f1 / 2 >= -1) || (f2 / 2 <= 1) || (f2 / 2 >= -1))
                {
                    double s1 = ((r1 * r1) * (f1 - Math.Sin(f1))) / 2;
                    double s2 = ((r2 * r2) * (f2 - Math.Sin(f2))) / 2;

                    MessageBox.Show("Площадь пересечения найдена!");

                    return s1 + s2;
                }
            }
        }

        private void Calc_S(object sender, RoutedEventArgs e)
        {
            if (!double.TryParse(X1.Text, out double resX1) && !X1.Text.Contains(".")
                || !double.TryParse(Y1.Text, out double resY1) && !Y1.Text.Contains(".")
                    || !double.TryParse(R1.Text, out double resR1) && !R1.Text.Contains(".") || R1.Text.Contains("-")

            || !double.TryParse(X2.Text, out double resX2) && !X2.Text.Contains(".")
                || !double.TryParse(Y2.Text, out double resY2) && !Y2.Text.Contains(".")
                    || !double.TryParse(R2.Text, out double resR2) && !R2.Text.Contains(".") || R2.Text.Contains("-"))
                    
                    MessageBox.Show("Введите верные значения!");
            else
            {
                double x1 = Convert.ToDouble(X1.Text);
                    double y1 = Convert.ToDouble(Y1.Text);
                        double r1 = Convert.ToDouble(R1.Text);

                double x2 = Convert.ToDouble(X2.Text);
                    double y2 = Convert.ToDouble(Y2.Text);
                        double r2 = Convert.ToDouble(R2.Text);

                S.Text = Find_S(x1, y1, r1, x2, y2, r2).ToString();
            }
        }

        private void lostFocus(object sender, RoutedEventArgs e)
        {
            ((TextBox)sender).Text = ((TextBox)sender).Text.Replace(".", ",");

            if (((TextBox)sender).Text.StartsWith(",")) ((TextBox)sender).Text = "0" + ((TextBox)sender).Text;
            if (((TextBox)sender).Text.EndsWith(",")) ((TextBox)sender).Text = ((TextBox)sender).Text + "0";
        }

        private void textChanged(object sender, TextChangedEventArgs e)
        {
            if (((TextBox)sender).Text.Length > 13)
            {
                MessageBox.Show("Выход за предел ограничения по символам!");
                ((TextBox)sender).Text = "0,0";
            }
        }
    }
}
