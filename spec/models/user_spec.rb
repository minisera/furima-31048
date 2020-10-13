require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '内容に問題がある場合' do
    it "nicknameが空と登録できない"do
    @user.nickname = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end
    it "first_nameが空と登録できない"do
    @user.first_name = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end
    it "first_nameが半角英数字だと登録できない"do
    @user.first_name = "a1a1a1"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name Full-width characters")
  end
  it "last_nameが空と登録できない"do
  @user.last_name = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Last name can't be blank")
end
    it "last_nameが半角英数字だと登録できない"do
    @user.last_name = "a1a1a1"
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name Full-width characters")
    end
    it "first_name_katakanaが空と登録できない"do
    @user.first_name_katakana = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("First name katakana can't be blank")
  end
    it "first_name_katakanaがカタカナ以外では登録できない"do
    @user.first_name_katakana = "あああああ"
    @user.valid?
    expect(@user.errors.full_messages).to include('First name katakana Full-width katakana characters')
  end
  it "last_name_katakanaが空と登録できない"do
  @user.last_name_katakana = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
end
  it "last_name_katakanaがカタカナ以外では登録できない"do
  @user.last_name_katakana = "あああああ"
  @user.valid?
  expect(@user.errors.full_messages).to include('Last name katakana Full-width katakana characters')
  end
    it "birthdayが空と登録できない"do
    @user.birthday = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end
    it "emailが空と登録できない"do
    @user.email = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end
  it "重複したemailが存在する場合登録できない" do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
  end
  it "emailに＠がない場合登録できない" do
    @user.email = "aaaaaaa"
    @user.valid?
  end
  it "passwordが空と登録できない"do
    @user.password = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  it "passwordが６文字以上でなければ登録できない"do
    @user.password = "a1a1a"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end
  it "passwordが英数字両方含んでいなければ登録できない"do
    @user.password = "aaaaaa"
    @user.valid?
    expect(@user.errors.full_messages).to include('Password Include both letters and numbers' )
  end
  it "password_confirmationが空と登録できない"do
    @user.password_confirmation = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
  end
end
  context '内容に問題がない場合' do
    it '全て正常' do
      expect(@user.valid?).to eq true
    end
  end
end


end
