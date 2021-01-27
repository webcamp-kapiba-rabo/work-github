module ApplicationHelper
  # 税抜きの金額を引数とする
  def convert_to_taxed(price)
    (price * 1.1).round
  end
end
