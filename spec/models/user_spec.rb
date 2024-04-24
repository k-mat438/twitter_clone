# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  # 単体テスト
  # 名前、メール、電話番号,生年月日,パスワードがあれば有効な状態であること
  it 'is valid with a name, email, and password' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  # 名前がなければ無効な状態であること
  it 'is invalid without a name' do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  # 名前が10字以上であると登録できない
  it 'is invalid if name is more than 6 characters' do
    user = FactoryBot.build(:user, name: '12345678910')
    user.valid?
    expect(user.errors[:name]).to include('is too long (maximum is 10 characters)')
  end

  # メールアドレスがなければ無効な状態であること
  it 'is invalid without an email address' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  # 重複したメールアドレスなら無効な状態であること
  it 'is invalid with a duplicate email address' do
    FactoryBot.create(:user, email: 'testerx@example.com')
    user1 = FactoryBot.build(:user, email: 'testerx@example.com')
    user1.valid?
    expect(user1.errors[:email]).to include('has already been taken')
  end

  # 電話番号がなければ無効な状態であること
  it 'is invalid without a phone number' do
    user = FactoryBot.build(:user, phone_number: nil)
    user.valid?
    expect(user.errors[:phone_number]).to include("can't be blank")
  end

  # 重複した電話番号なら無効な状態であること
  it 'is invalid with a duplicate phone number' do
    FactoryBot.create(:user, phone_number: 123_123)
    user1 = FactoryBot.build(:user, phone_number: 123_123)
    user1.valid?
    expect(user1.errors[:phone_number]).to include('has already been taken')
  end

  # 生年月日がなければ無効な状態であること
  it 'is invalid without a birthday' do
    user = FactoryBot.build(:user, birth: nil)
    user.valid?
    expect(user.errors[:birth]).to include("can't be blank")
  end

  # パスワードがなければ無効な状態であること
  it 'is invalid without a psaaword' do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  # パスワードが6字未満であると登録できない
  it 'is invalid if password is less than 6 characters' do
    user = FactoryBot.build(:user, password: 12_345)
    user.valid?
    expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
  end
end
