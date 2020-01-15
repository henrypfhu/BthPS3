﻿using System.Diagnostics;
using System.Windows.Navigation;
using AdonisUI.Controls;

namespace BthPS3CfgUI
{
    /// <summary>
    ///     Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : AdonisWindow
    {
        public MainWindow()
        {
            InitializeComponent();

            DataContext = new ProfileDriverSettingsViewModel();
        }

        private void Hyperlink_OnRequestNavigate(object sender, RequestNavigateEventArgs e)
        {
            Process.Start(e.Uri.ToString());
        }
    }
}