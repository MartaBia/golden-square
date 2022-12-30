require 'secret_diary'

RSpec.describe SecretDiary do
  context "initially" do
    it "does not read the diary by default" do
      diary = double :diary 
      secret_diary = SecretDiary.new(diary)
      expect{ secret_diary.read }.to raise_error "Go away!"
    end
  end

  context "when it is unlocked" do
    it "returns the entry if the secret diary is unlocked" do
      diary = double :diary, read: "Not so secret contents"
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect(secret_diary.read).to eq "Not so secret contents"
    end
  end

  context "when relocked" do
    it "does not read because it is relocked" do
      diary = double :diary
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      secret_diary.lock
      expect{ secret_diary.read }.to raise_error "Go away!"
    end
  end
end