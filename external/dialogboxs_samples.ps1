#Copyright (c) 2015 Serguei Kouzmine
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in
#all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#THE SOFTWARE.

Add-Type -TypeDefinition @"
using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;

namespace DialogBoxs
{
    public class TextInputBox
    {
        private static Form frmInputDialog;
        private static Label lblPrompt;
        private static Button btnOK;
        private static Button btnCancel;
        private static TextBox txtInput;
        private static string _formCaption;
        private static string _formPrompt;
        private static DialogResult _outputResponse;
        private static string _defaultValue;
        private static int _ParentFormWidth;
        private static int _ParentFormHeight;
        private static int _ParentFormXPosition;
        private static int _ParentFormYPosition;
        private static int _XPos;
        private static int _YPos;
        private static string _Text;

        private static string DefaultValue
        {
            set
            {
                TextInputBox._defaultValue = value;
            }
        }

        private static string FormCaption
        {
            set
            {
                TextInputBox._formCaption = value;
            }
        }

        private static string FormPrompt
        {
            set
            {
                TextInputBox._formPrompt = value;
            }
        }

        private static DialogResult OutputResponse
        {
            get
            {
                return TextInputBox._outputResponse;
            }
            set
            {
                TextInputBox._outputResponse = value;
            }
        }

        private static int ParentFrmHeight
        {
            set
            {
                if (value >= 0)
                {
                    TextInputBox._ParentFormHeight = value;
                }
            }
        }

        private static int ParentFrmWidth
        {
            set
            {
                if (value >= 0)
                {
                    TextInputBox._ParentFormWidth = value;
                }
            }
        }

        private static int ParentFrmXPosition
        {
            set
            {
                if (value >= 0)
                {
                    TextInputBox._ParentFormXPosition = value;
                }
            }
        }

        private static int ParentFrmYPosition
        {
            set
            {
                if (value >= 0)
                {
                    TextInputBox._ParentFormYPosition = value;
                }
            }
        }

        public string Text
        {
            get
            {
                return TextInputBox._Text;
            }
        }

        private static int XPosition
        {
            set
            {
                if (value >= 0)
                {
                    TextInputBox._XPos = value;
                }
            }
        }

        private static int YPosition
        {
            set
            {
                if (value >= 0)
                {
                    TextInputBox._YPos = value;
                }
            }
        }

        static TextInputBox()
        {
            TextInputBox._formCaption = string.Empty;
            TextInputBox._formPrompt = string.Empty;
            TextInputBox._defaultValue = string.Empty;
            TextInputBox._ParentFormWidth = -1;
            TextInputBox._ParentFormHeight = -1;
            TextInputBox._ParentFormXPosition = -1;
            TextInputBox._ParentFormYPosition = -1;
            TextInputBox._XPos = -1;
            TextInputBox._YPos = -1;
            TextInputBox._Text = string.Empty;
        }

        public TextInputBox()
        {
        }

        private static void btnCancel_Click(object sender, EventArgs e)
        {
            TextInputBox.OutputResponse = DialogResult.Cancel;
            TextInputBox._Text = string.Empty;
            TextInputBox.frmInputDialog.Dispose();
        }

        private static void btnOK_Click(object sender, EventArgs e)
        {
            TextInputBox.OutputResponse = DialogResult.OK;
            TextInputBox._Text = TextInputBox.txtInput.Text;
            TextInputBox.frmInputDialog.Dispose();
        }

        private static void InitializeComponent()
        {
            TextInputBox.frmInputDialog = new Form();
            TextInputBox.lblPrompt = new Label();
            TextInputBox.btnOK = new Button();
            TextInputBox.btnCancel = new Button();
            TextInputBox.txtInput = new TextBox();
            TextInputBox.frmInputDialog.SuspendLayout();
            TextInputBox.lblPrompt.Anchor = AnchorStyles.Top | AnchorStyles.Bottom | AnchorStyles.Left | AnchorStyles.Right;
            TextInputBox.lblPrompt.BackColor = SystemColors.Control;
            TextInputBox.lblPrompt.Font = new Font("Microsoft Sans Serif", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0);
            TextInputBox.lblPrompt.Location = new Point(12, 9);
            TextInputBox.lblPrompt.Name = "lblPrompt";
            TextInputBox.lblPrompt.Size = new Size(302, 82);
            TextInputBox.lblPrompt.TabIndex = 3;
            TextInputBox.lblPrompt.Font = new Font("Tahoma", 8.25f, FontStyle.Bold, GraphicsUnit.Point, 0);
            TextInputBox.btnOK.DialogResult = DialogResult.OK;
            TextInputBox.btnOK.FlatStyle = FlatStyle.Standard;
            TextInputBox.btnOK.Location = new Point(326, 8);
            TextInputBox.btnOK.Name = "btnOK";
            TextInputBox.btnOK.Size = new Size(64, 24);
            TextInputBox.btnOK.TabIndex = 1;
            TextInputBox.btnOK.Text = "&OK";
            TextInputBox.btnOK.Click += new EventHandler(TextInputBox.btnOK_Click);
            TextInputBox.btnOK.Font = new Font("Tahoma", 8.25f, FontStyle.Bold, GraphicsUnit.Point, 0);
            TextInputBox.btnCancel.DialogResult = DialogResult.Cancel;
            TextInputBox.btnCancel.FlatStyle = FlatStyle.Standard;
            TextInputBox.btnCancel.Location = new Point(326, 40);
            TextInputBox.btnCancel.Name = "btnCancel";
            TextInputBox.btnCancel.Size = new Size(64, 24);
            TextInputBox.btnCancel.TabIndex = 2;
            TextInputBox.btnCancel.Text = "&Cancel";
            TextInputBox.btnCancel.Click += new EventHandler(TextInputBox.btnCancel_Click);
            TextInputBox.btnCancel.Font = new Font("Tahoma", 8.25f, FontStyle.Bold, GraphicsUnit.Point, 0);
            TextInputBox.txtInput.Location = new Point(8, 100);
            TextInputBox.txtInput.Name = "txtInput";
            TextInputBox.txtInput.Size = new Size(379, 20);
            TextInputBox.txtInput.TabIndex = 0;
            TextInputBox.txtInput.Text = "";
            TextInputBox.txtInput.Font = new Font("Tahoma", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0);
            TextInputBox.frmInputDialog.AutoScaleBaseSize = new Size(5, 13);
            TextInputBox.frmInputDialog.ClientSize = new Size(398, 128);
            TextInputBox.frmInputDialog.Controls.Add(TextInputBox.txtInput);
            TextInputBox.frmInputDialog.Controls.Add(TextInputBox.btnCancel);
            TextInputBox.frmInputDialog.Controls.Add(TextInputBox.btnOK);
            TextInputBox.frmInputDialog.Controls.Add(TextInputBox.lblPrompt);
            TextInputBox.frmInputDialog.FormBorderStyle = FormBorderStyle.FixedDialog;
            TextInputBox.frmInputDialog.MaximizeBox = false;
            TextInputBox.frmInputDialog.MinimizeBox = false;
            TextInputBox.frmInputDialog.Name = "InputBoxDialog";
            TextInputBox.frmInputDialog.ResumeLayout(false);
            TextInputBox.frmInputDialog.AcceptButton = TextInputBox.btnOK;
            TextInputBox.frmInputDialog.ShowInTaskbar = false;
        }

        private static void LoadForm()
        {
            TextInputBox.OutputResponse = DialogResult.Ignore;
            TextInputBox._Text = string.Empty;
            TextInputBox.txtInput.Text = TextInputBox._defaultValue;
            TextInputBox.lblPrompt.Text = TextInputBox._formPrompt;
            TextInputBox.frmInputDialog.Text = TextInputBox._formCaption;
            int num = TextInputBox._ParentFormXPosition + (TextInputBox._ParentFormWidth - 400) / 2;
            int num1 = TextInputBox._ParentFormYPosition + (TextInputBox._ParentFormHeight - 180) / 2;
            Rectangle workingArea = Screen.PrimaryScreen.WorkingArea;
            if (TextInputBox._XPos >= 0 && TextInputBox._XPos < workingArea.Width - 100 && TextInputBox._YPos >= 0 && TextInputBox._YPos < workingArea.Height - 100)
            {
                TextInputBox.frmInputDialog.StartPosition = FormStartPosition.Manual;
                TextInputBox.frmInputDialog.Location = new Point(TextInputBox._XPos, TextInputBox._YPos);
            }
            else if (num < 0 || num >= workingArea.Width - 100 || num1 < 0 || num1 >= workingArea.Height - 100)
            {
                TextInputBox.frmInputDialog.StartPosition = FormStartPosition.CenterScreen;
            }
            else
            {
                TextInputBox.frmInputDialog.StartPosition = FormStartPosition.Manual;
                TextInputBox.frmInputDialog.Location = new Point(num, num1);
            }
            string text = TextInputBox.lblPrompt.Text;
            int num2 = 0;
            int num3 = 0;
            while (text.IndexOf("\n", num3) > -1)
            {
                num3 = text.IndexOf("\n", num3) + 1;
                num2++;
            }
            if (num2 == 0)
            {
                num2 = 1;
            }
            Point location = TextInputBox.txtInput.Location;
            location.Y = location.Y + num2 * 4;
            TextInputBox.txtInput.Location = location;
            Size size = TextInputBox.frmInputDialog.Size;
            size.Height = size.Height + num2 * 4;
            TextInputBox.frmInputDialog.Size = size;
            TextInputBox.txtInput.SelectionStart = 0;
            TextInputBox.txtInput.SelectionLength = TextInputBox.txtInput.Text.Length;
            TextInputBox.txtInput.Focus();
        }

        public DialogResult Show(string Prompt)
        {
            TextInputBox.InitializeComponent();
            TextInputBox.FormPrompt = Prompt;
            this.ShowForm();
            return TextInputBox.OutputResponse;
        }

        public DialogResult Show(string Prompt, string Title)
        {
            TextInputBox.InitializeComponent();
            TextInputBox.FormCaption = Title;
            TextInputBox.FormPrompt = Prompt;
            this.ShowForm();
            return TextInputBox.OutputResponse;
        }

        public DialogResult Show(string Prompt, string Title, string Default)
        {
            TextInputBox.InitializeComponent();
            TextInputBox.FormCaption = Title;
            TextInputBox.FormPrompt = Prompt;
            TextInputBox.DefaultValue = Default;
            this.ShowForm();
            return TextInputBox.OutputResponse;
        }

        public DialogResult Show(string Prompt, string Title, string Default, int DialogBoxXPosition, int DialogBoxYPosition)
        {
            TextInputBox.InitializeComponent();
            TextInputBox.FormCaption = Title;
            TextInputBox.FormPrompt = Prompt;
            TextInputBox.DefaultValue = Default;
            TextInputBox.XPosition = DialogBoxXPosition;
            TextInputBox.YPosition = DialogBoxYPosition;
            this.ShowForm();
            return TextInputBox.OutputResponse;
        }

        public DialogResult Show(string Prompt, string Title, string Default, int ParentFormWidth, int ParentFormHeight, int ParentFormXPosition, int ParentFormYPosition)
        {
            TextInputBox.InitializeComponent();
            TextInputBox.FormCaption = Title;
            TextInputBox.FormPrompt = Prompt;
            TextInputBox.DefaultValue = Default;
            TextInputBox.ParentFrmWidth = ParentFormWidth;
            TextInputBox.ParentFrmHeight = ParentFormHeight;
            TextInputBox.ParentFrmXPosition = ParentFormXPosition;
            TextInputBox.ParentFrmYPosition = ParentFormYPosition;
            this.ShowForm();
            return TextInputBox.OutputResponse;
        }

        private void ShowForm()
        {
            TextInputBox.LoadForm();
            TextInputBox.frmInputDialog.ShowDialog();
        }
    }
}
"@ -ReferencedAssemblies 'System.Windows.Forms.dll','System.Drawing.dll','System.Data.dll','System.Xml.dll'

Add-Type -TypeDefinition @"
using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;

namespace DialogBoxs
{
    public class ComboInputBox
    {
        private static Form frmComboDialog;
        private static Label lblPrompt;
        private static Button btnOK;
        private static Button btnCancel;
        private static ComboBox CmBxComboBox;
        private static string _formCaption;
        private static string _formPrompt;
        private static DialogResult _outputResponse;
        private static string[] _CmBxItems;
        private static int _xPos;
        private static int _yPos;
        private bool _AutoSearch;
        private static string _Text;

        public bool AutoSearch
        {
            get
            {
                return this._AutoSearch;
            }
            set
            {
                this._AutoSearch = value;
            }
        }

        private static string[] ComboBoxItems
        {
            get
            {
                return ComboInputBox._CmBxItems;
            }
            set
            {
                ComboInputBox._CmBxItems = value;
            }
        }

        private static string FormCaption
        {
            set
            {
                ComboInputBox._formCaption = value;
            }
        }

        private static string FormPrompt
        {
            set
            {
                ComboInputBox._formPrompt = value;
            }
        }

        private static DialogResult OutputResponse
        {
            get
            {
                return ComboInputBox._outputResponse;
            }
            set
            {
                ComboInputBox._outputResponse = value;
            }
        }

        public string Text
        {
            get
            {
                return ComboInputBox._Text;
            }
        }

        private static int XPosition
        {
            set
            {
                if (value >= 0)
                {
                    ComboInputBox._xPos = value;
                }
            }
        }

        private static int YPosition
        {
            set
            {
                if (value >= 0)
                {
                    ComboInputBox._yPos = value;
                }
            }
        }

        static ComboInputBox()
        {
            ComboInputBox._formCaption = string.Empty;
            ComboInputBox._formPrompt = string.Empty;
            ComboInputBox._outputResponse = DialogResult.None;
            ComboInputBox._CmBxItems = new string[100];
            ComboInputBox._xPos = -1;
            ComboInputBox._yPos = -1;
            // ComboInputBox._AutoSearch = false;
            ComboInputBox._Text = string.Empty;
        }

        public ComboInputBox()
        {
        }

        private static void btnCancel_Click(object sender, EventArgs e)
        {
            ComboInputBox.OutputResponse = DialogResult.Cancel;
            ComboInputBox._Text = string.Empty;
            ComboInputBox.frmComboDialog.Dispose();
        }

        private static void btnOK_Click(object sender, EventArgs e)
        {
            ComboInputBox.OutputResponse = DialogResult.OK;
            ComboInputBox._Text = ComboInputBox.CmBxComboBox.Text;
            ComboInputBox.frmComboDialog.Dispose();
        }

        private static void CmBxComboBox_KeyPress(object sender, KeyPressEventArgs e)
        {
        }

        private static void CmBxComboBox_TextChanged(object sender, EventArgs e)
        {
        }

        private static void InitializeComponent()
        {
            ComboInputBox.frmComboDialog = new Form();
            ComboInputBox.lblPrompt = new Label();
            ComboInputBox.btnOK = new Button();
            ComboInputBox.btnCancel = new Button();
            ComboInputBox.CmBxComboBox = new ComboBox();
            ComboInputBox.frmComboDialog.SuspendLayout();
            ComboInputBox.lblPrompt.Anchor = AnchorStyles.Top | AnchorStyles.Bottom | AnchorStyles.Left | AnchorStyles.Right;
            ComboInputBox.lblPrompt.BackColor = SystemColors.Control;
            ComboInputBox.lblPrompt.Font = new Font("Microsoft Sans Serif", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0);
            ComboInputBox.lblPrompt.Location = new Point(12, 9);
            ComboInputBox.lblPrompt.Name = "lblPrompt";
            ComboInputBox.lblPrompt.Size = new Size(302, 82);
            ComboInputBox.lblPrompt.TabIndex = 3;
            ComboInputBox.lblPrompt.Font = new Font("Tahoma", 8.25f, FontStyle.Bold, GraphicsUnit.Point, 0);
            ComboInputBox.btnOK.DialogResult = DialogResult.OK;
            ComboInputBox.btnOK.FlatStyle = FlatStyle.Standard;
            ComboInputBox.btnOK.Location = new Point(326, 8);
            ComboInputBox.btnOK.Name = "btnOK";
            ComboInputBox.btnOK.Size = new Size(64, 24);
            ComboInputBox.btnOK.TabIndex = 1;
            ComboInputBox.btnOK.Text = "&OK";
            ComboInputBox.btnOK.Click += new EventHandler(ComboInputBox.btnOK_Click);
            ComboInputBox.btnOK.Font = new Font("Tahoma", 8.25f, FontStyle.Bold, GraphicsUnit.Point, 0);
            ComboInputBox.btnCancel.DialogResult = DialogResult.Cancel;
            ComboInputBox.btnCancel.FlatStyle = FlatStyle.Standard;
            ComboInputBox.btnCancel.Location = new Point(326, 40);
            ComboInputBox.btnCancel.Name = "btnCancel";
            ComboInputBox.btnCancel.Size = new Size(64, 24);
            ComboInputBox.btnCancel.TabIndex = 2;
            ComboInputBox.btnCancel.Text = "&Cancel";
            ComboInputBox.btnCancel.Click += new EventHandler(ComboInputBox.btnCancel_Click);
            ComboInputBox.btnCancel.Font = new Font("Tahoma", 8.25f, FontStyle.Bold, GraphicsUnit.Point, 0);
            ComboInputBox.CmBxComboBox.Location = new Point(8, 100);
            ComboInputBox.CmBxComboBox.Name = "CmBxComboBox";
            ComboInputBox.CmBxComboBox.Size = new Size(379, 20);
            ComboInputBox.CmBxComboBox.TabIndex = 0;
            ComboInputBox.CmBxComboBox.Text = "";
            ComboInputBox.CmBxComboBox.Font = new Font("Tahoma", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0);
            ComboInputBox.CmBxComboBox.TextChanged += new EventHandler(ComboInputBox.CmBxComboBox_TextChanged);
            ComboInputBox.CmBxComboBox.KeyPress += new KeyPressEventHandler(ComboInputBox.CmBxComboBox_KeyPress);
            ComboInputBox.frmComboDialog.AutoScaleBaseSize = new Size(5, 13);
            ComboInputBox.frmComboDialog.ClientSize = new Size(398, 128);
            ComboInputBox.frmComboDialog.Controls.Add(ComboInputBox.CmBxComboBox);
            ComboInputBox.frmComboDialog.Controls.Add(ComboInputBox.btnCancel);
            ComboInputBox.frmComboDialog.Controls.Add(ComboInputBox.btnOK);
            ComboInputBox.frmComboDialog.Controls.Add(ComboInputBox.lblPrompt);
            ComboInputBox.frmComboDialog.FormBorderStyle = FormBorderStyle.FixedDialog;
            ComboInputBox.frmComboDialog.MaximizeBox = false;
            ComboInputBox.frmComboDialog.MinimizeBox = false;
            ComboInputBox.frmComboDialog.Name = "ComboBoxDialog";
            ComboInputBox.frmComboDialog.ResumeLayout(false);
            ComboInputBox.frmComboDialog.AcceptButton = ComboInputBox.btnOK;
        }

        private static void LoadForm()
        {
            ComboInputBox.OutputResponse = DialogResult.Ignore;
            ComboInputBox._Text = string.Empty;
            ComboInputBox.PopulateCombo();
            ComboInputBox.lblPrompt.Text = ComboInputBox._formPrompt;
            ComboInputBox.frmComboDialog.Text = ComboInputBox._formCaption;
            Rectangle workingArea = Screen.PrimaryScreen.WorkingArea;
            if (ComboInputBox._xPos < 0 || ComboInputBox._xPos >= workingArea.Width - 100 || ComboInputBox._yPos < 0 || ComboInputBox._yPos >= workingArea.Height - 100)
            {
                ComboInputBox.frmComboDialog.StartPosition = FormStartPosition.CenterScreen;
            }
            else
            {
                ComboInputBox.frmComboDialog.StartPosition = FormStartPosition.Manual;
                ComboInputBox.frmComboDialog.Location = new Point(ComboInputBox._xPos, ComboInputBox._yPos);
            }
            string text = ComboInputBox.lblPrompt.Text;
            int num = 0;
            int num1 = 0;
            while (text.IndexOf("\n", num1) > -1)
            {
                num1 = text.IndexOf("\n", num1) + 1;
                num++;
            }
            if (num == 0)
            {
                num = 1;
            }
            Point location = ComboInputBox.CmBxComboBox.Location;
            location.Y = location.Y + num * 4;
            ComboInputBox.CmBxComboBox.Location = location;
            Size size = ComboInputBox.frmComboDialog.Size;
            size.Height = size.Height + num * 4;
            ComboInputBox.frmComboDialog.Size = size;
            ComboInputBox.CmBxComboBox.SelectionStart = 0;
            ComboInputBox.CmBxComboBox.SelectionLength = ComboInputBox.CmBxComboBox.Text.Length;
            ComboInputBox.CmBxComboBox.Focus();
        }

        private static void PopulateCombo()
        {
            string[] comboBoxItems = ComboInputBox.ComboBoxItems;
            for (int i = 0; i < (int)comboBoxItems.Length; i++)
            {
                string str = comboBoxItems[i];
                if (str != null)
                {
                    ComboInputBox.CmBxComboBox.Items.Add(str);
                }
            }
        }

        public DialogResult Show(string Prompt, string Title, string[] ComboBoxItems)
        {
            ComboInputBox.InitializeComponent();
            ComboInputBox.FormCaption = Title;
            ComboInputBox.FormPrompt = Prompt;
            ComboInputBox._CmBxItems = ComboBoxItems;
            ComboInputBox.LoadForm();
            ComboInputBox.frmComboDialog.ShowDialog();
            return ComboInputBox.OutputResponse;
        }

        public DialogResult Show(string Prompt, string Title, string[] ComboBoxItems, int XPos, int YPos)
        {
            ComboInputBox.InitializeComponent();
            ComboInputBox.FormCaption = Title;
            ComboInputBox.FormPrompt = Prompt;
            ComboInputBox.ComboBoxItems = ComboBoxItems;
            ComboInputBox.XPosition = XPos;
            ComboInputBox.YPosition = YPos;
            ComboInputBox.LoadForm();
            ComboInputBox.frmComboDialog.ShowDialog();
            return ComboInputBox.OutputResponse;
        }
    }
}
"@ -ReferencedAssemblies 'System.Windows.Forms.dll','System.Drawing.dll','System.Data.dll','System.Xml.dll'

# http://www.codeproject.com/Articles/16186/DialogBoxes
Add-Type -TypeDefinition @"

using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;

namespace DialogBoxs
{
    public class ChangePasswordDialogBox
    {
        private static Form frmInputDialog;
        private static Label lblOldPassword;
        private static Label lblNewPassword;
        private static Label lblConfirmPassword;
        private static Label lblPrompt;
        private static Button btnOk;
        private static Button btnCancel;
        private static TextBox txtbxOldPassword;
        private static TextBox txtbxNewPassword;
        private static TextBox txtbxConfirmPassword;
        private static string _formCaption;
        private static string _PromptMessage;
        private static DialogResult _outputResponse;
        private static string _OldPassword;
        private static int _ParentFormWidth;
        private static int _ParentFormHeight;
        private static int _ParentFormXPosition;
        private static int _ParentFormYPosition;
        private static int _XPos;
        private static int _YPos;
        public static string _NewPassword;
        private static string FormCaption
        {
            set
            {
                ChangePasswordDialogBox._formCaption = value;
            }
        }

        public string NewPassword
        {
            get
            {
                return ChangePasswordDialogBox._NewPassword;
            }
        }

        private static string OldPassword
        {
            get
            {
                return ChangePasswordDialogBox._OldPassword;
            }
            set
            {
                ChangePasswordDialogBox._OldPassword = value;
            }
        }

        private static DialogResult OutputResponse
        {
            get
            {
                return ChangePasswordDialogBox._outputResponse;
            }
            set
            {
                ChangePasswordDialogBox._outputResponse = value;
            }
        }

        private static int ParentFrmHeight
        {
            set
            {
                if (value >= 0)
                {
                    ChangePasswordDialogBox._ParentFormHeight = value;
                }
            }
        }

        private static int ParentFrmWidth
        {
            set
            {
                if (value >= 0)
                {
                    ChangePasswordDialogBox._ParentFormWidth = value;
                }
            }
        }

        private static int ParentFrmXPosition
        {
            set
            {
                if (value >= 0)
                {
                    ChangePasswordDialogBox._ParentFormXPosition = value;
                }
            }
        }

        private static int ParentFrmYPosition
        {
            set
            {
                if (value >= 0)
                {
                    ChangePasswordDialogBox._ParentFormYPosition = value;
                }
            }
        }

        private static string PromptMessage
        {
            get
            {
                return ChangePasswordDialogBox._PromptMessage;
            }
            set
            {
                ChangePasswordDialogBox._PromptMessage = value;
            }
        }

        private static int XPosition
        {
            set
            {
                if (value >= 0)
                {
                    ChangePasswordDialogBox._XPos = value;
                }
            }
        }

        private static int YPosition
        {
            set
            {
                if (value >= 0)
                {
                    ChangePasswordDialogBox._YPos = value;
                }
            }
        }

        static ChangePasswordDialogBox()
        {
            ChangePasswordDialogBox._formCaption = string.Empty;
            ChangePasswordDialogBox._PromptMessage = string.Empty;
            ChangePasswordDialogBox._OldPassword = string.Empty;
            ChangePasswordDialogBox._ParentFormWidth = -1;
            ChangePasswordDialogBox._ParentFormHeight = -1;
            ChangePasswordDialogBox._ParentFormXPosition = -1;
            ChangePasswordDialogBox._ParentFormYPosition = -1;
            ChangePasswordDialogBox._XPos = -1;
            ChangePasswordDialogBox._YPos = -1;
            ChangePasswordDialogBox._NewPassword = string.Empty;
        }

        public ChangePasswordDialogBox()
        {
        }

        private static void btnCancel_Click(object sender, EventArgs e)
        {
            ChangePasswordDialogBox.OutputResponse = DialogResult.Cancel;
            ChangePasswordDialogBox._NewPassword = string.Empty;
            ChangePasswordDialogBox.frmInputDialog.Dispose();
        }

        private static void btnOk_Click(object sender, EventArgs e)
        {
            ChangePasswordDialogBox.OutputResponse = DialogResult.OK;
            if (ChangePasswordDialogBox.txtbxOldPassword.Text.Trim() != ChangePasswordDialogBox.OldPassword)
            {
                MessageBox.Show(ChangePasswordDialogBox.frmInputDialog, "Incorrect Old Password", "LinkSys", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                ChangePasswordDialogBox.txtbxOldPassword.SelectionStart = 0;
                ChangePasswordDialogBox.txtbxOldPassword.SelectionLength = ChangePasswordDialogBox.txtbxOldPassword.Text.Length;
                ChangePasswordDialogBox.txtbxOldPassword.Focus();
            }
            else if (ChangePasswordDialogBox.txtbxNewPassword.Text.Trim() == ChangePasswordDialogBox.txtbxConfirmPassword.Text.Trim())
            {
                ChangePasswordDialogBox._NewPassword = ChangePasswordDialogBox.txtbxNewPassword.Text.Trim();
                ChangePasswordDialogBox.frmInputDialog.Dispose();
            }
            else
            {
                MessageBox.Show(ChangePasswordDialogBox.frmInputDialog, "Password Confirmation Failed", "LinkSys", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                ChangePasswordDialogBox.txtbxConfirmPassword.SelectionStart = 0;
                ChangePasswordDialogBox.txtbxConfirmPassword.SelectionLength = ChangePasswordDialogBox.txtbxConfirmPassword.Text.Length;
                ChangePasswordDialogBox.txtbxConfirmPassword.Focus();
            }
        }

        private static void InitializeComponent()
        {
            ChangePasswordDialogBox.frmInputDialog = new Form();
            ChangePasswordDialogBox.lblOldPassword = new Label();
            ChangePasswordDialogBox.lblNewPassword = new Label();
            ChangePasswordDialogBox.lblPrompt = new Label();
            ChangePasswordDialogBox.lblConfirmPassword = new Label();
            ChangePasswordDialogBox.btnOk = new Button();
            ChangePasswordDialogBox.btnCancel = new Button();
            ChangePasswordDialogBox.txtbxOldPassword = new TextBox();
            ChangePasswordDialogBox.txtbxNewPassword = new TextBox();
            ChangePasswordDialogBox.txtbxConfirmPassword = new TextBox();
            ChangePasswordDialogBox.frmInputDialog.SuspendLayout();
            ChangePasswordDialogBox.lblOldPassword.Font = new Font("Tahoma", 8.25f, FontStyle.Bold, GraphicsUnit.Point, 0);
            ChangePasswordDialogBox.lblOldPassword.Location = new Point(16, 88);
            ChangePasswordDialogBox.lblOldPassword.Name = "lblOldPassword";
            ChangePasswordDialogBox.lblOldPassword.Size = new Size(168, 24);
            ChangePasswordDialogBox.lblOldPassword.TabIndex = 1;
            ChangePasswordDialogBox.lblOldPassword.Text = "Old Password";
            ChangePasswordDialogBox.lblOldPassword.TextAlign = ContentAlignment.MiddleLeft;
            ChangePasswordDialogBox.lblNewPassword.Font = new Font("Tahoma", 8.25f, FontStyle.Bold, GraphicsUnit.Point, 0);
            ChangePasswordDialogBox.lblNewPassword.Location = new Point(16, 112);
            ChangePasswordDialogBox.lblNewPassword.Name = "lblNewPassword";
            ChangePasswordDialogBox.lblNewPassword.Size = new Size(168, 24);
            ChangePasswordDialogBox.lblNewPassword.TabIndex = 2;
            ChangePasswordDialogBox.lblNewPassword.Text = "New Password";
            ChangePasswordDialogBox.lblNewPassword.TextAlign = ContentAlignment.MiddleLeft;
            ChangePasswordDialogBox.lblConfirmPassword.Font = new Font("Tahoma", 8.25f, FontStyle.Bold, GraphicsUnit.Point, 0);
            ChangePasswordDialogBox.lblConfirmPassword.Location = new Point(16, 136);
            ChangePasswordDialogBox.lblConfirmPassword.Name = "lblConfirmPassword";
            ChangePasswordDialogBox.lblConfirmPassword.Size = new Size(168, 24);
            ChangePasswordDialogBox.lblConfirmPassword.TabIndex = 3;
            ChangePasswordDialogBox.lblConfirmPassword.Text = "Confirm New Password";
            ChangePasswordDialogBox.lblConfirmPassword.TextAlign = ContentAlignment.MiddleLeft;
            ChangePasswordDialogBox.lblPrompt.Font = new Font("Tahoma", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0);
            ChangePasswordDialogBox.lblPrompt.Location = new Point(16, 8);
            ChangePasswordDialogBox.lblPrompt.Name = "lblPrompt";
            ChangePasswordDialogBox.lblPrompt.Size = new Size(280, 72);
            ChangePasswordDialogBox.lblPrompt.TabIndex = 9;
            ChangePasswordDialogBox.lblPrompt.TextAlign = ContentAlignment.MiddleLeft;
            ChangePasswordDialogBox.lblPrompt.Font = new Font("Tahoma", 8.25f, FontStyle.Bold, GraphicsUnit.Point, 0);
            ChangePasswordDialogBox.txtbxOldPassword.Font = new Font("Tahoma", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0);
            ChangePasswordDialogBox.txtbxOldPassword.Location = new Point(192, 88);
            ChangePasswordDialogBox.txtbxOldPassword.Name = "txtbxOldPassword";
            ChangePasswordDialogBox.txtbxOldPassword.Size = new Size(184, 21);
            ChangePasswordDialogBox.txtbxOldPassword.TabIndex = 4;
            ChangePasswordDialogBox.txtbxOldPassword.Text = "";
            ChangePasswordDialogBox.txtbxOldPassword.PasswordChar = '*';
            ChangePasswordDialogBox.txtbxNewPassword.Font = new Font("Tahoma", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0);
            ChangePasswordDialogBox.txtbxNewPassword.Location = new Point(192, 112);
            ChangePasswordDialogBox.txtbxNewPassword.Name = "txtbxNewPassword";
            ChangePasswordDialogBox.txtbxNewPassword.Size = new Size(184, 21);
            ChangePasswordDialogBox.txtbxNewPassword.TabIndex = 5;
            ChangePasswordDialogBox.txtbxNewPassword.Text = "";
            ChangePasswordDialogBox.txtbxNewPassword.PasswordChar = '*';
            ChangePasswordDialogBox.txtbxConfirmPassword.Font = new Font("Tahoma", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0);
            ChangePasswordDialogBox.txtbxConfirmPassword.Location = new Point(192, 136);
            ChangePasswordDialogBox.txtbxConfirmPassword.Name = "txtbxConfirmPassword";
            ChangePasswordDialogBox.txtbxConfirmPassword.Size = new Size(184, 21);
            ChangePasswordDialogBox.txtbxConfirmPassword.TabIndex = 6;
            ChangePasswordDialogBox.txtbxConfirmPassword.Text = "";
            ChangePasswordDialogBox.txtbxConfirmPassword.PasswordChar = '*';
            ChangePasswordDialogBox.btnOk.Font = new Font("Tahoma", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0);
            ChangePasswordDialogBox.btnOk.Location = new Point(312, 16);
            ChangePasswordDialogBox.btnOk.Name = "btnOk";
            ChangePasswordDialogBox.btnOk.Size = new Size(64, 24);
            ChangePasswordDialogBox.btnOk.TabIndex = 7;
            ChangePasswordDialogBox.btnOk.Text = "Ok";
            ChangePasswordDialogBox.btnOk.Click += new EventHandler(ChangePasswordDialogBox.btnOk_Click);
            ChangePasswordDialogBox.btnCancel.Font = new Font("Tahoma", 8.25f, FontStyle.Regular, GraphicsUnit.Point, 0);
            ChangePasswordDialogBox.btnCancel.Location = new Point(312, 48);
            ChangePasswordDialogBox.btnCancel.Name = "btnCancel";
            ChangePasswordDialogBox.btnCancel.Size = new Size(64, 24);
            ChangePasswordDialogBox.btnCancel.TabIndex = 8;
            ChangePasswordDialogBox.btnCancel.Text = "Cancel";
            ChangePasswordDialogBox.btnCancel.Click += new EventHandler(ChangePasswordDialogBox.btnCancel_Click);
            ChangePasswordDialogBox.frmInputDialog.AutoScaleBaseSize = new Size(5, 13);
            ChangePasswordDialogBox.frmInputDialog.ClientSize = new Size(400, 182);
            ChangePasswordDialogBox.frmInputDialog.Controls.Add(ChangePasswordDialogBox.txtbxOldPassword);
            ChangePasswordDialogBox.frmInputDialog.Controls.Add(ChangePasswordDialogBox.txtbxNewPassword);
            ChangePasswordDialogBox.frmInputDialog.Controls.Add(ChangePasswordDialogBox.txtbxConfirmPassword);
            ChangePasswordDialogBox.frmInputDialog.Controls.Add(ChangePasswordDialogBox.btnCancel);
            ChangePasswordDialogBox.frmInputDialog.Controls.Add(ChangePasswordDialogBox.btnOk);
            ChangePasswordDialogBox.frmInputDialog.Controls.Add(ChangePasswordDialogBox.lblPrompt);
            ChangePasswordDialogBox.frmInputDialog.Controls.Add(ChangePasswordDialogBox.lblOldPassword);
            ChangePasswordDialogBox.frmInputDialog.Controls.Add(ChangePasswordDialogBox.lblNewPassword);
            ChangePasswordDialogBox.frmInputDialog.Controls.Add(ChangePasswordDialogBox.lblConfirmPassword);
            ChangePasswordDialogBox.frmInputDialog.FormBorderStyle = FormBorderStyle.FixedDialog;
            ChangePasswordDialogBox.frmInputDialog.MaximizeBox = false;
            ChangePasswordDialogBox.frmInputDialog.MinimizeBox = false;
            ChangePasswordDialogBox.frmInputDialog.Name = "InputBoxDialog";
            ChangePasswordDialogBox.frmInputDialog.ResumeLayout(false);
            ChangePasswordDialogBox.frmInputDialog.AcceptButton = ChangePasswordDialogBox.btnOk;
            ChangePasswordDialogBox.frmInputDialog.StartPosition = FormStartPosition.CenterScreen;
            ChangePasswordDialogBox.frmInputDialog.ShowInTaskbar = false;
        }

        private static void LoadForm()
        {
            ChangePasswordDialogBox.OutputResponse = DialogResult.Ignore;
            ChangePasswordDialogBox._NewPassword = string.Empty;
            ChangePasswordDialogBox.lblPrompt.Text = ChangePasswordDialogBox.PromptMessage;
            ChangePasswordDialogBox.lblOldPassword.Text = "Old Password";
            ChangePasswordDialogBox.lblNewPassword.Text = "New Password";
            ChangePasswordDialogBox.lblConfirmPassword.Text = "Confirm New Password";
            ChangePasswordDialogBox.txtbxOldPassword.Text = "";
            ChangePasswordDialogBox.txtbxNewPassword.Text = "";
            ChangePasswordDialogBox.txtbxConfirmPassword.Text = "";
            ChangePasswordDialogBox.frmInputDialog.Text = ChangePasswordDialogBox._formCaption;
            int num = ChangePasswordDialogBox._ParentFormXPosition + (ChangePasswordDialogBox._ParentFormWidth - 400) / 2;
            int num1 = ChangePasswordDialogBox._ParentFormYPosition + (ChangePasswordDialogBox._ParentFormHeight - 180) / 2;
            Rectangle workingArea = Screen.PrimaryScreen.WorkingArea;
            if (ChangePasswordDialogBox._XPos >= 0 && ChangePasswordDialogBox._XPos < workingArea.Width - 100 && ChangePasswordDialogBox._YPos >= 0 && ChangePasswordDialogBox._YPos < workingArea.Height - 100)
            {
                ChangePasswordDialogBox.frmInputDialog.StartPosition = FormStartPosition.Manual;
                ChangePasswordDialogBox.frmInputDialog.Location = new Point(ChangePasswordDialogBox._XPos, ChangePasswordDialogBox._YPos);
            }
            else if (num < 0 || num >= workingArea.Width - 100 || num1 < 0 || num1 >= workingArea.Height - 100)
            {
                ChangePasswordDialogBox.frmInputDialog.StartPosition = FormStartPosition.CenterScreen;
            }
            else
            {
                ChangePasswordDialogBox.frmInputDialog.StartPosition = FormStartPosition.Manual;
                ChangePasswordDialogBox.frmInputDialog.Location = new Point(num, num1);
            }
            ChangePasswordDialogBox.txtbxOldPassword.Focus();
        }

        public DialogResult Show(string Prompt, string Title, string Password)
        {
            ChangePasswordDialogBox.InitializeComponent();
            ChangePasswordDialogBox.FormCaption = Title;
            ChangePasswordDialogBox.PromptMessage = Prompt;
            ChangePasswordDialogBox.OldPassword = Password;
            this.ShowForm();
            return ChangePasswordDialogBox.OutputResponse;
        }

        public DialogResult Show(string Prompt, string Title, string Password, int DialogBoxXPosition, int DialogBoxYPosition)
        {
            ChangePasswordDialogBox.InitializeComponent();
            ChangePasswordDialogBox.FormCaption = Title;
            ChangePasswordDialogBox.PromptMessage = Prompt;
            ChangePasswordDialogBox.OldPassword = Password;
            ChangePasswordDialogBox.XPosition = DialogBoxXPosition;
            ChangePasswordDialogBox.YPosition = DialogBoxYPosition;
            this.ShowForm();
            return ChangePasswordDialogBox.OutputResponse;
        }

        public DialogResult Show(string Prompt, string Title, string Password, int ParentFormWidth, int ParentFormHeight, int ParentFormXPosition, int ParentFormYPosition)
        {
            ChangePasswordDialogBox.InitializeComponent();
            ChangePasswordDialogBox.FormCaption = Title;
            ChangePasswordDialogBox.PromptMessage = Prompt;
            ChangePasswordDialogBox.OldPassword = Password;
            ChangePasswordDialogBox.ParentFrmWidth = ParentFormWidth;
            ChangePasswordDialogBox.ParentFrmHeight = ParentFormHeight;
            ChangePasswordDialogBox.ParentFrmXPosition = ParentFormXPosition;
            ChangePasswordDialogBox.ParentFrmYPosition = ParentFormYPosition;
            this.ShowForm();
            return ChangePasswordDialogBox.OutputResponse;
        }

        private void ShowForm()
        {
            ChangePasswordDialogBox.LoadForm();
            ChangePasswordDialogBox.frmInputDialog.ShowDialog();
        }
    }
}
"@ -ReferencedAssemblies 'System.Windows.Forms.dll','System.Drawing.dll','System.Data.dll','System.Xml.dll'

Add-Type -TypeDefinition @" 

// "
using System;
using System.Windows.Forms;
public class Win32Window : IWin32Window
{
    private IntPtr _hWnd;
    private string _data;

    public string Data
    {
        get { return _data; }
        set { _data = value; }
    }

    public Win32Window(IntPtr handle)
    {
        _hWnd = handle;
    }

    public IntPtr Handle
    {
        get { return _hWnd; }
    }
}

"@ -ReferencedAssemblies 'System.Windows.Forms.dll'


@( 'System.Drawing','System.Windows.Forms') | ForEach-Object { [void][System.Reflection.Assembly]::LoadWithPartialName($_) }


$shared_assemblies = @(
  'nunit.framework.dll'
)

$shared_assemblies_path = 'c:\developer\sergueik\csharp\SharedAssemblies'

if (($env:SHARED_ASSEMBLIES_PATH -ne $null) -and ($env:SHARED_ASSEMBLIES_PATH -ne '')) {
  $shared_assemblies_path = $env:SHARED_ASSEMBLIES_PATH
}

pushd $shared_assemblies_path

$shared_assemblies | ForEach-Object {

  if ($host.Version.Major -gt 2) {
    Unblock-File -Path $_;
  }
  Write-Debug $_
  Add-Type -Path $_
}
popd

$caller = New-Object Win32Window -ArgumentList ([System.Diagnostics.Process]::GetCurrentProcess().MainWindowHandle)

$f = New-Object -TypeName 'System.Windows.Forms.Form'
$f.Text = $title
$f.SuspendLayout()




#   Form1
$f.AutoScaleDimensions = New-Object System.Drawing.SizeF (6.0,13.0)
$f.AutoScaleMode = [System.Windows.Forms.AutoScaleMode]::Font
$f.ClientSize = New-Object System.Drawing.Size (610,440)

$b1 = New-Object System.Windows.Forms.Button
$b1.Location = New-Object System.Drawing.Size (130,10)
$b1.Size = New-Object System.Drawing.Size (75,23)
$b1.Text = 'Test 1'
$b1.add_click({
    $countries = @(
      "India",
      "USA",
      "UK",
      "Russia",
      "Bulgaria",
      "Singapore",
      "Malayasia",
      "Japan",
      "Thailand"
    )

    $o = New-Object -TypeName 'DialogBoxs.ComboInputBox'
    $prompt_message = 'Select or Enter the Country'
    $caption = 'combo test'
    [void]$o.Show($prompt_message,$caption,$countries)
    $caller.Data = $o.Text
    #  $f.Close()
  })
$f.Controls.Add($b1)

$b2 = New-Object System.Windows.Forms.Button
$b2.Location = New-Object System.Drawing.Size (130,40)
$b2.Size = New-Object System.Drawing.Size (75,23)
$b2.Text = 'Test 2'
$b2.add_click({
    $o = New-Object -TypeName 'DialogBoxs.ChangePasswordDialogBox'
    $prompt_message = 'Enter the Details to Change Password'
    $caption = 'password test'
    $old_password = '123'

    [void]$o.Show($prompt_message,$caption,$old_password)
    $caller.Data = $o.Text
    # $f.Close()
  })
$f.Controls.Add($b2)



$b3 = New-Object System.Windows.Forms.Button
$b3.Location = New-Object System.Drawing.Size (130,70)
$b3.Size = New-Object System.Drawing.Size (75,23)
$b3.Text = 'Test 3'
$b3.add_click({
    $o = New-Object -TypeName 'DialogBoxs.TextInputBox'
    $prompt_message = 'Enter the Value'
    $caption = 'inputbox test'

    [void]$o.Show($prompt_message,$caption)
    $caller.Data = $o.Text
    # $f.Close()
  })
$f.Controls.Add($b3)



$f.Name = "Form1"
$f.Text = "XmlTreeView"
$f.ResumeLayout($false)

$f.Topmost = $Trues

$f.Add_Shown({ $f.Activate() })

[void]$f.ShowDialog($caller)

$f.Dispose()
write-output     $caller.Data 
