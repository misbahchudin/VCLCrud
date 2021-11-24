inherited fJenisBarang: TfJenisBarang
  Caption = ' Jenis Barang'
  PixelsPerInch = 96
  TextHeight = 15
  inherited Panel1: TPanel
    object Kode: TLabeledEdit
      Left = 129
      Top = 26
      Width = 338
      Height = 22
      EditLabel.Width = 27
      EditLabel.Height = 15
      EditLabel.Caption = 'Kode'
      LabelPosition = lpLeft
      TabOrder = 1
      Text = ''
    end
    object Nama: TLabeledEdit
      Left = 129
      Top = 53
      Width = 338
      Height = 22
      EditLabel.Width = 32
      EditLabel.Height = 15
      EditLabel.Caption = 'Nama'
      LabelPosition = lpLeft
      TabOrder = 2
      Text = ''
    end
    object Button2: TButton
      Left = 89
      Top = 130
      Width = 75
      Height = 25
      Action = Insert
      TabOrder = 3
    end
  end
  inherited ActionList1: TActionList
    inherited Insert: TAction
      OnExecute = InsertExecute
    end
  end
end
